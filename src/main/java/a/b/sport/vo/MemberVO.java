package a.b.sport.vo;

public class MemberVO {
private int idx;
private String userid;
private String password;
private String username;
private String selOne;
private String selTwo;
private int teamNum;
private String thumnail;
public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getSelOne() {
	return selOne;
}
public void setSelOne(String selOne) {
	this.selOne = selOne;
}
public String getSelTwo() {
	return selTwo;
}
public void setSelTwo(String selTwo) {
	this.selTwo = selTwo;
}
public int getTeamNum() {
	return teamNum;
}
public void setTeamNum(int teamNum) {
	this.teamNum = teamNum;
}
public String getThumnail() {
	return thumnail;
}
public void setThumnail(String thumnail) {
	this.thumnail = thumnail;
}
@Override
public String toString() {
	return "MemberVO [idx=" + idx + ", userid=" + userid + ", password=" + password + ", username=" + username
			+ ", selOne=" + selOne + ", selTwo=" + selTwo + ", teamNum=" + teamNum + ", thumnail=" + thumnail + "]";
}



}
