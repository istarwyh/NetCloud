package com.nitcloud.netdisk.service;

import com.nitcloud.netdisk.domain.Admin;
import com.nitcloud.netdisk.domain.User;

public interface AdminService {

	Admin getAdminByName(String username);

	void add(Admin admin);

	void update(User admin);

}
