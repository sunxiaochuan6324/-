package com.zuoyeshangjiaoxitong.connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class connect {
	
	public Connection getConnect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost3306/zuoyeshangjiaoxitong";
			String user = "root";
			String password = "mysql";
			Connection conn = DriverManager.getConnection(url, user, password);
			//System.out.print(conn.getMetaData().getURL());
			return conn;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

}
