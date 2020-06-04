package com.nitcloud.netdisk.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nitcloud.netdisk.domain.Admin;
import com.nitcloud.netdisk.domain.FileInfo;
import com.nitcloud.netdisk.domain.User;
import com.nitcloud.netdisk.service.AdminService;
import com.nitcloud.netdisk.service.UserService;
import com.nitcloud.netdisk.utils.AES;
import com.nitcloud.netdisk.utils.DealFile;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport {

	private HttpServletRequest request = ServletActionContext.getRequest();

	private AES aes = null;
	private UserService userService;
	private AdminService adminService;
	private DealFile dealFile;
	
	List<FileInfo> files;
	
	private User user;
	private Admin admin;
	
	private String username;
	private String password;
	private String errorInfo;
	
	
	public String userLogin() {
System.out.println(username + " want to login!");		
		user = userService.getUserByName(username);

		if(user != null) {
			aes = new AES();

			if(aes.decryptString(user.getPassword(), user.getKey(), user.getIv()).equals(password)) {
				request.getSession().setAttribute("user", user);
				
				//files = dealFile.getAllFile(dealFile.getRoot() + "/usr/" + username);
				
				return "success";
			} else {
				errorInfo = "用户密码不正确！";
				System.out.println(errorInfo);
				return "error";
			}
		} else {
			errorInfo = "用户名不正确！";
			System.out.println(errorInfo);
			return "error";
		}
	}
	
	public String adminLogin() {	
		aes = new AES();
		user = userService.getUserByName(username);
		
		if(user != null && user.getAccess() != null) {
			if(user.getPassword().equals(aes.encryptString(password, user.getKey(), user.getIv()))) {
				request.getSession().setAttribute("admin", user);
				
				//files = dealFile.getAllFile(dealFile.getRoot() + "/usr/" + username);
				
				return "success";
			} else {
				errorInfo = "用户密码不正确！";
				return "error";
			}
		} else {
			errorInfo = "用户名不正确！";
			return "error";
		}

	}
	

	public String index() {
		
		return "success";
	}
	
	
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public DealFile getDealFile() {
		return dealFile;
	}

	public void setDealFile(DealFile dealFile) {
		this.dealFile = dealFile;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}



	public List<FileInfo> getFiles() {
		return files;
	}

	public void setFiles(List<FileInfo> files) {
		this.files = files;
	}

	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public AdminService getAdminService() {
		return adminService;
	}
	@Resource
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public AES getAes() {
		return aes;
	}
	@Resource
	public void setAes(AES aes) {
		this.aes = aes;
	}

	public String getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(String errorInfo) {
		this.errorInfo = errorInfo;
	}
	
	class LoadFileThread implements Runnable {

		@Override
		public void run() {
			// TODO Auto-generated method stub
			files = dealFile.getAllFile(dealFile.getRoot() + "/usr/" + username);
		}
		
	}
}
