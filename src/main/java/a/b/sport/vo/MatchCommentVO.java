package a.b.sport.vo;

import java.util.Date;

public class MatchCommentVO {
private int idx;
private int board_id;
private String username;
private String pw;
private String content;
private String img;
private Date regdate;
public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
public int getBoard_id() {
	return board_id;
}
public void setBoard_id(int board_id) {
	this.board_id = board_id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
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
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
@Override
public String toString() {
	return "MatchComment [idx=" + idx + ", board_id=" + board_id + ", username=" + username + ", pw=" + pw
			+ ", content=" + content + ", img=" + img + ", regdate=" + regdate + "]";
}

}
