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
		//최소 안전장치 : proLoc이 null일 경우엔 저 경로로 실행
		this("C:\\Users\\HP\\Desktop\\java\\web-workspace\\Mission-Web-MVC01\\bean.properties");
	}
	
	public HandlerMapping(String propLoc) {
		
		mappings = new HashMap<>();
		Properties prop = new Properties();		//properties 객체 생성
		
		try {
		
//		InputStream is = new FileInputStream("C:\\Users\\HP\\Desktop\\java\\web-workspace\\Mission-Web-MVC01\\bean.properties");	//inputstream으로 파일 읽어오기
		InputStream is = new FileInputStream(propLoc);
		
		prop.load(is);		//properties 파일을 스트림으로 읽어 멤버변수 프로퍼티에 적재
		
		//properties가 가지고 있는 key값들의 집합
		Set<Object> keys = prop.keySet();
		
		for(Object key : keys) {
	//		System.out.println(key);
			String className = prop.getProperty(key.toString());	//properties의 key값들은 string, key변수는 Object형이라 형변환 필요
	//		System.out.println(className);
			
			Class<?> clz = Class.forName(className);	//어떠한 클래스가 로딩 될지 모르기 때문에 Class 클래스의 forName()함수를 이용해서 해당 클래스를 메모리로 로드
			
			mappings.put(key.toString(), (Controller)clz.newInstance());	//형변환 하기전엔 Object형
		}
		
	//	System.out.println(prop.getProperty("/board/list.do"));		//해당 key에 해당하는 value값 return : kr.ac.kopo.controller.BoardListController
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
	
/*
	public static void main(String[] args) {
		
		try {
			//<?> 어떤 형태이던 상관없다.
			Class<?> clz = Class.forName("kr.ac.kopo.controller.BoardListController");
			//reflection -> 객체생성 : = new BoardListController(); 와 같음
			BoardListController list = (BoardListController)clz.newInstance();	
			//spring : <bean class="kr.ac.kopo.controller.BoardController" id="list"/> 가 위와 동일
			
			System.out.println(list.handleRequest(null, null));
			System.out.println(list);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
*/
}
