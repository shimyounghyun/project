package a.b.sport.vo;

import java.util.Date;

public class TeamVO {
private int teamidx;
private String name;
private String content;
private String selOne;
private String selTwo;
private Date regdate;
private String img;
private int teamCount;
public int getTeamidx() {
	return teamidx;
}
public void setTeamidx(int teamidx) {
	this.teamidx = teamidx;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
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
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public int getTeamCount() {
	return teamCount;
}
public void setTeamCount(int teamCount) {
	this.teamCount = teamCount;
}
@Override
public String toString() {
	return "TeamVO [teamidx=" + teamidx + ", name=" + name + ", content=" + content + ", selOne=" + selOne + ", selTwo="
			+ selTwo + ", regdate=" + regdate + ", img=" + img + ", teamCount=" + teamCount + "]";
}

}
