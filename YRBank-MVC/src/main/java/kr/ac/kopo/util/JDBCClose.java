package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.Statement;

public class JDBCClose {
	
	//PreparedStatement �� ���� ������ Statement ����� ���� �ֱ� ������ Statement ��ü�� ���� ����
	//PreparedStatement�� Statement��ü ��� �ޱ� ������ ��� ����(������ ����ȯ)
	public static void close(Connection conn, Statement pstmt) {
		
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
	}
}
