package com.nitcloud.netdisk.dao;

import com.nitcloud.netdisk.domain.Admin;
import com.nitcloud.netdisk.domain.User;

public interface AdminDao {

	Admin select(String arg1, String arg2);

	void save(Admin admin);

	void update(User admin);

}
