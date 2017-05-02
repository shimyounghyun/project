package a.b.sport.vo;

import java.util.Date;

public class MatchWaitVO {
private int board_id;
private String board_date;
private int board_teamidx;
private int teamidx;
private String teamname;
private Date regdate;
private String content;
private int idx;
public int getBoard_id() {
	return board_id;
}
public void setBoard_id(int board_id) {
	this.board_id = board_id;
}
public String getBoard_date() {
	return board_date;
}
public void setBoard_date(String board_date) {
	this.board_date = board_date;
}
public int getBoard_teamidx() {
	return board_teamidx;
}
public void setBoard_teamidx(int board_teamidx) {
	this.board_teamidx = board_teamidx;
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
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
@Override
public String toString() {
	return "MatchWaitVO [board_id=" + board_id + ", board_date=" + board_date + ", board_teamidx=" + board_teamidx
			+ ", teamidx=" + teamidx + ", teamname=" + teamname + ", regdate=" + regdate + ", content=" + content
			+ ", idx=" + idx + "]";
}

}
