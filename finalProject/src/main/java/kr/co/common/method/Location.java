package kr.co.common.method;

public class Location {
	
	public String getLoccode(String addr) {
		
		String [] array=addr.split(" ");
		String code=array[0];
		if(array[0].equals("제주특별자치도")) {
			code="제주도";
		}
		return code;
	}
}
