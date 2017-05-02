package a.b.sport.vo;

import java.util.Date;

public class NoticeCommentVO {
private int idx;
private int board_id;
private String writer;
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
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
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
	return "NoticeCommentVO [idx=" + idx + ", board_id=" + board_id + ", writer=" + writer + ", pw=" + pw + ", content="
			+ content + ", img=" + img + ", regdate=" + regdate + "]";
}


}
