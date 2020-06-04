package com.nitcloud.netdisk.servlet;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.nitcloud.netdisk.domain.Dir;
import com.nitcloud.netdisk.domain.User;
import com.nitcloud.netdisk.utils.AES;
import com.nitcloud.netdisk.utils.DealFile;
import com.nitcloud.netdisk.utils.DealType;

@WebServlet("/downloadfilebytype")
public class DownloadFileByTypeServlet extends HttpServlet {
	
	AES aes = null;
	DealFile dealFile;
	DealType dealType;
	
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {
		super.init();
		ServletContext servletContext = this.getServletContext();
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		dealFile =(DealFile)ctx.getBean("dealFile");
		dealType =(DealType)ctx.getBean("dealType");
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	@SuppressWarnings({ "unchecked", "unused" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String downloadName =  new String(request.getParameter("downloadName").getBytes("ISO8859-1"), "utf-8"); 
		String filepath =  new String(request.getParameter("filepath").getBytes("ISO8859-1"), "utf-8");

		User user = (User) request.getSession().getAttribute("user");
		
		List<Dir> dirs;
        
        dirs = (List<Dir>) request.getSession().getAttribute("dirs");
        
        if(dirs == null) {
        	dirs = new ArrayList<Dir>();
        	
        	request.getSession().setAttribute("dirs", dirs);
        }
		
		//����hdfs�õ������ļ�����
		Configuration conf = new Configuration();
		
		Path hadoopPath = null;
		FileSystem fs = null;
		
		hadoopPath = new Path(filepath);
		
		//���ļ������д�����������ַ�
		String newfilepath = filepath.replace(" ", "%20").replace("#", "%23").
									replace("%", "%25").replace("&", "%26").
									replace("]", "%5D").replace("{", "%7B").
									replace("$", "%24");
		
		
		fs = FileSystem.get(URI.create(newfilepath), conf);

		final FSDataInputStream hdfsInStream = fs.open(hadoopPath);
		
		InputStream fis = new BufferedInputStream(hdfsInStream);
		
		response.setHeader("Cache-Control", "no-cache");  
		response.setContentType("application/x-msdownload");  
		response.setHeader("Content-Disposition", "attachment; filename=" + encodingFileName(downloadName));  
        OutputStream os = response.getOutputStream();  
        //FileInputStream in = new FileInputStream(new File("E:/Downloads/TheHobbit/TheHobbit.avi"));  
        /*int n = 0;// ÿ�ζ�ȡ���ֽڳ���  
        
        byte[] bb = new byte[4096];// �洢ÿ�ζ�ȡ������  
        
        n = fis.read(bb);
        
        os.write(bb, 0, n);
        
        while ((n = fis.read(bb)) != -1) {  
            os.write(bb, 0, n);// ����ȡ�����ݣ�д�뵽���������  
        }  
        
        os.close();// �ر����������  
        fis.close();*/
        aes = new AES();
        
        //init(user.getKey().getBytes("UTF-8"), user.getIv().getBytes("UTF-8"));
        
        if(dealType.isEncryptAllType(downloadName)) {
System.out.println("start to decrypt all file!");        	
        	//����ȫ������
        	int readSize = 0;
        	
        	byte[] encryptbyte = new byte[32752];// �洢ÿ�ζ�ȡ������  
        	
        	try {
        		while ((readSize = fis.read(encryptbyte)) != -1) {  
                    os.write(aes.decryptByte(encryptbyte, user.getKey(), user.getIv()), 0, 32736);// ����ȡ�����ݣ�д�뵽���������  
                }  
        	} catch(IOException e) {
        		e.printStackTrace();
        	}
        	
        	os.close();// �ر����������  
            fis.close();
			//return aes.decryptFileAll(fis, user.getKey(), user.getIv());
		} else {
System.out.println("start to decrypt part file!");   			
			//���в��ֽ���
			int readSize = 0;
			
			byte[] encryptbyte = new byte[144];// �洢ÿ�ζ�ȡ������  
			byte[] plainbyte = new byte[4096];// �洢ÿ�ζ�ȡ������  
			
			try {
				readSize = fis.read(encryptbyte);

				os.write(aes.decryptByte(encryptbyte, user.getKey(), user.getIv()), 0, 128);
				
        		while ((readSize = fis.read(plainbyte)) != -1) {  
                    os.write(plainbyte, 0, readSize);// ����ȡ�����ݣ�д�뵽���������  
                }  
        	} catch(IOException e) {
        		e.printStackTrace();
        	}
			
        	os.close();// �ر����������  
            fis.close();
			//return aes.decryptFile(fis, user.getKey(), user.getIv());
		}
	}


	//�����������Ϳո�����⣬Ч���ܺ�
	public String encodingFileName(String downloadName) { 
        String returnFileName = ""; 
        try { 
            returnFileName = URLEncoder.encode(downloadName, "UTF-8"); 
            returnFileName = StringUtils.replace(returnFileName, "+", "%20"); 
            if (returnFileName.length() > 150) { 
                returnFileName = new String(downloadName.getBytes("GB2312"), "ISO8859-1"); 
                returnFileName = StringUtils.replace(returnFileName, " ", "%20"); 
            } 
        } catch (UnsupportedEncodingException e) { 
            e.printStackTrace(); 
           
        } 
        return returnFileName; 
    } 

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public DealFile getDealFile() {
		return dealFile;
	}
	public void setDealFile(DealFile dealFile) {
		this.dealFile = dealFile;
	}


	public DealType getDealType() {
		return dealType;
	}
	public void setDealType(DealType dealType) {
		this.dealType = dealType;
	}
}
