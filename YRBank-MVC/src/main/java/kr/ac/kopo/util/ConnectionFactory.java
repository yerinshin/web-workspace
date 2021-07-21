package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	
	public Connection getConnection() { //return type : Connection
		
		Connection conn = null;
		
		try {
			//1�ܰ�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2�ܰ�
			String url = "jdbc:oracle:thin:@192.168.217.202:1521/kopoda";
			String user = "da2112";
			String password = "da12";
			
			conn = DriverManager.getConnection(url ,user, password);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}

}

