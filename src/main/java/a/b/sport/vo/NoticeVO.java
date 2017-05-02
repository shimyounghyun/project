package a.b.sport.vo;

import java.util.Date;

public class NoticeVO {
	private int idx;
	private String subject;
	private String content;
	private Date regdate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "NoticeVO [idx=" + idx + ", subject=" + subject + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
	
}
