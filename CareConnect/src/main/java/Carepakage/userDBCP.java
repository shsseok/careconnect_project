package Carepakage;
//일반사용자와 전문가들의 회원가입을 위한 DBCP입니다. 회원가입과 프로필은 따로 구분해 두었고 전문가들은 기본적으로 회원가입 후 프로필을 등록을 해야지만 이용가능합니다.
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import Carepakage.user1Entity;


public class userDBCP {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	
	public userDBCP()
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
	public String insertDB(user1Entity user1) {
		
		connect();
		String sql ="insert into user1 values(0, ?, ?, ?, ?, ?, ?, ?)";		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user1.getName());
			pstmt.setString(2, user1.getEmail());
			pstmt.setString(3, user1.getSex());
			pstmt.setString(4, user1.getPhone());
			pstmt.setString(5, user1.getSickpart());
			pstmt.setString(6, user1.getPassword());
			pstmt.setString(7, user1.getWho());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			if (e.getMessage().contains("Duplicate entry")) {
	            if (isDuplicateEmail(user1.getEmail())) {
	                return "이메일이 이미 사용 중입니다.";
	            } 
	            
	        }
		}
		finally {
			disconnect();
		}
		return "회원가입에 성공 하셨습니다.";
	}
	
	public String insertDB2(user2Entity user2) {
		 
		connect();
		String sql ="insert into user2 values(0, ?, ?, ?, ?, ?, ?, ?, ?, ?)";		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user2.getName());
			pstmt.setString(2, user2.getEmail());
			pstmt.setString(3, user2.getSex());
			pstmt.setString(4, user2.getPhone());
			pstmt.setInt(5, user2.getCareer());
			pstmt.setString(6, user2.getPassword());
			pstmt.setString(7, user2.getStrengthpart());
			pstmt.setString(8, user2.getPlace());
			pstmt.setString(9, user2.getExpertport());
			pstmt.executeUpdate();
			 
		} catch (SQLException e) {
			e.printStackTrace();
			if (e.getMessage().contains("Duplicate entry")) {
	            if (isDuplicateEmail(user2.getEmail()) && isDuplicateExpertPort(user2.getExpertport())) {
	                return "전문가 포트와 이메일 둘다 사용중 입니다.";
	            } else if (isDuplicateExpertPort(user2.getExpertport())) {
	                return "전문가 포트가 이미 사용 중입니다.";
	            }
	            else if(isDuplicateEmail(user2.getEmail()))
	            {
	            	return "이메일이 이미 사용 중입니다.";
	            }
	            
	        }
		}
		finally {
			disconnect();
		}
		return "회원가입에 성공 하셨습니다.";
	}
	private boolean isDuplicateExpertPort(String expertport) {//전문가 포트번호 중복확인 입니다.
	   if(searchExpertport(expertport))
	   {
		   return true;
	   }
	   else
	   {
		   return false;
	   }
	}
	private boolean isDuplicateEmail(String email)//전문가의 이메일 중복확인 입니다.
	{
		if(getUser2(email)!=null)
		{
			return true;
		}
		else 
		{
			return false;
		}
	}
	private boolean isDuplicateEmail1(String email)//일반 사용자 이메일 중복확인 입니다
	{
		if(getUser1(email)!=null)
		{
			return true;
		}
		else 
		{
			return false;
		}
	}
	
	public boolean searchExpertport(String expertport) {	//현재 user2테이블(전문가 테이블에 전문가 포트번호가 존재하는지 확인하는 과정)
		connect();
		String SQL = "select expertport from user2 where expertport = ?";
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, expertport);
			ResultSet rs = pstmt.executeQuery();			
			if(rs.next())
			{
				return true;
				
			}
				
			
			rs.close();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return false;
	}

	
	public boolean isPasswd(String email,String passwd, String expertport, String clientType) {//사용자의 정보와 전문가의 정보가 모두 일치하는 것이 있다면 true반환
	    boolean success = false;
	    connect();    
	    String sql="";
	    if(clientType.equals("normal")) 
	    {
	        sql = "select email, password from user1 where email=?";
	    }
	    else if(clientType.equals("expert")) 
	    {
	        sql = "select email, password, expertport from user2 where email=?";
	    }
	    
	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, email);
	        ResultSet rs = pstmt.executeQuery();
	        rs.next();
	        String orgEmail = rs.getString(1);
	        String orgPasswd = rs.getString(2);
	      

	        if(clientType.equals("normal")) {
	            if (passwd.equals(orgPasswd) &&  email.equals(orgEmail)) success = true;
	        } else if(clientType.equals("expert")) {
	            String orgAdminPass = rs.getString(3);
	            if (passwd.equals(orgPasswd) && expertport.equals(orgAdminPass) &&  email.equals(orgEmail)) success = true;
	        }

	        System.out.println(success);
	        rs.close();            
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return success;
	    }
	    finally {
	        disconnect();
	    }
	    return success;
	}
	
	public user1Entity getUser1(String email) {	
		connect();
		String SQL = "select * from user1 where email = ?";
		user1Entity user1 = new user1Entity();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();			
			rs.next();
			user1.setId ( rs.getInt("id") );
			user1.setName ( rs.getString("name") );
			user1.setEmail( rs.getString("email") );
			user1.setSex ( rs.getString("sex") );
			user1.setPhone ( rs.getString("phone") );
			user1.setPassword ( rs.getString("password") );	
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} 
		finally {
			disconnect();
		}
		return user1;
	}
	
	public user2Entity getUser2(String email) {	
		connect();
		String SQL = "select * from user2 where email = ?";
		user2Entity user2 = new user2Entity();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();			
			rs.next();
			user2.setId ( rs.getInt("id") );
			user2.setName ( rs.getString("name") );
			user2.setEmail( rs.getString("email") );
			user2.setSex ( rs.getString("sex") );
			user2.setPhone ( rs.getString("phone") );
			user2.setCareer ( rs.getInt("career") );	
			user2.setPassword ( rs.getString("password") );	
			user2.setStrengthpart ( rs.getString("strengthpart") );
			user2.setPlace ( rs.getString("place") );
			user2.setExpertport ( rs.getString("expertport") );
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} 
		finally {
			disconnect();
		}
		return user2;
	}
	public ArrayList<user1Entity> getUser1List() {	
		connect();
		ArrayList<user1Entity> list = new ArrayList<user1Entity>();
		
		String SQL = "select * from user1";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				user1Entity user1 = new user1Entity();
				
				user1.setId ( rs.getInt("id") );
				user1.setName ( rs.getString("name") );
				user1.setEmail( rs.getString("email") );
				user1.setSex ( rs.getString("sex") );
				user1.setPhone ( rs.getString("phone") );
				user1.setPassword ( rs.getString("password") );
				user1.setSickpart(rs.getString("sickpart"));
				user1.setWho(rs.getString("who"));
				//리스트에 추가
				list.add(user1);
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
	public ArrayList<user2Entity> getUser2List() {	
		connect();
		ArrayList<user2Entity> list = new ArrayList<user2Entity>();
		
		String SQL = "select * from user2";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				user2Entity user2 = new user2Entity();
				
				user2.setId ( rs.getInt("id") );
				user2.setName ( rs.getString("name") );
				user2.setEmail( rs.getString("email") );
				user2.setSex ( rs.getString("sex") );
				user2.setPhone ( rs.getString("phone") );
				user2.setCareer ( rs.getInt("career") );	
				user2.setPassword ( rs.getString("password") );	
				user2.setStrengthpart ( rs.getString("strengthpart") );
				user2.setPlace ( rs.getString("place") );
				user2.setExpertport ( rs.getString("expertport") );					
				//리스트에 추가
				list.add(user2);
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
	public boolean deleteUser2DB(String email) {
		boolean success = false; 
		connect();		
		String sql ="delete from user2 where email=?";
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
	
	
	public int getUserCount() {	 //일반 환자 사용자의 수
        connect();
        String SQL = "SELECT COUNT(*) FROM user1";
        int count = 0;

        try {
        	pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();	

            if(rs.next()) {
                count = rs.getInt(1);
            }

            rs.close();	
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        
        return count;
    }

    public int getExpertCount() {// 전문가의 가입자의 수
        connect();
        String SQL = "SELECT COUNT(*) FROM user2";
        int count = 0;

        try {
        	pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        
        return count;
    }
}
