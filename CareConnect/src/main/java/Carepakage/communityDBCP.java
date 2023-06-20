package Carepakage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class communityDBCP {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public communityDBCP()
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
	public String getDate()//서버에서 현재 날짜 시간을 가져오는 함수 입니다.
	{
		
		String SQL = "SELECT NOW()";
	    
	    
	    try {
	    	PreparedStatement localPstmt = con.prepareStatement(SQL);
	        ResultSet rs = localPstmt.executeQuery();
	         if(rs.next())
	         {
	        	 return rs.getString(1);//시간을 리턴
	         }
	         rs.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	   
	    return "";
	    
	}
	public int getIdNext()
	{
		
		String SQL = "select boardid from community order by boardid desc";//내림차순 정렬후에 맨 위에 있는 즉 맨 마지막에 있는 레이블 번호를 가져온다
	    try {
	    	PreparedStatement localPstmt2 = con.prepareStatement(SQL);
	        ResultSet rs = localPstmt2.executeQuery();
	         if(rs.next())
	         {
	        	 return rs.getInt(1)+1;//마지막 번호에 1을 더해 번호를 추가
	         }
	         
	         rs.close();
	         return 1; //게시물이 아예 없을때 즉 게시물 처음생성할 때 1을 전달
	         
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }  
	    
	    return -1;
	    
	}
	public boolean boardWrite(communityEntity board)//게시물 쓰기 메소드 입니다
	{
		connect();
		boolean success = false; 
		String SQL = "insert into community values(?,?,?,?,?,?,?,?,?)";
	    
	    try {
	    	pstmt = con.prepareStatement(SQL);
	        pstmt.setInt(1,getIdNext());
	        pstmt.setString(2,board.getUserName());
	        pstmt.setString(3,board.getBoardTitle());
	        pstmt.setString(4,board.getBoardContent());
	        pstmt.setInt(5,1);//1이들어가면 존재 삭제x	       
	        pstmt.setString(6,getDate());
	        pstmt.setString(7,board.getEmail());
	        pstmt.setString(8,board.getExpertport());
	        pstmt.setString(9,board.getClienttype());
	        
	        
	       
	        pstmt.executeUpdate();
			success = true;             
	    } catch (SQLException e) {
	        e.printStackTrace();
	        success = false;
	    } 
	    finally {
	        disconnect();
	    }
	    return success; 
	}
	public ArrayList<communityEntity> getBoardSearchList(int page,String query) {//게시물 검색 메소드 입니다
	    connect();
	    String SQL = "select * from community where boardid < ? AND boardavailable = 1 AND boardtitle LIKE ? ORDER BY boardid desc limit 10";
	    ArrayList<communityEntity> board = new ArrayList<communityEntity>();
	    
	    try {
	        pstmt = con.prepareStatement(SQL);
	        pstmt.setInt(1,getIdNext()-(page-1)*10);
	        pstmt.setString(2, "%" + query + "%");

	        ResultSet rs = pstmt.executeQuery();
	        
	        while(rs.next()) {  // rs에 데이터가 있을 때만, 값을 가져와서 expertProfile 객체를 생성합니다.
	            communityEntity brd=new communityEntity();
	            brd.setBoardId(rs.getInt("boardid"));
	            brd.setUserName(rs.getString("username"));
	            brd.setBoardTitle(rs.getString("boardtitle"));
	            brd.setBoardContent(rs.getString("boardcontent"));
	            brd.setBoardAvailable(rs.getInt("boardavailable"));
	            brd.setBoardDate(rs.getString("boarddate"));
	            
	            board.add(brd);
	        }
	        rs.close();            
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    finally {
	        disconnect();
	    }
	    return board; 
	}
	public ArrayList<communityEntity> getBoardList(int page) {
	    connect();
	    String SQL = "select * from community where boardid < ? AND boardavailable = 1 ORDER BY boardid desc limit 10";
	    ArrayList<communityEntity> board = new ArrayList<communityEntity>();
	    
	    try {
	        pstmt = con.prepareStatement(SQL);
	        pstmt.setInt(1,getIdNext()-(page-1)*10); 
	        ResultSet rs = pstmt.executeQuery();
	        
	        while(rs.next()) {  // rs에 데이터가 있을 때만, 값을 가져와서 expertProfile 객체를 생성합니다.
	            communityEntity brd=new communityEntity();
	            brd.setBoardId(rs.getInt("boardid"));
	            brd.setUserName(rs.getString("username"));
	            brd.setBoardTitle(rs.getString("boardtitle"));
	            brd.setBoardContent(rs.getString("boardcontent"));
	            brd.setBoardAvailable(rs.getInt("boardavailable"));
	            brd.setBoardDate(rs.getString("boarddate"));
	           
	            board.add(brd);
	        }
	        rs.close();            
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    finally {
	        disconnect();
	    }
	    return board; 
	}
	public ArrayList<communityEntity> getBoardentireList() {
	    connect();
	    String SQL = "select * from community";
	    ArrayList<communityEntity> board = new ArrayList<communityEntity>();
	    
	    try {
	        pstmt = con.prepareStatement(SQL);
	        ResultSet rs = pstmt.executeQuery();
	        
	        while(rs.next()) {  // rs에 데이터가 있을 때만, 값을 가져와서 expertProfile 객체를 생성합니다.
	            communityEntity brd=new communityEntity();
	            brd.setBoardId(rs.getInt("boardid"));
	            brd.setUserName(rs.getString("username"));
	            brd.setBoardTitle(rs.getString("boardtitle"));
	            brd.setBoardContent(rs.getString("boardcontent"));
	            brd.setBoardAvailable(rs.getInt("boardavailable"));
	            brd.setBoardDate(rs.getString("boarddate"));
	            brd.setClienttype(rs.getString("clienttype"));
	           
	            board.add(brd);
	        }
	        rs.close();            
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    finally {
	        disconnect();
	    }
	    return board; 
	}
	public boolean nextPage(int page)
	{
		   connect();
		    String SQL = "select * from community where boardid < ? AND boardavailable = 1 ORDER BY boardid desc limit 10";
		    
		    
		    try {
		        pstmt = con.prepareStatement(SQL);
		        pstmt.setInt(1,getIdNext()-(page-1)*10); 
		        ResultSet rs = pstmt.executeQuery();
		        
		        if(rs.next()) { 
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
	public communityEntity getBoard(int boardid)
	{
		connect();
	    String SQL = "select * from community where boardid=?";
	    
	    
	    try {
	        pstmt = con.prepareStatement(SQL);
	        pstmt.setInt(1,boardid); 
	        ResultSet rs = pstmt.executeQuery();
	        
	        if(rs.next()) {  // rs에 데이터가 있을 때만, 값을 가져와서 expertProfile 객체를 생성합니다.
	        	communityEntity brd=new communityEntity();
	            brd.setBoardId(rs.getInt("boardid"));
	            brd.setUserName(rs.getString("username"));
	            brd.setBoardTitle(rs.getString("boardtitle"));
	            brd.setBoardContent(rs.getString("boardcontent"));
	            brd.setBoardAvailable(rs.getInt("boardavailable"));
	            brd.setBoardDate(rs.getString("boarddate"));
	            brd.setExpertport(rs.getString("expertport"));
	            brd.setEmail(rs.getString("email"));
	            brd.setClienttype(rs.getString("clienttype"));
	            return brd;
	            
	        }
	        rs.close();            
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    finally {
	        disconnect();
	    }
	    return null;
	}

	public boolean updateBoardDB(communityEntity board) {
		boolean success = false; 
		connect();		
		String sql ="update community set username=?, boardtitle=?, boardcontent=? where boardid=?";	
		try {
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, board.getUserName());
			pstmt.setString(2, board.getBoardTitle());
			pstmt.setString(3, board.getBoardContent());
			pstmt.setInt(4, board.getBoardId());
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
	public boolean deleteboardDB(int boardid) 
	{ 
		
		boolean success = false; 
		connect();		
		String sql ="update community set boardavailable = 0 where boardid=?";
		try {
			pstmt = con.prepareStatement(sql);
			// 인자로 받은 주 키인 id 값을 이용해 삭제
			pstmt.setInt(1, boardid);
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
	
}
