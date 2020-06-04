package com.nitcloud.netdisk.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nitcloud.netdisk.domain.Department;
import com.nitcloud.netdisk.domain.User;
import com.nitcloud.netdisk.service.DepartmentService;
import com.nitcloud.netdisk.service.ShareService;
import com.nitcloud.netdisk.service.UserService;
import com.nitcloud.netdisk.utils.DealFile;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class DepartmentAction extends ActionSupport {

	private UserService userService;
	private DepartmentService departmentService;
	private ShareService shareService;
	
	@Resource
	private DealFile dealFile;
	
	private Department department;
	
	private List<Department> departmentList;
	private List<String> departmentManage;
	private List<User> userList;
	
	private int id;
	private String name;
	private String oldname;
	
	private String flag;
	
	private String info;
	
	public String list() {
		departmentList = departmentService.getAllDepartment();
		departmentManage = departmentService.getDepartmentManage();
		
		return "success";
	}

	public String add() {
		
		return "success";
	}
	
	public String addDeal() {
		//先判断这个部门名是不是有重复的
		Department dept = departmentService.getDepartmentByName(name);
		
		if(dept != null) {
			info = "部门名已经存在！";
			
			return "success";
		}
		
		department = new Department();
		
		department.setName(name);
		
		departmentService.add(department);
		
		flag = "true";
		
		return "success";
	}
	
	public String update() {
		department = departmentService.getDepartmentById(id);
		
		return "success";
	}
	
	public String updateDeal() {
		userList = userService.getAllAdmin();
		
		if(userList != null) {
			for(int i=0; i<userList.size(); i++) {
				User user = userList.get(i);
				
				user.setAccess(user.getAccess().replace(oldname, name));
				
				userService.update(user);
			}
		}
		
		department = new Department();
		
		department.setId(id);
		department.setName(name);
		
		departmentService.update(department);
		
		flag = "true";
		
		return "success";
	}
	
	public String delete() {
		userList = userService.getUserByDepartment(id);
		
		if(userList != null) {
			for(int i=0; i<userList.size(); i++) {
				shareService.deleteByName(userList.get(i).getUsername());
				dealFile.delete(dealFile.getRoot() + "/usr/" + userList.get(i).getUserdir());
			}
		}

		
		userService.deleteByDepartment(id);
		
		department = new Department();
		
		department.setId(id);
		
		departmentService.delete(department);
		
		flag = "true";
		
		return "success";
	}

	
	
	
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Resource
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getDepartmentManage() {
		return departmentManage;
	}

	public void setDepartmentManage(List<String> departmentManage) {
		this.departmentManage = departmentManage;
	}

	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public ShareService getShareService() {
		return shareService;
	}
	@Resource
	public void setShareService(ShareService shareService) {
		this.shareService = shareService;
	}

	public DealFile getDealFile() {
		return dealFile;
	}

	public void setDealFile(DealFile dealFile) {
		this.dealFile = dealFile;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public String getOldname() {
		return oldname;
	}

	public void setOldname(String oldname) {
		this.oldname = oldname;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
}
