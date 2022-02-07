package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	private DBManager() {
	}
	
	public static Connection getConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
//			String url="jdbc:mysql://mydb.cc0o3psomglm.us-east-2.rds.amazonaws.com:3305/shop?serverTimeZone=UTC";
//			String user="admin";
//			String password="2KFeZTwCZQe2JbzgzhHw";
//			//아마존 서버 이용시 상당히 로딩이 길어짐 오하이오
		
			
			String url="jdbc:mysql://mydb.cm2tv0mujt5s.ap-northeast-2.rds.amazonaws.com:3306/shop?serverTimeZone=UTC";
			String user="admin";
			String password="2KFeZTwCZQe2JbzgzhHw";
//			//아마존 서버 서울
			
			
//			String url = "jdbc:mysql://localhost:3306/shop?serverTimeZone=UTC";
//			String user = "root";
//			String password = "root";
			
			conn=DriverManager.getConnection(url,user,password);
			if(conn!=null) {
				System.out.println("loginserver 연동성공");
			}
		} catch (Exception e) {
		
			e.printStackTrace();
		} 
		return conn;
	}
}
