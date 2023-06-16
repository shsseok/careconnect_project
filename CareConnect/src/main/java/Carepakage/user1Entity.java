package Carepakage;
//환자,일반사용자들의 회원가입을 위한 회원가입정보입니다. 
public class user1Entity {
 private int id;
 private String name;
 private String email;
 private String sex;
 private String phone;
 private String password;
 public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
private String sickpart;
 private String who;
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
public String getSickpart() {
	return sickpart;
}
public void setSickpart(String sickpart) {
	this.sickpart = sickpart;
}
public String getWho() {
	return who;
}
public void setWho(String who) {
	this.who = who;
}
 
}
