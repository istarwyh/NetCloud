package com.nitcloud.netdisk.utils;

import java.io.File;
import java.net.URI;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {
	public static void main(String[] args) throws Exception {
		// 递归显示C盘下所有文件夹及其中文件
		/*File root = new File("c:");
		showAllFiles(root);*/
		//System.out.println(isNumberOrLetter("fdsfl435*46s_dfds"));
		
		//UserDaoImpl userDao = new UserDaoImpl();
		
		//userDao.deleteByDepartment(10);
		
		URL url = new URL("U]PA9O_ZMT_GCO{%IJ$8QXI.png"); 
		URI uri = new URI(null, null, url.getPath(), null, null); 
		System.out.println("the uri is " + uri.getPath());
		//HttpClient client = new DefaultHttpClient(); HttpGet httpget = new HttpGet(uri);
	}

	public static boolean isNumberOrLetter(String str) {
		  
		  //首先,使用Pattern解释要使用的正则表达式，其中^表是字符串的开始，$表示字符串的结尾。
		  Pattern pt = Pattern.compile("^[0-9a-zA-Z_*]+$");
		 
		  //然后使用Matcher来对比目标字符串与上面解释得结果
		  Matcher mt = pt.matcher(str);
		  
		  //如果能够匹配则返回true。实际上还有一种方法mt.find()，某些时候，可能不是比对单一的一个字符串，
		  //可能是一组，那如果只要求其中一个字符串符合要求就可以用find方法了.
		  if(mt.matches()){
			  return true;
		  }
		  
		return false;
	}
	
	final static void showAllFiles(File dir) throws Exception {
		File[] fs = dir.listFiles();
		for (int i = 0; i < fs.length; i++) {
			System.out.println(fs[i].getAbsolutePath());
			if (fs[i].isDirectory()) {
				try {
					showAllFiles(fs[i]);
				} catch (Exception e) {
				}
			}
		}
	}
}
