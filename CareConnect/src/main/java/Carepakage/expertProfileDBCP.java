package Carepakage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class expertProfileDBCP {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	
	public expertProfileDBCP()
	{
		try {
			InitialContext ctx = new InitialContext();
		    ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	public void connect() {
		try {
		    con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public expertProfile getExpertprofile(String email) { //전문가의 프로필을 찾기 위해서도 쓰이지만 전문가가 처음 가입했을 때 프로필이 생성되지 않았다면 전문가는 
	    connect();										  //매칭 시스템을 사용할 수 없게 된다. 이를 방지 하기 위해서 해당전문가가 회원가입 후 바로 프로필 생성을 할 수 있도록 
	    												  //loginaction.jsp에서 로그인을 했을 때 프로필을 생성하도록 지원한다. 
	    String SQL = "select * from expertprofile where email = ?";
	    expertProfile exp = null;
	    
	    try {
	        pstmt = con.prepareStatement(SQL);
	        pstmt.setString(1, email);
	        ResultSet rs = pstmt.executeQuery();
	        
	        if(rs.next()) {  // rs에 데이터가 있을 때만, 값을 가져와서 expertProfile 객체를 생성합니다.
	            exp = new expertProfile();
	            exp.setName(rs.getString("name"));
	            exp.setSex(rs.getString("sex"));
	            exp.setPhone(rs.getString("phone"));
	            exp.setStrengthpart(rs.getString("strengthpart"));
	            exp.setCareer(rs.getInt("career"));
	            exp.setPlace(rs.getString("place"));
	            exp.setIntroduction(rs.getString("introduction"));
	            exp.setServiceskill(rs.getString("serviceskill"));
	            exp.setOnlineservice(rs.getString("onlineservice"));    
	            exp.setExperience(rs.getString("experience"));    
	            exp.setServicecategory(rs.getString("servicecategory"));
	        }
	        else 
	        {
	        return null;	
	        }
	        rs.close();            
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    finally {
	        disconnect();
	    }
	    return exp; 
	}

	public boolean updateprofileDB(expertProfile profile,String email) {
		boolean success = false; 
		connect();		
		String sql ="update expertprofile set name=?, sex=?, phone=?,strengthpart=?, career=?, place=? ,introduction=?, serviceskill=?, "
				+ "onlineservice=?, experience=?,servicecategory=? where email=?";	
		try {
			pstmt = con.prepareStatement(sql);
			// 인자로 받은 GuestBook 객체를 이용해 사용자가 수정한 값을 가져와 SQL문 완성
			pstmt.setString(1, profile.getName());
			pstmt.setString(2, profile.getSex());
			pstmt.setString(3, profile.getPhone());
			pstmt.setString(4,  profile.getStrengthpart());
			pstmt.setInt(5,  profile.getCareer());
			pstmt.setString(6,  profile.getPlace());
			pstmt.setString(7,  profile.getIntroduction());
			pstmt.setString(8,  profile.getServiceskill());
			pstmt.setString(9,  profile.getOnlineservice());
			pstmt.setString(10,  profile.getExperience());
			pstmt.setString(11,  profile.getServicecategory());
			pstmt.setString(12,  email);
			int rowUdt = pstmt.executeUpdate();
			//System.out.println(rowUdt);
			if (rowUdt == 1) success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}
	public boolean deleteprofileDB(String email) { //현재 삭제는 쓰이지 않는다 ..만들어놓은 이유는 혹시 나중에 필요할 수 도 있을꺼 같에서이다. 왜냐면 식별자인 email이 외래키로 지정되어있어서 회원정보가 탈퇴되면 자동으로 프로필은 없어진다.
		boolean success = false; 
		connect();		
		String sql ="delete from expertprofile where email=?";
		try {
			pstmt = con.prepareStatement(sql);
			// 인자로 받은 주 키인 id 값을 이용해 삭제
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}
	public boolean insertprofileDB(expertProfile profile,String email) {
		boolean success = false; 
		connect();
		String sql ="insert into expertprofile values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, profile.getId());
			pstmt.setString(2,  profile.getStrengthpart());
			pstmt.setInt(3,  profile.getCareer());
			pstmt.setString(4,  profile.getPlace());
			pstmt.setString(5,  profile.getIntroduction());
			pstmt.setString(6,  profile.getServiceskill());
			pstmt.setString(7,  profile.getOnlineservice());
			pstmt.setString(8,  profile.getExperience());
			pstmt.setString(9,  email);
			pstmt.setString(10,  profile.getServicecategory());
			pstmt.setString(11, profile.getName());
			pstmt.setString(12, profile.getSex());
			pstmt.setString(13, profile.getPhone());
			pstmt.executeUpdate();
			success = true; 
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}
	public ArrayList<expertProfile> getExpertList(String sickpart,String servicecategory) {	
		connect();
		ArrayList<expertProfile> list = new ArrayList<expertProfile>();
		
		String SQL = "select * from expertprofile where strengthpart = ? AND servicecategory=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, sickpart);
			pstmt.setString(2, servicecategory);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				expertProfile expert = new expertProfile();
				
				expert.setName ( rs.getString("name") );
				expert.setCareer(rs.getInt("career"));
				expert.setPlace( rs.getString("place") );
				expert.setOnlineservice(rs.getString("onlineservice"));
				expert.setEmail( rs.getString("email") );								
				//리스트에 추가
				list.add(expert);
			}
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	public ArrayList<expertProfile> getFilterExpertList(String career,  String onlineservice,String servicecategory, String sex, String sickpart) {	//매칭 페이지에서 필터링을 위해 쓸 리스트
		connect();
		ArrayList<expertProfile> list = new ArrayList<expertProfile>();
		ArrayList<Object> parameter = new ArrayList<Object>();
		StringBuilder SQL = new StringBuilder("SELECT * FROM expertprofile WHERE 1=1 ");
		int careerInt=0;
		if(career !=null && !career.isEmpty())
		{
			careerInt =Integer.parseInt(career);
			SQL.append(" AND career=?");
			parameter.add(careerInt);
			
		}
		if(onlineservice!=null && !onlineservice.isEmpty())
		{
			SQL.append(" AND onlineservice=?");
			parameter.add(onlineservice);
		}
		if(servicecategory !=null && !servicecategory.isEmpty())
		{
			SQL.append(" AND servicecategory=?");
			parameter.add(servicecategory);
		}
		if(sex !=null && !sex.isEmpty())
		{
			SQL.append(" AND sex=?");
			parameter.add(sex);
		}
		if(sickpart !=null && !sickpart.isEmpty())
		{
			SQL.append(" AND strengthpart=?");
			parameter.add(sickpart);
		}
		try {
			pstmt = con.prepareStatement(SQL.toString());
			 // ? 데이터베이스 에 들어갈 순서
			for(int i=0;i<parameter.size();i++)
			{
				pstmt.setObject(i+1, parameter.get(i));
			}
			
			ResultSet rs = pstmt.executeQuery();
			
			
				
			
			while (rs.next()) {
				expertProfile expert = new expertProfile();
				
				expert.setName ( rs.getString("name") );
				expert.setCareer(rs.getInt("career"));
				expert.setPlace( rs.getString("place") );
				expert.setOnlineservice(rs.getString("onlineservice"));
				expert.setEmail( rs.getString("email") );								
				//리스트에 추가
				list.add(expert);
			}
			rs.close();	
			if(list.isEmpty())
			{
				return list;//행이 없으면 빈 리스트 반환
			}
			
			
					
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	public ArrayList<expertProfile> getExpertboard() {	
		connect();
		ArrayList<expertProfile> list = new ArrayList<expertProfile>();
		
		String SQL = "select * from expertprofile";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				expertProfile expert = new expertProfile();
				
				expert.setName ( rs.getString("name") );
				expert.setCareer(rs.getInt("career"));
				expert.setPlace( rs.getString("place") );
				expert.setOnlineservice(rs.getString("onlineservice"));
				expert.setEmail( rs.getString("email") );								
				//리스트에 추가
				list.add(expert);
			}
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
}

