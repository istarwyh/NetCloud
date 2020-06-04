package com.nitcloud.netdisk.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.nitcloud.netdisk.dao.DepartmentDao;
import com.nitcloud.netdisk.domain.Department;
import com.nitcloud.netdisk.domain.User;

@Component("departmentDao")
public class DepartmentDaoImpl implements DepartmentDao {

	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> select() {
		List<Department> lists = null;
		try{
			Session session = sessionFactory.getCurrentSession();
			session.beginTransaction();  
			lists = session.createCriteria(Department.class).list(); 
			session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
		}	
		return lists;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	@Override
	public void save(Department department) {
		getSession().save(department);
	}

	@Override
	public Department selectById(int id) {
		Department department = null;
		
		department = (Department) getSession().get(Department.class, id);
		
		return department;
	}

	@Override
	public void update(Department department) {
		getSession().saveOrUpdate(department);
	}

	@Override
	public void delete(Department department) {
		getSession().delete(department);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Department getDepartmentByName(String name) {
		List<Department> lists = null;
		try{ 
			Query query = getSession().createQuery("from Department d where d.name = ?").setParameter(0, name);

			lists = query.list();
		}catch(Exception e){
			e.printStackTrace();
		} 
		
		if(lists == null) {
			return null;
		}
		
		if(lists.size() > 0) {
			return lists.get(0);
		}
		
		return null;
	}
}
