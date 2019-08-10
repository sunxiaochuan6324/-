package com.zuoyeshangjiaoxitong.model;

import java.io.*;
import java.util.*;

public class ReadTXT {
	public List readTxt(String filename){
		List list = new ArrayList();
		try{
		FileReader fr = new FileReader(filename);
		BufferedReader br = new BufferedReader(fr);
		String line = "";
		
		while((line=br.readLine())!=null)
			list.add(line);
		return list;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		}
	}

