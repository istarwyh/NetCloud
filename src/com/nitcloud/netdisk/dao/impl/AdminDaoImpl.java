package com.nitcloud.netdisk.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.nitcloud.netdisk.dao.AdminDao;
import com.nitcloud.netdisk.domain.Admin;
import com.nitcloud.netdisk.domain.User;

@Component("adminDao")
public class AdminDaoImpl implements AdminDao {

	private SessionFactory sessionFactory;
	
	@Override
	public void save(Admin admin) {
		getSession().save(admin);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Admin select(String arg1, String arg2) {
		List<Admin> lists = null;
		try{ 
			Query query = getSession().createQuery("from Admin a where a." + arg1 + " = ?").setParameter(0, arg2);
			lists = query.list();
		}catch(Exception e){
			e.printStackTrace();
		} 
		if(lists.size() != 0) {
			return lists.get(0);
		} else {
			return null;
		}
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
	public void update(User admin) {
		getSession().saveOrUpdate(admin);
	}
}
