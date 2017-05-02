package a.b.sport.vo;

public class MatchVO {
private int idx;
private String matchday;
private String matchhour;
private String matchmin;
private String money;
private String content;
private String area;
private int teamidx;
private String teamname;
private String teamarea1;
private String teamarea2;
private String teamimg;
private int count;
public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
public String getMatchday() {
	return matchday;
}
public void setMatchday(String matchday) {
	this.matchday = matchday;
}
public String getMatchhour() {
	return matchhour;
}
public void setMatchhour(String matchhour) {
	this.matchhour = matchhour;
}
public String getMatchmin() {
	return matchmin;
}
public void setMatchmin(String matchmin) {
	this.matchmin = matchmin;
}
public String getMoney() {
	return money;
}
public void setMoney(String money) {
	this.money = money;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getArea() {
	return area;
}
public void setArea(String area) {
	this.area = area;
}
public int getTeamidx() {
	return teamidx;
}
public void setTeamidx(int teamidx) {
	this.teamidx = teamidx;
}
public String getTeamname() {
	return teamname;
}
public void setTeamname(String teamname) {
	this.teamname = teamname;
}
public String getTeamarea1() {
	return teamarea1;
}
public void setTeamarea1(String teamarea1) {
	this.teamarea1 = teamarea1;
}
public String getTeamarea2() {
	return teamarea2;
}
public void setTeamarea2(String teamarea2) {
	this.teamarea2 = teamarea2;
}
public String getTeamimg() {
	return teamimg;
}
public void setTeamimg(String teamimg) {
	this.teamimg = teamimg;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
@Override
public String toString() {
	return "MatchVO [idx=" + idx + ", matchday=" + matchday + ", matchhour=" + matchhour + ", matchmin=" + matchmin
			+ ", money=" + money + ", content=" + content + ", area=" + area + ", teamidx=" + teamidx + ", teamname="
			+ teamname + ", teamarea1=" + teamarea1 + ", teamarea2=" + teamarea2 + ", teamimg=" + teamimg + ", count="
			+ count + "]";
}

}
