package com.nitcloud.netdisk.action;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.nitcloud.netdisk.utils.Result;
import com.nitcloud.netdisk.domain.Page;
import com.nitcloud.netdisk.domain.Department;
import com.nitcloud.netdisk.domain.Dir;
import com.nitcloud.netdisk.domain.FileInfo;
import com.nitcloud.netdisk.domain.Share;
import com.nitcloud.netdisk.domain.User;
import com.nitcloud.netdisk.service.AdminService;
import com.nitcloud.netdisk.service.DepartmentService;
import com.nitcloud.netdisk.service.ShareService;
import com.nitcloud.netdisk.service.UserService;
import com.nitcloud.netdisk.utils.AES;
import com.nitcloud.netdisk.utils.DealFile;
import com.nitcloud.netdisk.utils.RandomString;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class UserAction extends ActionSupport {

	private HttpServletRequest request;
    private HttpSession session;
	
    private AES aes = null;
	private DealFile dealFile;
	private RandomString randomString;
	
	private UserService userService;
	private AdminService adminService;
	private DepartmentService departmentService;
	private ShareService shareService;
	
	List<FileInfo> files;
	List<Department> departmentList;
	List<User> userList;
	List<Share> shareList;
	List<String> access;
	
	String dst;                      
	String errorInfo;
	
	private User user;
	Department dept;
	
	private Page page;
	private int currentPage = 1;  
    private int everyPage = 10;
	
	private int id;
	private String username;
	private String password;
	private String userdir;
	private String key;
	private String iv;
	private String confirmpassword;
	private String rand;
	private int department;
	private String oldname;
	
	public String userLogin() {
		
		user = userService.getUserByName(username);
System.out.println("the username is " + user.getUsername());
		if(user != null) {
System.out.println("the user is not null!");
			aes = new AES();
System.out.println("the password is " + password);
System.out.println("the user password is " + user.getPassword());
			if(aes.decryptString(user.getPassword(), user.getKey(), user.getIv()).equals(password)) {
				request.getSession().setAttribute("user", user);
				
				//files = dealFile.getAllFile(dealFile.getRoot() + "/usr/" + username);
System.out.println("login success!");				
				return "success";
			} else {
				errorInfo = "用户密码不正确！";
				System.out.println(errorInfo);
System.out.println("login error!");
				return "error";
			}
		} else {
			errorInfo = "用户名不正确！";
			System.out.println(errorInfo);
			return "error";
		}
	}
	
	public String index() {  	
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
		dst = (String) session.getAttribute("dst");
		
		if(dst == null) {
			dst = user.getUsername() + "/";
		}

		return "success";
	}
	
	public String addSuperUser() {
		user = userService.getUserByName(username);
		
		if(user != null) {
			return "error";
		} 
		
		aes = new AES();
		
		user = new User();
		
		user.setUsername(username);
		user.setUserdir(username);
		user.setKey(randomString.getRandomString());
		user.setIv(randomString.getRandomString());
		user.setAccess("all");
		user.setPassword(aes.encryptString(password, user.getKey(), user.getIv()));
		user.setDepartment(0);
		
		userService.add(user);
		
		dealFile.createDir(dealFile.getRoot() + "/usr", username);
		
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public String list() {
		page = new Page();
		
		dept = departmentService.getDepartmentById(department);
 		
		Page p = new Page();              //设置分页信息  
        p.setCurrentPage(currentPage);    //设置当前页  
        p.setEveryPage(everyPage);        //设置每页显示  
      
		Result result = userService.queryByPage(p, department);
        
        page = result.getPage();  
        userList = result.getList();
		
		//userList = userService.getUserByDepartment(department);
	
		return "success";
	}
	
	public String add() {
		departmentList = departmentService.getAllDepartment();
		
		return "success";
	}
	
	public String addDeal() {
		aes = new AES();
		
		user = new User();
		
		user.setUsername(username);
		user.setUserdir(username);
		user.setKey(randomString.getRandomString());
		user.setIv(randomString.getRandomString());
		user.setDepartment(department);

		user.setPassword(aes.encryptString(password, user.getKey(), user.getIv()));
		
		userService.add(user);
		
		dealFile.createDir(dealFile.getRoot() + "/usr", username);
		
		return "success";
	}
	
	public String delete() {
		user = userService.getUserById(id);
		
		userService.delete(user);
		
		shareService.deleteByName(user.getUsername());
		
		dealFile.delete(dealFile.getRoot() + "/usr/" + user.getUserdir());
		
		return "success";
	}
	
	public String update() {
		user = userService.getUserById(id);
		
		aes = new AES();
		
		password = aes.decryptString(user.getPassword(), user.getKey(), user.getIv());
		
		departmentList = departmentService.getAllDepartment();
		
		return "success";
	}
	
	public String updateDeal() {	
		aes = new AES();
		
		user = userService.getUserById(id);
		
		user.setUsername(username);
		user.setPassword(aes.encryptString(password, key, iv));
		user.setUserdir(username);
		user.setDepartment(department);
		
		userService.update(user);

		dealFile.rename(dealFile.getRoot() + "/usr/" + oldname, dealFile.getRoot() + "/usr/" + username);
		
		updateShareFile(oldname, username);
		
		return "success";
	}
	
	public String updateShareFile(String oldname, String username) {
		shareList = shareService.getShareByName(oldname);
		
		if(shareList == null) {
			return "success";
		}
		
		for(int i=0; i<shareList.size(); i++) {
			Share share = shareList.get(i);
			
			Pattern p = Pattern.compile(oldname);
			
			Matcher m = p.matcher(share.getFilepath());
			
			String newfilepath = m.replaceFirst(username);
			
			share.setFilepath(newfilepath);
			share.setUsername(username);
			
			shareService.update(share);
		}
		
		return "success";
	}
	
	public String setAccess() {
		user = userService.getUserByName(username);
		
		departmentList = departmentService.getAllDepartment();
		
		return "success";
	}
	
	public String setAccessDeal() {
		user = userService.getUserByName(username);
		
		if(access == null) {		
			user.setAccess("");
			
			userService.update(user);
			
			return "success";
		}
		String accessStr = "";
		
		for(int i=0; i<access.size(); i++) {
			accessStr += access.get(i);
		}
		
		user.setAccess(accessStr);
		
		userService.update(user);
		
		
		return "success";
	}
	
	
	@SuppressWarnings("unchecked")
	public String data() {
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
		user = (User) session.getAttribute("user");
	
		List<Dir> dirs;
        
        dirs = (List<Dir>) session.getAttribute("dirs");
        
        if(dirs == null) {
        	dirs = new ArrayList<Dir>();
        	
        	session.setAttribute("dirs", dirs);
        }
      
        if(dirs.size() == 0) {
        	files = dealFile.getAllFile(dealFile.getRoot() + "/usr/" + user.getUserdir());
		} else {
			files = dealFile.getAllFile(dirs.get(dirs.size()-1).getFilepath());
		}
         
		departmentList = departmentService.getAllDepartment();
	
		dst = user.getUsername() + "/";		
		return "success";
	}
	
	public String register() {
		departmentList = departmentService.getAllDepartment();
		
		return "success";
	}
	
	public String registerDeal() {
		aes = new AES();
		
		this.request = ServletActionContext.getRequest();
        this.session = this.request.getSession();
        
        String code = (String) session.getAttribute("securitycode");
        
		user = userService.getUserByName(username);
	
		if(user != null) {
			errorInfo = "用户已经存在！";
			System.out.println(errorInfo);
			return "error";
		} 
		
		if(!code.equals(rand)) {
			errorInfo = "验证码不正确！";
			System.out.println(errorInfo);
			return "error";
		}
		if(!isNumberOrLetter(username)) {
			errorInfo = "用户名必须为字母或数字！";
			System.out.println(errorInfo);
			return "error";
		}
		if(password.equals("")) {
			errorInfo = "密码不能为空！";
			System.out.println(errorInfo);
			return "error";
		}
		if(!isNumberOrLetter(password)) {
			errorInfo = "密码必须为字母或数字！";
			System.out.println(errorInfo + password);
			return "error";
		}
		if(!password.equals(confirmpassword)) {
			errorInfo = "密码和确认密码不一致！";
			System.out.println(errorInfo + confirmpassword + " " + password);
			return "error";
		}
		user = new User();
		
		user.setUsername(username);
		user.setUserdir(username);
		user.setKey(randomString.getRandomString());
		user.setIv(randomString.getRandomString());
		user.setDepartment(department);

		user.setPassword(aes.encryptString(password, user.getKey(), user.getIv()));
		
		userService.add(user);
		
		dealFile.createDir(dealFile.getRoot() + "/usr", username);
		
		return "success";
	}

	public String logout() {
		request = ServletActionContext.getRequest();
        session = this.request.getSession();
        
		session.removeAttribute("user");
		session.removeAttribute("dirs");
		
		return "success";
	}
	
	public boolean isNumberOrLetter(String str) {
		  Pattern pt = Pattern.compile("^[0-9a-zA-Z]+$");
		  
		  Matcher mt = pt.matcher(str);
		  
		  if(mt.matches()){
			  return true;
		  }
		  
		return false;
	}
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<FileInfo> getFiles() {
		return files;
	}

	public void setFiles(List<FileInfo> files) {
		this.files = files;
	}

	public DealFile getDealFile() {
		return dealFile;
	}
	@Resource
	public void setDealFile(DealFile dealFile) {
		this.dealFile = dealFile;
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

	public String getDst() {
		return dst;
	}

	public void setDst(String dst) {
		this.dst = dst;
	}

	public RandomString getRandomString() {
		return randomString;
	}
	@Resource
	public void setRandomString(RandomString randomString) {
		this.randomString = randomString;
	}

	public AES getAes() {
		return aes;
	}
	@Resource
	public void setAes(AES aes) {
		this.aes = aes;
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

	public String getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(String errorInfo) {
		this.errorInfo = errorInfo;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	public int getDepartment() {
		return department;
	}

	public void setDepartment(int department) {
		this.department = department;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<String> getAccess() {
		return access;
	}

	public void setAccess(List<String> access) {
		this.access = access;
	}

	public AdminService getAdminService() {
		return adminService;
	}
	@Resource
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getIv() {
		return iv;
	}

	public void setIv(String iv) {
		this.iv = iv;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public String getUserdir() {
		return userdir;
	}

	public void setUserdir(String userdir) {
		this.userdir = userdir;
	}

	public ShareService getShareService() {
		return shareService;
	}
	@Resource
	public void setShareService(ShareService shareService) {
		this.shareService = shareService;
	}

	public List<Share> getShareList() {
		return shareList;
	}

	public void setShareList(List<Share> shareList) {
		this.shareList = shareList;
	}

	public String getOldname() {
		return oldname;
	}

	public void setOldname(String oldname) {
		this.oldname = oldname;
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
}
