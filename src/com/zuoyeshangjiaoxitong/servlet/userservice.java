package com.zuoyeshangjiaoxitong.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zuoyeshangjiaoxitong.connect.connect;

public class userservice {
	private Connection conn;
	private PreparedStatement pstmt;
	public userservice() {
		conn = new connect().getConnect();
	}
	
public boolean isLogin(String stuId,String userpassword,int utype) {
		try {
			pstmt=conn.prepareStatement("select * from usertable where stuId=? and password=? and utypeid=?");
			pstmt.setString(1, stuId);
			pstmt.setString(2, userpassword);
			pstmt.setInt(3, utype);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				return true;
			else
				return false;
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}				
	}
}

