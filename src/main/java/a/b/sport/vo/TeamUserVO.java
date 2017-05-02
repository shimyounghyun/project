package a.b.sport.vo;

public class TeamUserVO {
private int teamidx;
private int useridx;
private String username;
private String userid;
private int lv;
private int count;
public int getTeamidx() {
	return teamidx;
}
public void setTeamidx(int teamidx) {
	this.teamidx = teamidx;
}
public int getUseridx() {
	return useridx;
}
public void setUseridx(int useridx) {
	this.useridx = useridx;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public int getLv() {
	return lv;
}
public void setLv(int lv) {
	this.lv = lv;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
@Override
public String toString() {
	return "TeamUser [teamidx=" + teamidx + ", useridx=" + useridx + ", username=" + username + ", userid=" + userid
			+ ", lv=" + lv + ", count=" + count + "]";
}

}
