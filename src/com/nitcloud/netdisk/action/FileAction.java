package com.nitcloud.netdisk.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nitcloud.netdisk.domain.Department;
import com.nitcloud.netdisk.domain.Dir;
import com.nitcloud.netdisk.domain.FileInfo;
import com.nitcloud.netdisk.domain.Page;
import com.nitcloud.netdisk.domain.Share;
import com.nitcloud.netdisk.domain.User;
import com.nitcloud.netdisk.service.DepartmentService;
import com.nitcloud.netdisk.service.ShareService;
import com.nitcloud.netdisk.service.UserService;
import com.nitcloud.netdisk.utils.AES;
import com.nitcloud.netdisk.utils.DealFile;
import com.nitcloud.netdisk.utils.DealType;
import com.nitcloud.netdisk.utils.hdfs;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class FileAction extends ActionSupport {

	private HttpServletRequest request;
	private HttpServletResponse response;
    private HttpSession session;
    
    private ShareService shareService;
    private UserService userService;
	private DepartmentService departmentService;
    
    
    private User user;
    private Share share;
	
	private DealFile dealFile;               //封装过的对文件处理的类
	private DealType dealType;
	private AES aes = null;                         //处理加密的类
	
	private File[] file;
	private String[] fileFileName;
    private String fileContentType[];
	
	List<FileInfo> files;
	List<Share> shareList;
	List<Department> departmentList;
	
	Department dept;
	
	int shareLocation;
	
	private Page page;
	private int currentPage;  
    private int everyPage = 10;
    
    
	String name;
	String urlname;
	String rename;
	String oldname;
	String filepath;
	String username;
	
	String downloadName;
	
	//作为判断是不是从我的分享过来的链接
	String myshare;
	
	int department;
	
	//根据文件类别取数据
	String type;
	
	String dst;
	
	private int shareid;           //取消分享的时候通过id将文件删除
	
	String sharetype;
	
	
	
	public String list() {
		dept = departmentService.getDepartmentById(department);
		
		files = dealFile.getTotalFiles(dealFile.getRoot() + "/usr/" + username);
		
		return "success";
	}
	
	
	@SuppressWarnings("unchecked")
	public String uploadFile() {
		aes = new AES();
		
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
		
		List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	System.out.println("dirs is null");
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }
        
		try {                  
			ServletActionContext.getRequest().setCharacterEncoding("UTF-8"); 
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        String realpath = ServletActionContext.getServletContext().getRealPath("/uploadFiles");

        if (file != null) {
        	File savedir=new File(realpath);
            
            if(!savedir.getParentFile().exists()) {
                savedir.getParentFile().mkdirs();
            }
            
            for(int i=0;i<file.length;i++){
            	//处理文件名特殊字符
            	fileFileName[i] = fileFileName[i]
            			.replace("[", "")
            			.replace("]", "")
            			.replace("#", "")
            			.replace("{", "")
            			.replace("}", "")
            			.replace("+", " ");
            	
                File savefile = new File(savedir, fileFileName[i]);
                try {
					FileUtils.copyFile(file[i], savefile);
/*System.out.println("start to thread!");
					if(dirs.size() == 0) {
						new UploadFileThread(dealType.isEncryptAllType(realpath + "/" + fileFileName[i]),
								dealFile.getRoot() + "/usr/" + user.getUserdir(),
								realpath + "/" + fileFileName[i],
								user.getKey(),
								user.getIv()).start();
					} else {
						new UploadFileThread(dealType.isEncryptAllType(realpath + "/" + fileFileName[i]),
								dirs.get(dirs.size()-1).getFilepath(),
								realpath + "/" + fileFileName[i],
								user.getKey(),
								user.getIv()).start();
					}
System.out.println("start thread ok!");*/					
					//开始进行对文件的加密，加密后的文件会把原来的文件替换掉
					//判断是全加密还是部分加密
					
					session.setAttribute("progress", 101);
					
					if(dealType.isEncryptAllType(realpath + "/" + fileFileName[i])) {
						
System.out.println("start to encrypt file all!");						
						aes.encryptFileAllNew(realpath + "/" + fileFileName[i], user.getKey(), user.getIv());
System.out.println("加密的 key is " + user.getKey() + "  iv is " + user.getIv());						
					} else {
System.out.println("start to encrypt file part!");
						aes.encryptFilePart(realpath + "/" + fileFileName[i], user.getKey(), user.getIv());
System.out.println("加密的 key is " + user.getKey() + "  iv is " + user.getIv());							
					}
					
					session.setAttribute("progress", 102);
					//调用封装过的方法就行上传，上传文件会先传到tomcat下，然后移动到hdfs上面
					if(dirs.size() == 0) {
						dealFile.upload(dealFile.getRoot() + "/usr/" + user.getUserdir(), realpath + "/" + fileFileName[i]);
					} else {
						dealFile.upload(dirs.get(dirs.size()-1).getFilepath(), realpath + "/" + fileFileName[i]);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
            }
            
            session.setAttribute("progress", 103);
            
            try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
            
            session.removeAttribute("progress");
            
            return "success";
        } else {
        	return "error";
        }
	}
	
	@SuppressWarnings("unchecked")
	public InputStream getDownloadFile() throws Exception { 
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
		List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }

		//连接hdfs拿到下载文件的流
		Configuration conf = new Configuration();
		
		Path hadoopPath = null;
		FileSystem fs = null;
		
		if(dirs.size() == 0) {
			hadoopPath = new Path(dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + downloadName);
			fs = FileSystem.get(URI.create(dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + downloadName.replace(" ", "%20")), conf);
		} else {
			hadoopPath = new Path(dirs.get(dirs.size()-1).getFilepath() + "/" + downloadName);
			fs = FileSystem.get(URI.create(dirs.get(dirs.size()-1).getFilepath() + "/" + downloadName.replace(" ", "%20")), conf);
		}

		final FSDataInputStream hdfsInStream = fs.open(hadoopPath);
		
		InputStream fis = new BufferedInputStream(hdfsInStream);
		
		
		//调用加密类里的方法返回解密过的byte数组
		if(dealType.isEncryptAllType(downloadName)) {
			return aes.decryptFileAll(fis, user.getKey(), user.getIv());
		} else {
			return aes.decryptFile(fis, user.getKey(), user.getIv());
		}
    }
	

	public InputStream getDownloadFileByType() throws Exception { 
		aes = new AES();
		
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");

		//连接hdfs拿到下载文件的流
		Configuration conf = new Configuration();
		
		Path hadoopPath = null;
		FileSystem fs = null;
		
		
		hadoopPath = new Path(filepath);
		fs = FileSystem.get(URI.create(filepath.replace(" ", "%20")), conf);
	

		final FSDataInputStream hdfsInStream = fs.open(hadoopPath);
		
		InputStream fis = new BufferedInputStream(hdfsInStream);
		
		//调用加密类里的方法返回解密过的byte数组
		if(dealType.isEncryptAllType(filepath)) {
			return aes.decryptFileAll(fis, user.getKey(), user.getIv());
		} else {
			return aes.decryptFile(fis, user.getKey(), user.getIv());
		}
    }
	
	public InputStream getDownloadFileByAdmin() throws Exception { 
		aes = new AES();
		
		//连接hdfs拿到下载文件的流
		Configuration conf = new Configuration();
		
		Path hadoopPath = null;
		FileSystem fs = null;
		
		
		hadoopPath = new Path(filepath);
		fs = FileSystem.get(URI.create(filepath.replace(" ", "%20")), conf);
	
		//分析filepath,拿到用户名
		String[] strs = filepath.split("/");
		
		user = userService.getUserByName(strs[4]);
		
		final FSDataInputStream hdfsInStream = fs.open(hadoopPath);
		
		InputStream fis = new BufferedInputStream(hdfsInStream);
		
		//调用加密类里的方法返回解密过的byte数组
		if(dealType.isEncryptAllType(filepath)) {
			return aes.decryptFileAll(fis, user.getKey(), user.getIv());
		} else {
			return aes.decryptFile(fis, user.getKey(), user.getIv());
		}
    }
	
	
	@SuppressWarnings("unchecked")
	public InputStream getDownloadShareFile() throws Exception { 
		aes = new AES();
		
		request = ServletActionContext.getRequest();
        session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
		List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }

		//连接hdfs拿到下载文件的流
		Configuration conf = new Configuration();
		
		Path hadoopPath = null;
		FileSystem fs = null;
		
		hadoopPath = new Path(filepath);
		fs = FileSystem.get(URI.create(filepath.replace(" ", "%20")), conf);
		
		/*if(dirs.size() == 0) {
			hadoopPath = new Path(dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + downloadName);
			fs = FileSystem.get(URI.create(dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + downloadName.replace(" ", "%20")), conf);
		} else {
			hadoopPath = new Path(dirs.get(dirs.size()-1).getFilepath() + "/" + downloadName);
			fs = FileSystem.get(URI.create(dirs.get(dirs.size()-1).getFilepath() + "/" + downloadName.replace(" ", "%20")), conf);
		}*/

		//分析filepath,拿到用户名
		String[] strs = filepath.split("/");
System.out.println("the username is " + strs[4]);		
		user = userService.getUserByName(strs[4]);
		
		final FSDataInputStream hdfsInStream = fs.open(hadoopPath);
		
		InputStream fis = new BufferedInputStream(hdfsInStream);
		
		//调用加密类里的方法返回解密过的byte数组
		if(dealType.isEncryptAllType(filepath)) {
			return aes.decryptFileAll(fis, user.getKey(), user.getIv());
		} else {
			return aes.decryptFile(fis, user.getKey(), user.getIv());
		}
    }

	
	public String myShare() {	
		request = ServletActionContext.getRequest();
        session = this.request.getSession();
        
        departmentList = departmentService.getAllDepartment();
        
		user = (User) session.getAttribute("user");

		shareList = shareService.getShareByName(user.getUsername());
		
		sharetype = "myshare";
		
		myshare = "true";
		
		//files = dealFile.getShareFileStatus(shareList);
		
		return "success";
	}
	
	public String cloudShare() {
		request = ServletActionContext.getRequest();
        session = this.request.getSession();
        
		user = (User) session.getAttribute("user");

		shareList = shareService.getShareByDepartment(0);
		
		sharetype = "cloudshare";
		
		departmentList = departmentService.getAllDepartment();
		
		return "success";
	}
	
	public String departmentShare() {
		request = ServletActionContext.getRequest();
        session = this.request.getSession();
        
		user = (User) session.getAttribute("user");

		shareList = shareService.getShareByDepartment(user.getDepartment());
		
		sharetype = "departmentshare";
		
		departmentList = departmentService.getAllDepartment();
		
		return "success";
	}
	
	
	@SuppressWarnings("unchecked")
	public String shareFile() {	
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }
        
		urlname = "";
		
		try {
			urlname = new String(name.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		share = new Share();
		
		share.setUsername(user.getUsername());
		if(dirs.size() == 0) {
			share.setFilepath(dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + urlname);
		} else {
			share.setFilepath(dirs.get(dirs.size()-1).getFilepath() + "/" + urlname);
		}
		share.setDepartment(shareLocation);
		SimpleDateFormat datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		share.setDatetime(datetime.format(new Date()));
		share.setKey(user.getKey());
		share.setIv(user.getIv());
	
		shareService.add(share);
		
		return "success";
	}
	

	public String shareFileByType() {	
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
        
		urlname = "";
		
		try {
			urlname = new String(name.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
System.out.println("the share file path is " + urlname);

//get file status
		
		FileInfo fileinfo = dealFile.getFileStatus(urlname);
		
System.out.println("the file size is " + fileinfo.getSize());
System.out.println("the file type is " + fileinfo.getFiletype());
		//判断分享里是否有这个文件，有的话就不再分享
		Share s = shareService.getShareByFilepathAndDepartment(urlname, shareLocation);
		
		if(s != null) {
System.out.println("分享文件已经存在！");			
			return "success";
		}
		
		share = new Share();
		
		share.setUsername(user.getUsername());
		share.setFilepath(urlname);
		share.setDepartment(shareLocation);
		SimpleDateFormat datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		share.setDatetime(datetime.format(new Date()));
		share.setKey(user.getKey());
		share.setIv(user.getIv());
		share.setFilesize(fileinfo.getSize());
		share.setType(fileinfo.getFiletype());
		share.setIsdirectory(fileinfo.getIsdirectory());
		share.setFilename(fileinfo.getFilename());
	
		shareService.add(share);
		
		return "success";
	}
	
	
	@SuppressWarnings("unchecked")
	public String cancelShare() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }
		
		//从文件地址中分析出用户名
		//String[] strs = filepath.split("/");

        
		share = new Share();
		
		share.setId(shareid);
		
		shareService.delete(share);
		
/*		share.setUsername(user.getUsername());
		share.setFilepath(filepath);
	
		shareService.cancelShare(share);*/
		
		return "success";
	}
	
	
	@SuppressWarnings("unchecked")
	public String deleteFile() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	System.out.println("dirs is null");
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }
        
		urlname = "";
		
		try {
			urlname = new String(name.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//删除hdfs里的文件
		//删除数据库分享表里的记录
		if(dirs.size() == 0) {
			dealFile.delete(dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + urlname);
			shareService.deleteByName(user.getUsername(), dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + urlname);
		} else {
			dealFile.delete(dirs.get(dirs.size()-1).getFilepath() + "/" + urlname);
			shareService.deleteByName(user.getUsername(), dirs.get(dirs.size()-1).getFilepath() + "/" + urlname);
		}
		
		return "success";
	}
	
	public String deleteFileByType() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
		//删除hdfs里的文件
		//删除数据库分享表里的记录
		dealFile.delete(filepath);
		shareService.deleteByName(user.getUsername(), filepath);
		
		return "success";
	}
	
	//起到转发重命名操作
	public String rename() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
		rename = "";
		
		try {
			rename = new String(name.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	public String renameByType() {
/*		this.request = ServletActionContext.getRequest();       
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
		rename = "";
		
		try {
			rename = new String(name.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}*/
		
		return "success";
	}
	
	
	//重命名文件夹或者文件
	@SuppressWarnings("unchecked")
	public String renameFile() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	System.out.println("dirs is null");
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }
        
		urlname = "";
		
		try {
			urlname = new String(name.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//进行重命名
		if(dirs.size() != 0) {
			dealFile.rename(dirs.get(dirs.size()-1).getFilepath() + "/" + oldname, dirs.get(dirs.size()-1).getFilepath() + "/" + name);
		} else {
			dealFile.rename(dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + oldname, dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + name);
		}
		
		return "success";
	}
	
	//重命名文件夹或者文件
	@SuppressWarnings("unchecked")
	public String renameFileByType() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	System.out.println("dirs is null");
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }

		
		String[] strs = oldname.split("/");
		
		String newname = "";
		for(int i=0; i<strs.length-1; i++) {
			newname += strs[i] + "/";
		}
		
		newname += name;
		
		System.out.println("the newname is " + newname);
		
		//进行重命名
		dealFile.rename(oldname, newname);
		
		return "success";
	}
	
	//新建文件夹
	@SuppressWarnings("unchecked")
	public String createDir() {	
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
        user = (User) session.getAttribute("user");
        
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	System.out.println("dirs is null");
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }
        
		if(dirs.size() != 0) {
			dealFile.createDir(dirs.get(dirs.size()-1).getFilepath(), name);
		} else {
			dealFile.createDir(dealFile.getRoot() + "/usr/" + user.getUserdir(), name);
		}
		
		return "success";
	}
	
	
	//这个方法是点击文件夹之后处理
	@SuppressWarnings("unchecked")
	public String downDir() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
        user = (User) session.getAttribute("user");
        
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	System.out.println("dirs is null");
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }
		urlname = "";
		
		try {
			urlname = new String(name.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Dir dir = new Dir();
		
		dir.setName(urlname);
		if(dirs.size() == 0) {
			dir.setFilepath(dealFile.getRoot() + "/usr/" + user.getUserdir() + "/" + urlname);
		} else {
			dir.setFilepath(dirs.get(dirs.size()-1).getFilepath() + "/" + urlname);
		}
		
		//把目录添加进去
		dirs.add(dir);
			
		if(dirs.size() != 0) {
			files = dealFile.getAllFile(dirs.get(dirs.size()-1).getFilepath());
		} else {
			files = dealFile.getAllFile(dealFile.getRoot() + "/usr/" + user.getUserdir());
		}
		
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public String upDir() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
        user = (User) session.getAttribute("user");
        
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	System.out.println("dirs is null");
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }

        //将里面最后一个目录移走
        dirs.remove(dirs.size()-1);
			
		if(dirs.size() != 0) {
			files = dealFile.getAllFile(dirs.get(dirs.size()-1).getFilepath());
		} else {
			files = dealFile.getAllFile(dealFile.getRoot() + "/usr/" + user.getUserdir());
		}
		
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public String allFile() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
System.out.println("the type is " + type);        
        user = (User) session.getAttribute("user");
        
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        dirs.removeAll(dirs);
		
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public String getFileByType() {
		request = ServletActionContext.getRequest();
        session = this.request.getSession();
        
        user = (User) session.getAttribute("user");
        
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        dirs.removeAll(dirs);
        
		files = dealFile.getFileByType(dealFile.getRoot() + "/usr/" + user.getUserdir(), type);
		
		
		departmentList = departmentService.getAllDepartment();
		
		return "success";
	}
	
	
	//文件夹的跳转
	@SuppressWarnings("unchecked")
	public String jumpDir() {
System.out.println("start to jumpDir:");		

		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
        user = (User) session.getAttribute("user");
        
        List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        int size = dirs.size();
System.out.println("the pre size is " + size);        
        
        //先循环找到要跳转的文件夹所在位置，然后将后面的文件夹全删了
        int i;
        for(i=0; i<dirs.size(); i++) {
System.out.println("the session path is " + dirs.get(i).getFilepath());     
System.out.println("the click path is " + filepath);   
        	if(dirs.get(i).getFilepath().equals(filepath)) {
        		break;
        	}
        }
        
System.out.println("find the i is " + i);   

        //从最后一个删，依次往前
        for(int j=size-1; j>=0; j--) {
        	if(j>i) {
System.out.println("removed!");        		
        		dirs.remove(j);
        	}
        }
System.out.println("the next size is " + dirs.size());
		return "success";
	}
	
	
	
	
	
	
	public DealFile getDealFile() {
		return dealFile;
	}
	@Resource
	public void setDealFile(DealFile dealFile) {
		this.dealFile = dealFile;
	}

	public File[] getFile() {
		return file;
	}
	public void setFile(File[] file) {
		this.file = file;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getDst() {
		return dst;
	}
	public void setDst(String dst) {
		this.dst = dst;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getUrlname() {
		try {
			return java.net.URLEncoder.encode(urlname, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void setUrlname(String urlname) {
			this.urlname = urlname;
	}

	public AES getAes() {
		return aes;
	}
	@Resource
	public void setAes(AES aes) {
		this.aes = aes;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<FileInfo> getFiles() {
		return files;
	}

	public void setFiles(List<FileInfo> files) {
		this.files = files;
	}

	public int getShareLocation() {
		return shareLocation;
	}

	public void setShareLocation(int shareLocation) {
		this.shareLocation = shareLocation;
	}

	public ShareService getShareService() {
		return shareService;
	}
	@Resource
	public void setShareService(ShareService shareService) {
		this.shareService = shareService;
	}

	public Share getShare() {
		return share;
	}

	public void setShare(Share share) {
		this.share = share;
	}

	public List<Share> getShareList() {
		return shareList;
	}

	public void setShareList(List<Share> shareList) {
		this.shareList = shareList;
	}

	public String getRename() {
		return rename;
	}

	public void setRename(String rename) {
		try {
			this.rename = new String(rename.getBytes("ISO8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getOldname() {
		return oldname;
	}

	public void setOldname(String oldname) {
		this.oldname = oldname;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		try {
			this.filepath = new String(filepath.getBytes("ISO8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDownloadName() {
		try {  
            return new String(this.downloadName.getBytes(), "ISO8859-1");     
       } catch (UnsupportedEncodingException e) {  
           e.printStackTrace();
       }  
		return null;
	}

	public void setDownloadName(String downloadName) {
		try {
			this.downloadName = new String(downloadName.getBytes("ISO8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}


	public DealType getDealType() {
		return dealType;
	}
	@Resource
	public void setDealType(DealType dealType) {
		this.dealType = dealType;
	}


	public Department getDept() {
		return dept;
	}


	public void setDept(Department dept) {
		this.dept = dept;
	}


	public int getDepartment() {
		return department;
	}


	public void setDepartment(int department) {
		this.department = department;
	}


	public String getMyshare() {
		return myshare;
	}


	public void setMyshare(String myshare) {
		this.myshare = myshare;
	}
	

	
	public Page getPage() {
		return page;
	}


	public void setPage(Page page) {
		this.page = page;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getEveryPage() {
		return everyPage;
	}


	public void setEveryPage(int everyPage) {
		this.everyPage = everyPage;
	}



	public HttpServletResponse getResponse() {
		return response;
	}


	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}


	public int getShareid() {
		return shareid;
	}


	public void setShareid(int shareid) {
		this.shareid = shareid;
	}


	public String getSharetype() {
		return sharetype;
	}


	public void setSharetype(String sharetype) {
		this.sharetype = sharetype;
	}


	public String[] getFileContentType() {
		return fileContentType;
	}


	public void setFileContentType(String[] fileContentType) {
		this.fileContentType = fileContentType;
	}



	class UploadFileThread extends Thread {
		
		private AES aes;
		
		private String uploadDir;
		private String filepath;
		private String key;
		private String iv;
		private boolean isEncryptAll;
		
		public UploadFileThread(boolean isEncryptAll, String uploadDir, String filepath, String key, String iv) {
			this.uploadDir = uploadDir;
			this.filepath = filepath;
			this.key = key;
			this.iv = iv;
		}
		@Override
		public void run() {
			aes = new AES();
			
			//开始进行对文件的加密，加密后的文件会把原来的文件替换掉
			//判断是全加密还是部分加密
			if(isEncryptAll) {
				aes.encryptFileAll(filepath, key, iv);
			} else {
				aes.encryptFile(filepath, key, iv);
			}
			
			//调用封装过的方法就行上传，上传文件会先传到tomcat下，然后移动到hdfs上面
			dealFile.upload(uploadDir, filepath);
		}

	}
}
