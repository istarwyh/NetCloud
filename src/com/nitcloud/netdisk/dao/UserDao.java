package com.nitcloud.netdisk.dao;

import java.util.List;
import com.nitcloud.netdisk.domain.User;

public interface UserDao {

	User select(String arg1, String arg2);

	void save(User user);

	List<User> getAllUser();

	void delete(User user);

	User selectById(int id);

	void update(User user);

	List<User> selectList(String arg1, int arg2);
	
	public int getAllRowCount(); 
	
	public List<User> queryForPage(final int offset, final int length);

	int getRowCountByDepartment(int department);

	List<User> queryForPageByDepartmetn(int offset, int length, int department);

	void deleteByDepartment(int id);

	List<User> getAllAdmin();
}
