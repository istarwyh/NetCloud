package com.nitcloud.netdisk.utils;

import java.io.File;
import java.net.URI;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {
	public static void main(String[] args) throws Exception {
		// �ݹ���ʾC���������ļ��м������ļ�
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
		  
		  //����,ʹ��Pattern����Ҫʹ�õ�������ʽ������^�����ַ����Ŀ�ʼ��$��ʾ�ַ����Ľ�β��
		  Pattern pt = Pattern.compile("^[0-9a-zA-Z_*]+$");
		 
		  //Ȼ��ʹ��Matcher���Ա�Ŀ���ַ�����������͵ý��
		  Matcher mt = pt.matcher(str);
		  
		  //����ܹ�ƥ���򷵻�true��ʵ���ϻ���һ�ַ���mt.find()��ĳЩʱ�򣬿��ܲ��ǱȶԵ�һ��һ���ַ�����
		  //������һ�飬�����ֻҪ������һ���ַ�������Ҫ��Ϳ�����find������.
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
