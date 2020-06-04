package com.nitcloud.netdisk.service;

import java.util.List;
import com.nitcloud.netdisk.domain.Page;
import com.nitcloud.netdisk.utils.Result;
import com.nitcloud.netdisk.domain.User;

public interface UserService {

	User getUserByName(String username);

	void add(User user);

	List<User> getAllUser();

	void delete(User user);

	User getUserById(int id);

	void update(User user);

	List<User> getUserByDepartment(int department);

	Result queryByPage(Page page);

	Result queryByPage(Page page, int department);

	void deleteByDepartment(int id);

	List<User> getAllAdmin(); 
}
