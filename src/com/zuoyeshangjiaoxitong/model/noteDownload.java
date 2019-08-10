package com.zuoyeshangjiaoxitong.model;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class noteDownload {

	
	private String note= null;
			

	public String DownloadNote(String filename){
		try{
			FileReader fr = new FileReader(filename);
			BufferedReader br = new BufferedReader(fr);
			StringBuffer  buffer = new StringBuffer();
			String line = "";
			while((line=br.readLine())!=null){
				buffer.append(line);
				}
			note = buffer.toString();
			br.close();
			return note;
		}
		catch(IOException e){
			e.getStackTrace();
			return null;
		}	
	}
}
