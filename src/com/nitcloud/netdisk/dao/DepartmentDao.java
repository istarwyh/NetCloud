package com.nitcloud.netdisk.dao;

import java.util.List;

import com.nitcloud.netdisk.domain.Department;

public interface DepartmentDao {

	List<Department> select();

	void save(Department department);

	Department selectById(int id);

	void update(Department department);

	void delete(Department department);

	Department getDepartmentByName(String name);

}
