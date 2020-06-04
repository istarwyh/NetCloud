package com.nitcloud.netdisk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nitcloud.netdisk.dao.AdminDao;
import com.nitcloud.netdisk.domain.Admin;
import com.nitcloud.netdisk.domain.User;
import com.nitcloud.netdisk.service.AdminService;

@Component("adminService")
public class AdminServiceImpl implements AdminService {

	private AdminDao adminDao;
	
	@Override
	public Admin getAdminByName(String username) {
		return adminDao.select("username", username);
	}

	public AdminDao getAdminDao() {
		return adminDao;
	}
	@Resource
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public void add(Admin admin) {
		adminDao.save(admin);
	}

	@Override
	public void update(User admin) {
		adminDao.update(admin);
	}
}
