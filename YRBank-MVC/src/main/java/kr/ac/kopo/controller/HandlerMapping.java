package kr.ac.kopo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
	Map<String, Controller> mappings;
	
	public HandlerMapping() {
		this("C:\\Users\\HP\\Desktop\\java\\web-workspace\\YRBank-MVC\\bean.properties");
	}
	
	public HandlerMapping(String propLoc) {
		
		mappings = new HashMap<>();
		Properties prop = new Properties();		//properties 객체 생성
		
		try {
			
			InputStream is = new FileInputStream(propLoc);
			prop.load(is);				//properties 파일을 스트림으로 읽어 멤버변수 프로퍼티에 적재
			
			Set<Object> keys = prop.keySet();
			
			for(Object key : keys) {
				System.out.println(key);
				String className = prop.getProperty(key.toString());
				System.out.println(className);
				
				Class<?> clz = Class.forName(className); //어떠한 클래스가 로딩 될지 모르기 때문에 Class 클래스의 forName()함수를 이용해서 해당 클래스를 메모리로 로드
			
				mappings.put(key.toString(), (Controller)clz.newInstance());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}

}
