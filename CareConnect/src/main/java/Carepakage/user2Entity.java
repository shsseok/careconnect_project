package Carepakage;
//전문가사용자들의 회원가입을 위한 회원가입정보입니다. 
public class user2Entity {
	 private int id;
	 private String name;
	 private String email;
	 private String sex;
	 private String phone;
	 private int career;
	 private String password;
	 private String strengthpart;
	 private String place;
	 private String expertport;
	public String getExpertport() {
		return expertport;
	}
	public void setExpertport(String expertport) {
		this.expertport = expertport;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getCareer() {
		return career;
	}
	public void setCareer(int career) {
		this.career = career;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStrengthpart() {
		return strengthpart;
	}
	public void setStrengthpart(String strengthpart) {
		this.strengthpart = strengthpart;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
}
