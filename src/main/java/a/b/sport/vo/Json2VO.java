package a.b.sport.vo;

import java.util.Arrays;

public class Json2VO {
	public SGG_List[] SGG_LIST;
	public String en_sd_nm;
	public String sd_cd;
	public String sd_nm;
	public SGG_List[] getSGG_LIST() {
		return SGG_LIST;
	}
	public void setSGG_LIST(SGG_List[] sGG_LIST) {
		SGG_LIST = sGG_LIST;
	}
	public String getEn_sd_nm() {
		return en_sd_nm;
	}
	public void setEn_sd_nm(String en_sd_nm) {
		this.en_sd_nm = en_sd_nm;
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
	@Override
	public String toString() {
		return "Json2VO [SGG_LIST=" + Arrays.toString(SGG_LIST) + ", en_sd_nm=" + en_sd_nm + ", sd_cd=" + sd_cd
				+ ", sd_nm=" + sd_nm + "]";
	}
	public Json2VO() {
		super();
	}

}
