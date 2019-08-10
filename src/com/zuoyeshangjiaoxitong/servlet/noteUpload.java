package com.zuoyeshangjiaoxitong.servlet;

import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class noteUpload extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String notetitle = new String(request.getParameter("notetitle").getBytes("iso-8859-1"), "utf-8");
		String notecontent = new String(request.getParameter("notecontent").getBytes("iso-8859-1"), "utf-8");
		String savecontent = SaveNote("note.txt", notetitle, notecontent);
		out.print(savecontent);
	}

	public String SaveNote(String filename, String notetitle, String notecontent) {
		try {
			File file = new File(filename);
			FileWriter fw = new FileWriter(file);
			fw.write(notetitle + ";\n");
			fw.write(notecontent);
			fw.close();
			return "保存成功";
		} catch (IOException e) {
			return "保存失败";
		}
	}
}
