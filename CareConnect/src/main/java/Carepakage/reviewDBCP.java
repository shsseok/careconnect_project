package Carepakage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class reviewDBCP {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public reviewDBCP()
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
	public boolean insertreviewDB(reviewEntity review) {
	    boolean success = false;
	    connect();
	    
	    String sql = "insert into review (user_email, expert_email, username, rating, review) values(?, ?, ?, ?, ?)"; 
	    
	    try {
	        
	    	pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, review.getUser_email());
	        pstmt.setString(2, review.getExpert_email());
	        pstmt.setString(3, review.getUsername());
	        pstmt.setInt(4, review.getRating());
	        pstmt.setString(5, review.getReview());
	        
	        pstmt.executeUpdate();
	        success = true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return success;
	    } finally {
	        disconnect();
	    }
	    
	    return success;
	}
	
	public ArrayList<reviewEntity> getReviewList(String expertemail) {	
		connect();
		ArrayList<reviewEntity> list = new ArrayList<reviewEntity>();
	
		String SQL = "select * from review where expert_email=?";
		

		try {
			
			
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, expertemail);
			ResultSet rs = pstmt.executeQuery();
			
			

			while (rs.next()) {
				reviewEntity review = new reviewEntity();
				
				review.setUsername(rs.getString("username"));
				review.setReview(rs.getString("review"));
				review.setRating(rs.getInt("rating"));
				

				list.add(review);
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
	public ArrayList<reviewEntity> getReviewEntireList() {	
		connect();
		ArrayList<reviewEntity> list = new ArrayList<reviewEntity>();
	
		String SQL = "select * from review";
		

		try {
			
			
			pstmt = con.prepareStatement(SQL);
			
			ResultSet rs = pstmt.executeQuery();
			
			

			while (rs.next()) {
				reviewEntity review = new reviewEntity();
				
				review.setUsername(rs.getString("username"));
				review.setReview(rs.getString("review"));
				review.setRating(rs.getInt("rating"));
				review.setReviewid(rs.getInt("reviewid"));
				

				list.add(review);
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
	public reviewEntity getAvgRating(String expertemail) {	
		connect();
		reviewEntity review=new reviewEntity();
	
		String SQL = "select AVG(rating) as avg_rating from review where expert_email=?";
		

		try {
			
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, expertemail);
			ResultSet rs = pstmt.executeQuery();
			
			
			
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				
				review.setAvgrating(rs.getDouble("avg_rating"));
			}
			
			
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return review;
	}
	public ArrayList<reviewEntity> getBestReviewList() {	//평점이 5점인것만 main베스트 이용후기에 보여주기 위해서
		connect();
		ArrayList<reviewEntity> list = new ArrayList<reviewEntity>();
		
		String SQL = "SELECT review.*, user2.name AS expert_name FROM review INNER JOIN user2 ON review.expert_email = user2.email WHERE rating = 5";//경력이 5인 전문가 이름을 가져오기 위해서

		try {
			pstmt = con.prepareStatement(SQL);
			
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				reviewEntity review = new reviewEntity();
				
				review.setUsername ( rs.getString("username") );
				review.setReview ( rs.getString("review") );
				review.setRating ( rs.getInt("rating") );
				review.setExpertname ( rs.getString("expert_name") );
				
				list.add(review);
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