package a.b.sport.vo;

public class SGG_List {
private String en_sgg_nm;
private String sd_cd;
private String sd_nm;
private String sgg_cd;
private String sgg_nm;
public String getEn_sgg_nm() {
	return en_sgg_nm;
}
public void setEn_sgg_nm(String en_sgg_nm) {
	this.en_sgg_nm = en_sgg_nm;
}
public String getSd_cd() {
	return sd_cd;
}
public void setSd_cd(String sd_cd) {
	this.sd_cd = sd_cd;
}
public String getSd_nm() {
	return sd_nm;
}
public void setSd_nm(String sd_nm) {
	this.sd_nm = sd_nm;
}
public String getSgg_cd() {
	return sgg_cd;
}
public void setSgg_cd(String sgg_cd) {
	this.sgg_cd = sgg_cd;
}
public String getSgg_nm() {
	return sgg_nm;
}
public void setSgg_nm(String sgg_nm) {
	this.sgg_nm = sgg_nm;
}
@Override
public String toString() {
	return "JsonVO [en_sgg_nm=" + en_sgg_nm + ", sd_cd=" + sd_cd + ", sd_nm=" + sd_nm + ", sgg_cd=" + sgg_cd
			+ ", sgg_nm=" + sgg_nm + "]";
}
public SGG_List() {
	super();
}


}
