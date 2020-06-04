package com.nitcloud.netdisk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nitcloud.netdisk.domain.Page;
import com.nitcloud.netdisk.utils.PageUtil;
import com.nitcloud.netdisk.utils.Result;
import com.nitcloud.netdisk.dao.UserDao;
import com.nitcloud.netdisk.domain.User;
import com.nitcloud.netdisk.service.UserService;

@Component("userService")
public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	@Override
	public User getUserByName(String username) {
		return userDao.select("username", username);
	}

	public UserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void add(User user) {
		userDao.save(user);
	}

	@Override
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	@Override
	public void delete(User user) {
		userDao.delete(user);
	}

	@Override
	public User getUserById(int id) {
		return userDao.selectById(id);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public List<User> getUserByDepartment(int department) {
		return userDao.selectList("department", department);
	}
	
	@Override
	public Result queryByPage(Page page) {
		page = PageUtil.createPage(page, userDao.getAllRowCount());  
        Result result = new Result();  
        
        result.setList(userDao.queryForPage(page.getBeginIndex(), page.getEveryPage()));  
        result.setPage(page);  
      
        return result;  
	}
	
	@Override
	public Result queryByPage(Page page, int department) {
		page = PageUtil.createPage(page, userDao.getRowCountByDepartment(department));  
        Result result = new Result();  
        
        result.setList(userDao.queryForPageByDepartmetn(page.getBeginIndex(), page.getEveryPage(), department));  
        result.setPage(page);  
      
        return result;  
	}

	@Override
	public void deleteByDepartment(int id) {
		userDao.deleteByDepartment(id);
	}

	@Override
	public List<User> getAllAdmin() {
		return userDao.getAllAdmin();
	}
}
