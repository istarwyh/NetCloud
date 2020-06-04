package com.nitcloud.netdisk.service;

import java.util.List;

import com.nitcloud.netdisk.domain.Department;

public interface DepartmentService {

	List<Department> getAllDepartment();

	void add(Department department);

	Department getDepartmentById(int id);

	void update(Department department);

	void delete(Department department);

	List<String> getDepartmentManage();

	Department getDepartmentByName(String name);

}
