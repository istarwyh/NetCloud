package com.nitcloud.netdisk.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.nitcloud.netdisk.domain.Department;
import com.nitcloud.netdisk.domain.User;
import com.nitcloud.netdisk.service.AdminService;
import com.nitcloud.netdisk.service.DepartmentService;
import com.nitcloud.netdisk.utils.AES;
import com.nitcloud.netdisk.utils.RandomString;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class AdminAction extends ActionSupport {

	private HttpServletRequest request;
    private HttpSession session;
    
	private AdminService adminService;
	private DepartmentService departmentService;
	
	private RandomString randomString;
	
	List<Department> departmentList;
	List<Department> userManageList;
	List<Department> fileManageList;
	List<Department> allDepartment;
	
	
	private AES aes = null;
	
	private User admin;
	
	private String username;
	private String password;
	private int department;
	
	
	public String index() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
        admin = (User) session.getAttribute("admin");
        
        if(admin.getAccess().equals("all")) {
        	userManageList = departmentService.getAllDepartment();
        	fileManageList = departmentService.getAllDepartment();
        } else {
        	allDepartment = departmentService.getAllDepartment();
        	userManageList = new ArrayList<Department>();
        	fileManageList = new ArrayList<Department>();
        	
        	for(int i=0; i<allDepartment.size(); i++) {
        		if(admin.getAccess().contains(allDepartment.get(i).getName() + ":list")) {
        			userManageList.add(allDepartment.get(i));
        		}
        		
        		if(admin.getAccess().contains(allDepartment.get(i).getName() + ":filelist")) {
        			fileManageList.add(allDepartment.get(i));
        		}
        	}
        }
        
		return "success";
	}
	
	public String updateInfo() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
        admin = (User) session.getAttribute("admin");
        
        aes = new AES();
		
		password = aes.decryptString(admin.getPassword(), admin.getKey(), admin.getIv());
		
		departmentList = departmentService.getAllDepartment();
		
		return "success";
	}
	
	public String updateInfoDeal() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
        admin = (User) session.getAttribute("admin");
        
        aes = new AES();
        
        admin.setUsername(username);
        admin.setPassword(aes.encryptString(password, admin.getKey(), admin.getIv()));
        admin.setDepartment(department);
		
        adminService.update(admin);
        
        session.setAttribute("admin", admin);
		
		return "success";
	}
	

	public AdminService getAdminService() {
		return adminService;
	}
	@Resource
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public RandomString getRandomString() {
		return randomString;
	}

	public void setRandomString(RandomString randomString) {
		this.randomString = randomString;
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

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public List<Department> getUserManageList() {
		return userManageList;
	}

	public void setUserManageList(List<Department> userManageList) {
		this.userManageList = userManageList;
	}

	public List<Department> getFileManageList() {
		return fileManageList;
	}

	public void setFileManageList(List<Department> fileManageList) {
		this.fileManageList = fileManageList;
	}

	public List<Department> getAllDepartment() {
		return allDepartment;
	}

	public void setAllDepartment(List<Department> allDepartment) {
		this.allDepartment = allDepartment;
	}

	public AES getAes() {
		return aes;
	}

	public void setAes(AES aes) {
		this.aes = aes;
	}

	public User getAdmin() {
		return admin;
	}

	public void setAdmin(User admin) {
		this.admin = admin;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}

	public int getDepartment() {
		return department;
	}

	public void setDepartment(int department) {
		this.department = department;
	}
}
