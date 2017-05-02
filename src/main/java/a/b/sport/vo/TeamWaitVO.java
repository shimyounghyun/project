package a.b.sport.vo;

public class TeamWaitVO {
private int teamidx;
private int useridx;
private String username;
private String userid;
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
@Override
public String toString() {
	return "TeamWaitVO [teamidx=" + teamidx + ", useridx=" + useridx + ", username=" + username + ", userid=" + userid
			+ "]";
}


}
