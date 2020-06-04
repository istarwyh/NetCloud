package com.nitcloud.netdisk.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nitcloud.netdisk.dao.DepartmentDao;
import com.nitcloud.netdisk.dao.UserDao;
import com.nitcloud.netdisk.domain.Department;
import com.nitcloud.netdisk.service.DepartmentService;

@Component("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

	private DepartmentDao departmentDao;
	private UserDao userDao;
	
	@Override
	public List<Department> getAllDepartment() {
		return departmentDao.select();
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}
	@Resource
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Override
	public void add(Department department) {
		departmentDao.save(department);
	}

	@Override
	public Department getDepartmentById(int id) {
		return departmentDao.selectById(id);
	}

	@Override
	public void update(Department department) {
		departmentDao.update(department);
	}

	@Override
	public void delete(Department department) {
		departmentDao.delete(department);
	}

	@Override
	public List<String> getDepartmentManage() {
		List<Department> departmentList = departmentDao.select();
		List<String> departmentManage = new ArrayList<String>();
		
		for(int i=0; i<departmentList.size(); i++) {
			
		}
		
		return null;
	}

	public UserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public Department getDepartmentByName(String name) {
		// TODO Auto-generated method stub
		return departmentDao.getDepartmentByName(name);
	}
}
