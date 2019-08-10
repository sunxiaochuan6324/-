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
public class libsUpload extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ServletConfig config;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public libsUpload(){
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
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>上传题库</TITLE><link rel='stylesheet' type='text/css' href='css/bootstrap.min.css'></HEAD>");
		out.println("  <BODY>");
		
		// 检查是否为文档格式
				SmartUpload mySmartUpload = new SmartUpload();
				try{
					//init
					mySmartUpload.initialize(config, request, response);
					mySmartUpload.setMaxFileSize(1*512*1024);
					// 单个文件最大大小
					mySmartUpload.setTotalMaxFileSize(1*1024*1024);
					// 文件总计最大大小
					mySmartUpload.setAllowedFilesList("rar,zip,txt,doc,ppt");
					// 允许上传的文件格式
					mySmartUpload.setDeniedFilesList("exe,bat");
					//开始上传
					mySmartUpload.upload();
					int count = mySmartUpload.save("/upload/");
					out.println("<div class='container'><h1><font color=blue>" + count + "个文件" + "</font>&nbsp;上传成功!</h1></br>");
					out.println("<a href='t_upload.jsp' class='btn btn-primary'>查看已上传的文件</a></div>");
					//查看已上传的文件
					for(int i=0;i<mySmartUpload.getFiles().getCount();i++){
						File file=mySmartUpload.getFiles().getFile(i);
						//读取文件名
						if(!file.isMissing()){
							//输出上传的文件名
							//out.println("File Name:&nbsp;<font color=red>" + file.getFileName() +"</font><br>");
							//输出上传的文件名
							//out.println("File ExtName:&nbsp;<font color=red>" + file.getFileExt() + "</font><br>");
							//输出上传的文件名
							//out.println("Path:&nbsp;<font color=red>" + file.getFilePathName() + "</font><br>");
							//输出上传的文件名
							/*try{
							file.saveAs("/" + file.getFileName());}
							catch(Exception e1){
								out.println("error0");
							}
							file.saveAs("/" + file.getFileName().trim(),SmartUpload.SAVE_VIRTUAL);
							
							t_Servlet tsServlet = new t_Servlet();
							tsServlet.addLibFile(file.getFileName());
							
							file.saveAs("C:\\Users\\ASUS\\Desktop\\test" + file.getFileName(),SmartUpload.SAVE_PHYSICAL);
						*/
							try{
							file.saveAs("/" + file.getFileName());}
							catch(Exception e1){
								out.println("error0");
							}
							file.saveAs("/" + file.getFileName().trim(),SmartUpload.SAVE_VIRTUAL);
							
							t_Servlet tsServlet = new t_Servlet();
							tsServlet.addLibFile(file.getFileName());
							
							file.saveAs("/ServletFiles/upload/" + file.getFileName(),SmartUpload.SAVE_PHYSICAL);
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
