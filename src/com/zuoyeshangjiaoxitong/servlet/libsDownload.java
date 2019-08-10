package com.zuoyeshangjiaoxitong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;

public class libsDownload extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ServletConfig config;
	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init(ServletConfig config) throws ServletException {
		// Put your code here
		this.config=config;
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
		
		SmartUpload smd = new SmartUpload();
		
		try{
			//init
			
			smd.initialize(config, request, response);
			
			String fileName = request.getParameter("myfile").trim();
			smd.setContentDisposition(null);
			
			smd.downloadFile("/upload/" + fileName);
            //smd.initialize(config, request, response);
			
			//String homeworkpath = request.getParameter("homeworkpath");
			//String myhwname = request.getParameter("myhwname");
			//smd.setContentDisposition(null);
			
			//smd.downloadFile("/homework/" + homeworkpath + "/" + myhwname);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

	

}
