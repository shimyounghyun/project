package a.b.sport.vo;

import java.io.File;
import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class LocationUtil {
private String location[] = null;
private String lo[][] = null;

public String[] getArea1(String path){
	ObjectMapper mapper = new ObjectMapper();
	Json2VO[] json2VO;
	try {
		json2VO = mapper.readValue(new File(path), Json2VO[].class);
		String location[] = new String[json2VO.length];
		lo = new String[json2VO.length][];
		for(int i=0; i<json2VO.length;i++){
			location[i] = json2VO[i].sd_nm;
			}
		return location;
	} catch (JsonParseException e) {
		e.printStackTrace();
	} catch (JsonMappingException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	return location; 
}
public String[][] getArea2(String path){
	ObjectMapper mapper = new ObjectMapper();
	Json2VO[] json2VO;
	try {
		json2VO = mapper.readValue(new File(path), Json2VO[].class);
		lo = new String[json2VO.length][];
		for(int i=0; i<json2VO.length;i++){
			lo[i] = new String[json2VO[i].SGG_LIST.length];
			for(int j=0; j<json2VO[i].SGG_LIST.length;j++){
				lo[i][j] = json2VO[i].SGG_LIST[j].getSgg_nm();
			}
		}
		return lo;
	} catch (JsonParseException e) {
		e.printStackTrace();
	} catch (JsonMappingException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	return lo; 
}

}
