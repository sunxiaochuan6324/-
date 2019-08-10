package com.zuoyeshangjiaoxitong.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class t_Servlet {
	private Connection conn;
	private PreparedStatement pstmt;

	public t_Servlet() {
		conn = new com.zuoyeshangjiaoxitong.connect.connect().getConnect();
	}
	
	//����ʦ����һ���µ���ҵ
	public boolean addHomework(homeworkTable ht){
		try{
			pstmt=conn.prepareStatement("insert into hwtable" 
										+ "(homeworkname,homeworkpath,homeworkdesc) " 
										+ "values(?,?,?)");
			pstmt.setString(1, ht.getHomeworkname());
			pstmt.setString(2, ht.getHomeworkpath());
			pstmt.setString(3, ht.getHomeworkdesc());
			pstmt.executeUpdate();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	//��ʦ�鿴�Ѿ����ù���ȫ����ҵ
	public List queryHw() {
		List array = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from hwtable");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				homeworkTable hw = new homeworkTable();
				hw.setHomeworkid(rs.getInt(1));
				hw.setHomeworkname(rs.getString(2));
				hw.setHomeworkpath(rs.getString(3));
				hw.setHomeworkdesc(rs.getString(4));
				array.add(hw);

			}
			return array;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	
	//��ʦ�鿴ĳһ����ҵ���Ͻ����
	public List queryStuHw(int homeworkid) {
		List array0 = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from user_hwtable where homeworkid=?");
			pstmt.setInt(1, homeworkid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				user_hwTable uhw = new user_hwTable();
				uhw.setUserid(rs.getInt(1));
				uhw.setHomeworkid(rs.getInt(2));
				uhw.setHomeworkname(rs.getString(3));
				uhw.setHomeworkpath(rs.getString(4));
				uhw.setHomeworkgrade(rs.getInt(5));
				uhw.setUsername(rs.getString(6));
				uhw.setStuId(rs.getString(7));
				uhw.setMyhwname(rs.getString(8));
				uhw.setId(rs.getInt(9));
				array0.add(uhw);

			}
			return array0;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	
	//��ʦͨ��ѧ����ѧ�ź���ҵ��ID�õ���Ӧ�ļ�¼�������ѧ��������ҵ�ĳɼ�
	public boolean addGrade(int homeworkgrade,String stuId,int homeworkid){
		if(homeworkgrade>0){
		try{
			pstmt=conn.prepareStatement("update user_hwtable set homeworkgrade=? where stuId=? and homeworkid=?");
			pstmt.setInt(1, homeworkgrade);
			pstmt.setString(2, stuId);
			pstmt.setInt(3, homeworkid);
			pstmt.executeUpdate();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
		}
		else 
			return false;
	}
	
	//��ʦͨ��homeworkidɾ��һ����ҵ��¼
	public boolean deleteHw(int homeworkid) {     //�˴��������о�һ���ü������ߴ�����������ɾ��

		try {
			pstmt = conn.prepareStatement("delete from hwtable where homeworkid=?");
			pstmt.setInt(1, homeworkid);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("delete from user_hwtable where homeworkid=?");
			pstmt.setInt(1, homeworkid);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
	
	//��ʦ�鿴ѧ����Ϣ��
	public List t_queryuser() {
		List user = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from usertable");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				userTable ut = new userTable();
				ut.setUser_id(rs.getInt(1));
				ut.setUser_name(rs.getString(2));
				ut.setUser_password(rs.getString(3));
				ut.setUser_type_id(rs.getInt(4));
				ut.setUtypename(rs.getString(5));
				ut.setUser_email(rs.getString(6));
				ut.setStuId(rs.getString(7));
				user.add(ut);

			}
			return user;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	
	//ͨ��ID��������ѧ����Ϣ
	public userTable t_queryById(int user_id){
		try{
			pstmt = conn.prepareStatement("select * from usertable where userid=?");
			pstmt.setInt(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				userTable ut = new userTable();
				ut.setUser_id(rs.getInt(1));
				ut.setUser_name(rs.getString(2));
				ut.setUser_password(rs.getString(3));
				ut.setUser_type_id(rs.getInt(4));
				ut.setUtypename(rs.getString(5));
				ut.setUser_email(rs.getString(6));
				ut.setStuId(rs.getString(7));
				return ut;
			}
			return null;
		}
		catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	//ͨ��ѧ��������ѧ����Ϣ
		public userTable t_queryBystuId(String stuId){
			try{
				pstmt = conn.prepareStatement("select * from usertable where stuId=?");
				pstmt.setString(1, stuId);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					userTable ut = new userTable();
					ut.setUser_id(rs.getInt(1));
					ut.setUser_name(rs.getString(2));
					ut.setUser_password(rs.getString(3));
					ut.setUser_type_id(rs.getInt(4));
					ut.setUtypename(rs.getString(5));
					ut.setUser_email(rs.getString(6));
					ut.setStuId(rs.getString(7));
					return ut;
				}
				return null;
			}
			catch(SQLException e){
				e.printStackTrace();
				return null;
			}
		}
	
	//�޸��û���Ϣ
	public boolean updateUser(userTable user){
		try{
			pstmt = conn.prepareStatement("update usertable set username=? ,password=? ,utypeid=? ,utypename=? ,email=? ,stuId=? where userid=?");
			//pstmt=conn.prepareStatement("update usertable set username=? where userid=?");
			pstmt.setString(1,user.getUser_name());
			pstmt.setString(2, user.getUser_password());
			pstmt.setInt(3, user.getUser_type_id());
			pstmt.setString(4, user.getUtypename());
			pstmt.setString(5, user.getUser_email());
			pstmt.setString(6, user.getStuId());
			pstmt.setInt(7, user.getUser_id());
			//pstmt.setString(1, username);
			//pstmt.setInt(2, userid);
			pstmt.executeUpdate();
			return true;
		}
		catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	//��ʦ�������û�
	public boolean addUser(userTable user){
		try{
			pstmt=conn.prepareStatement("insert usertable" 
										+"(username,password,utypeid,utypename,email,stuId) "
										+ "values(?,?,?,?,?,?)");
			pstmt.setString(1, user.getUser_name());
			pstmt.setString(2, user.getUser_password());
			pstmt.setInt(3, user.getUser_type_id());
			pstmt.setString(4, user.getUtypename());
			pstmt.setString(5, user.getUser_email());
			pstmt.setString(6, user.getStuId());			
			pstmt.executeUpdate();
			return true;
		}
		catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	//��ʦɾ���û�
		public boolean DeleteUser(userTable user){
			try{
				pstmt=conn.prepareStatement("delete from usertable where stuId=?");
				pstmt.setString(1, user.getStuId());
				/*pstmt.setString(2, user.getUser_password());
				pstmt.setInt(3, user.getUser_type_id());
				pstmt.setString(4, user.getUtypename());
				pstmt.setString(5, user.getUser_email());
				pstmt.setString(6, user.getStuId());*/		
				pstmt.executeUpdate();
				return true;
			}
			catch(SQLException e){
				e.printStackTrace();
				return false;
			}
		}
		

	//��ʦָ����ѧ��
	public boolean addStus(String stuId,String username){
		try{
			pstmt=conn.prepareStatement("insert usertable"
										+"(username,password,utypeid,utypename,stuId) "
										+"values(?,?,?,?,?)");
			pstmt.setString(1, username);
			pstmt.setString(2, "123456");
			pstmt.setInt(3, 1);
			pstmt.setString(4, "ѧ��");
			pstmt.setString(5, stuId);
			pstmt.executeUpdate();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	//��ʦͨ��useridɾ��һ����ҵ��¼
		public boolean deleteUser(int userid) {     //���ô�����������ɾ��

			try {
				pstmt = conn.prepareStatement("delete from usertable where userid=?");
				pstmt.setInt(1, userid);
				pstmt.executeUpdate();
				pstmt = conn.prepareStatement("delete from user_hwtable where userid=?");
				pstmt.setInt(1, userid);
				pstmt.executeUpdate();
				return true;
			} catch (SQLException e) {
				e.getStackTrace();
				return false;
			}

		}
		
		
		//��ʦ�鿴user_hwtable��
		public List t_queryinfo() {
			List info = new ArrayList();
			try {
				pstmt = conn.prepareStatement("select * from user_hwtable order by stuId");
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					user_hwTable uh = new user_hwTable();
					uh.setUserid(rs.getInt(1));
					uh.setHomeworkid(rs.getInt(2));
					uh.setHomeworkname(rs.getString(3));
					uh.setHomeworkpath(rs.getString(4));
					uh.setHomeworkgrade(rs.getInt(5));					
					uh.setUsername(rs.getString(6));
					uh.setStuId(rs.getString(7));
					uh.setMyhwname(rs.getString(8));
					uh.setId(rs.getInt(9));
					info.add(uh);

				}
				return info;

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}

		}
		//�޸�����
		public boolean modifyPwd(String userpassword,String stuId){
			try{
				pstmt=conn.prepareStatement("update usertable set password=? where stuId=?");
				pstmt.setString(1, userpassword);
				pstmt.setString(2, stuId);
				pstmt.executeUpdate();
				return true;
			}
			catch(Exception e){
				e.printStackTrace();
				return false;
			}
		}
		
		//�޸�����
		public boolean modiEmail(String email,String stuId){	
			try{
				pstmt=conn.prepareStatement("update usertable set email=? where stuId=?");
				pstmt.setString(1, email);
				pstmt.setString(2, stuId);
				pstmt.executeUpdate();
				return true;
			}
			catch(Exception e){
				e.printStackTrace();
				return false;
			}
			
		}
		
		//����һ������ļ�
		public boolean addLibFile(String filename){
			try{
				pstmt=conn.prepareStatement("insert libsupload" 
											+"(libfilename) "
											+ "values(?)");
				pstmt.setString(1, filename);		
				pstmt.executeUpdate();
				return true;
			}
			catch(SQLException e){
				e.printStackTrace();
				return false;
			}
		}
		
		//�鿴����ļ�
		public List queryLibs() {
			List array = new ArrayList();
			try {
				pstmt = conn.prepareStatement("select * from libsupload");
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					libsUploadBean lb = new libsUploadBean();
					lb.setLibfilename(rs.getString(1));
					array.add(lb);
				}
				return array;

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}

		}
		//ɾ��һ������¼
		public boolean deletelibs(String filename) {     //�˴��������о�һ���ü������ߴ�����������ɾ��

			try {
				pstmt = conn.prepareStatement("delete from libsupload where libfilename=?");
				pstmt.setString(1, filename);
				pstmt.executeUpdate();			
				return true;
			} catch (SQLException e) {
				e.getStackTrace();
				return false;
			}

		}
		//ͨ��homeworkid��stuId���ҵ�ѧ����ҵ��¼
		public String queryStuHwName(int homeworkid,String stuId) {
			try {
				pstmt = conn.prepareStatement("select myhwname from user_hwtable where homeworkid=? and stuId=?");
				pstmt.setInt(1, homeworkid);
				pstmt.setString(2, stuId);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
				return null;

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		}
		
		//ͨ��homeworkid��������homeworkTable
		public homeworkTable t_queryByhwId(int homeworkid){
			try{
				pstmt = conn.prepareStatement("select * from hwtable where homeworkid=?");
				pstmt.setInt(1, homeworkid);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					homeworkTable ht = new homeworkTable();
					ht.setHomeworkid(rs.getInt(1));
					ht.setHomeworkname(rs.getString(2));
					ht.setHomeworkpath(rs.getString(3));
					ht.setHomeworkdesc(rs.getString(4));
					return ht;
				}
				return null;
			}
			catch(SQLException e){
				e.printStackTrace();
				return null;
			}
		}
		
		//ͨ��userid��������user_hwTable
		public List t_querybyUserid(int userid) {
			List array0 = new ArrayList();
			try {
				pstmt = conn.prepareStatement("select * from user_hwtable where userid=?");
				pstmt.setInt(1, userid);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					user_hwTable uhw = new user_hwTable();
					uhw.setUserid(rs.getInt(1));
					uhw.setHomeworkid(rs.getInt(2));
					uhw.setHomeworkname(rs.getString(3));
					uhw.setHomeworkpath(rs.getString(4));
					uhw.setHomeworkgrade(rs.getInt(5));
					uhw.setUsername(rs.getString(6));
					uhw.setStuId(rs.getString(7));
					uhw.setMyhwname(rs.getString(8));
					uhw.setId(rs.getInt(9));
					array0.add(uhw);

				}
				return array0;

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}

		}
		
		//ѧ������һ����ҵ��¼
		public boolean addmyHomework(String stuId,int homeworkid,String myhwname){
			try{
				
				userTable utt = this.t_queryBystuId(stuId);
				homeworkTable ht = this.t_queryByhwId(homeworkid);
				pstmt=conn.prepareStatement("insert into user_hwtable "
						+ "(userid,homeworkid,homeworkname,homeworkpath,homeworkgrade,username,stuId,myhwname) "
						+ " values (?,?,?,?,?,?,?,?)");
				pstmt.setInt(1, utt.getUser_id());
				pstmt.setInt(2, homeworkid);
				pstmt.setString(3, ht.getHomeworkname());
				pstmt.setString(4, ht.getHomeworkpath());
				pstmt.setInt(5, 0);
				pstmt.setString(6, utt.getUser_name());
				pstmt.setString(7, stuId);
				pstmt.setString(8, myhwname);
				pstmt.executeUpdate();
				return true;
			}
			catch(Exception e){
				e.printStackTrace();
				return false;
			}
		}
		
		//ѧ��ͨ��homeworkid��stuIdɾ��һ���Լ�����ҵ
		public boolean DelMyhomework(int homeworkid,String stuId) {     //���ô�����������ɾ��

			try {
				pstmt = conn.prepareStatement("delete from user_hwtable where homeworkid=? and stuId=?");
				pstmt.setInt(1, homeworkid);
				pstmt.setString(2, stuId);
				pstmt.executeUpdate();
				return true;
			} catch (SQLException e) {
				e.getStackTrace();
				return false;
			}

		}
		
		//ѧ���鿴�ɼ�
		public int queryStuGrade(int homeworkid,String stuId){
			try{
				pstmt = conn.prepareStatement("select homeworkgrade from user_hwtable where homeworkid=? and stuId=?");
				pstmt.setInt(1, homeworkid);
				pstmt.setString(2, stuId);
				ResultSet rs =pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1);
				}
				return -1;
			}catch(Exception e){
				e.printStackTrace();
				return -1;
			}
		}
}
