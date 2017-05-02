package a.b.sport.vo;

import java.util.Date;

public class ChatLogVO {
private int teamnum;
private String userid;
private String content;
private String img;
private String regdate;
public int getTeamnum() {
	return teamnum;
}
public void setTeamnum(int teamnum) {
	this.teamnum = teamnum;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}
@Override
public String toString() {
	return "ChatLogVO [teamnum=" + teamnum + ", userid=" + userid + ", content=" + content + ", img=" + img
			+ ", regdate=" + regdate + "]";
}



}
