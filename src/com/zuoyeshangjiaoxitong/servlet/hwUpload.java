package com.zuoyeshangjiaoxitong.servlet;

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

public class hwUpload extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServletConfig config;

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	final public void init(ServletConfig config) throws ServletException {
		// Put your code here
		this.config = config;
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>上传作业</TITLE><link rel='stylesheet' type='text/css' href='css/bootstrap.min.css'></HEAD>");
		out.println("  <BODY>");

		// 检查是否为文档格式
		SmartUpload mySmartUpload = new SmartUpload();
		try {
			// init
			mySmartUpload.initialize(config, request, response);
			mySmartUpload.setMaxFileSize(1 * 512 * 1024);
			// 单个文件最大大小
			mySmartUpload.setTotalMaxFileSize(1 * 1024 * 1024);
			// 文件总计最大大小
			mySmartUpload.setAllowedFilesList("rar,zip,txt");
			// 允许上传的文件格式
			mySmartUpload.setDeniedFilesList("exe,bat");
			//开始上传
			mySmartUpload.upload();
			//String homeworkpath = (String)request.getAttribute("homeworkpath");
			//out.println(homeworkpath);

			String myhwname=request.getParameter("myhwname");
			//out.println(myhwname);
			
			//String homeworkpath = mySmartUpload.getRequest().getParameter("homeworkpath");
			//String stuId = mySmartUpload.getRequest().getParameter("stuId");
			//out.print(stuId);
			String homeworkpath = request.getParameter("homeworkpath");
			int homeworkid = Integer.parseInt(request.getParameter("homeworkid"));
			String stuId = request.getParameter("stuId");
			int count = mySmartUpload.save("/homework/" + homeworkpath +"/");
			//out.print(homeworkid + homeworkpath + stuId);
			//out.println(homeworkpath);
			out.println("<div class='container'><h1><font color=red>" + count + "个文件" + "</font>&nbsp;上传成功!</h1></br>");
			out.println("<a href='stu_upload.jsp' class='btn btn-primary'>返回</a></div>");
			
			//out.println("<font color=red>" + count
				//+ "</font>&nbsp;File Uploaded!<br>");
			
			for (int i = 0; i < mySmartUpload.getFiles().getCount(); i++) {
				File file = mySmartUpload.getFiles().getFile(i);
				
				if (!file.isMissing()) {
					
					//out.println("File Name:&nbsp;<font color=red>"
						//	+ file.getFileName() + "</font><br>");
					
					//out.println("File ExtName:&nbsp;<font color=red>"
							//+ file.getFileExt() + "</font><br>");
					
					//out.println("Path:&nbsp;<font color=red>"
						//	+ file.getFilePathName() + "</font><br>");
					
					
					 //try{ file.saveAs("/" + file.getFileName());}
					 //catch(Exception e1){ out.println("error0"); }
					 
					//file.saveAs("C:\\Users\\ASUS\\Desktop\\test" + file.getFileName().trim(),
							//SmartUpload.SAVE_VIRTUAL);
					//file.saveAs("C:\\Users\\ASUS\\Desktop\\test" +
					// file.getFileName(),SmartUpload.SAVE_PHYSICAL);
					
					//int homeworkid1 = (Integer)request.getAttribute("homeworkid");
					//String stuId1 =(String)request.getAttribute("stuId");
					//out.println(file.getFileName());
					
					t_Servlet t_Servlet=new t_Servlet();
				    t_Servlet.DelMyhomework(homeworkid, stuId);
					t_Servlet.addmyHomework(stuId, homeworkid, myhwname);
					file.saveAs("/ServletFiles/upload/" + file.getFileName(),SmartUpload.SAVE_PHYSICAL);
				/*if(t_Servlet.addmyHomework(stuId, homeworkid, file.getFileName()))
					out.print("success");
				else {
					out.print("failure");
				}
				String aaString=t_Servlet.addmyHomework(stuId, homeworkid, file.getFileName());
				out.print(aaString);*/
					
				}
			}
		} catch (Exception e) {
			out.print(e.getStackTrace());
		}

		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
