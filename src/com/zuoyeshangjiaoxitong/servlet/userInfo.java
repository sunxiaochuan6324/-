package com.zuoyeshangjiaoxitong.servlet;
import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.zuoyeshangjiaoxitong.model.t_Servlet;
import java.sql.PreparedStatement;
public class userInfo extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ServletConfig config;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public void libsUpload(){
		conn = new com.zuoyeshangjiaoxitong.connect.connect().getConnect();

	}
	
	final public void init(ServletConfig config) throws ServletException {
	        this.config = config;
	   }

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		//request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>上传题库</TITLE><link rel='stylesheet' type='text/css' href='css/bootstrap.min.css'></HEAD>");
		out.println("  <BODY>");
		
		
				SmartUpload mySmartUpload = new SmartUpload();
				try{
					//init
					mySmartUpload.initialize(config, request, response);
					mySmartUpload.setMaxFileSize(1*512*1024);
					//单个文件最大大小
					mySmartUpload.setTotalMaxFileSize(1*1024*1024);
					//文件总计最大大小
					mySmartUpload.setAllowedFilesList("txt");
					//允许上传的文件格式
					mySmartUpload.setDeniedFilesList("exe,bat");
					//不允许上传的文件格式
					mySmartUpload.upload();
					int count = mySmartUpload.save("/info/");
					out.println("<div class='container'><h1><font color=red>" + count + "个文件" + "</font>&nbsp;上传成功!</h1></br>");
					out.println("<a href='importresult.jsp' class='btn btn-primary'>读取成功，请点击导入</a></div>");
					
					for(int i=0;i<mySmartUpload.getFiles().getCount();i++){
						File file=mySmartUpload.getFiles().getFile(i);
						//开始上传
						if(!file.isMissing()){
							//处理没有选中的文件
							//out.println("File Name:&nbsp;<font color=red>" + file.getFileName() +"</font><br>");
							// 输出文件名
							//out.println("File ExtName:&nbsp;<font color=red>" + file.getFileExt() + "</font><br>");
							// 输出文件的路径
							//out.println("Path:&nbsp;<font color=red>" + file.getFilePathName() + "</font><br>");
							// 输出文件的路径
							try{
							file.saveAs("/" + file.getFileName());}
							catch(Exception e1){
								out.println("error0");
							}
							file.saveAs("/" + file.getFileName().trim(),SmartUpload.SAVE_VIRTUAL);
							
							t_Servlet tsServlet = new t_Servlet();
							tsServlet.addLibFile(file.getFileName());
							
							file.saveAs("C:\\Users\\ASUS\\Desktop\\test" + file.getFileName(),SmartUpload.SAVE_PHYSICAL);
						}
					}
				}
				catch(Exception e){
					out.print(e.getStackTrace());
				}
		
		
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
		
		
	}
	
	
	
	

}
