package Carepakage;

public class reviewEntity {
	private int reviewid;
	private String user_email;
	private String expert_email;
	private int rating;
	private String review;
	private String username;
	private String expertname;
	private Double avgrating;
	public Double getAvgrating() {
		return avgrating;
	}
	public void setAvgrating(Double avgrating) {
		this.avgrating = avgrating;
	}
	public String getExpertname() {
		return expertname;
	}
	public void setExpertname(String expertname) {
		this.expertname = expertname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getReviewid() {
		return reviewid;
	}
	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getExpert_email() {
		return expert_email;
	}
	public void setExpert_email(String expert_email) {
		this.expert_email = expert_email;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
}
