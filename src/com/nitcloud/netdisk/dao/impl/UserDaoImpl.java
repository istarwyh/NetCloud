package com.nitcloud.netdisk.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.nitcloud.netdisk.dao.UserDao;
import com.nitcloud.netdisk.domain.User;

@Component("userDao")
public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;
	
	@Override
	public void save(User user) {
		getSession().save(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public User select(String arg1, String arg2) {
		List<User> lists = null;
		try{ 
			Query query = getSession().createQuery("from User u where u." + arg1 + " = ?").setParameter(0, arg2);
			lists = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(lists == null) {
			return null;
		}
System.out.println("the lists size is " + lists.size());		
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

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUser() { 
		List<User> lists = null;
		try{
			Session session = sessionFactory.getCurrentSession();
			session.beginTransaction();  
			lists = session.createCriteria(User.class).list(); 
			session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
		}	
		return lists;
	}

	@Override
	public void delete(User user) {
		getSession().delete(user);
	}

	@Override
	public User selectById(int id) {
		User user = null;
		
		user = (User) getSession().get(User.class, id);
		
		return user;
	}

	@Override
	public void update(User user) {
		getSession().saveOrUpdate(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> selectList(String arg1, int arg2) {
		List<User> lists = null;
		try{ 
			Query query = getSession().createQuery("from User u where u." + arg1 + " = ? order by access desc").setParameter(0, arg2);
			lists = query.list();
		}catch(Exception e){
			e.printStackTrace();
		} 
		if(lists.size() != 0) {
			return lists;
		} else {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int getAllRowCount() {
		List<User> lists = null;
		try{
			lists = getSession().createCriteria(User.class).list();
		}catch(Exception e){
			e.printStackTrace();
		}	
		return lists.size();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int getRowCountByDepartment(int department) {
		List<User> lists = null;
		try{
			lists = getSession().createQuery("from User u where u.department = ? order by access desc").setParameter(0, department).list();
		}catch(Exception e){
			e.printStackTrace();
		}	
		return lists.size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryForPage(int offset, int length) {
		List<User> lists = null;
		try{ 
			Query query = getSession().createQuery("from User u");
			query.setFirstResult(offset);    
			query.setMaxResults(length);
			lists = query.list();
		}catch(Exception e){
			e.printStackTrace();
		} 
		return lists;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryForPageByDepartmetn(int offset, int length, int department) {

		List<User> lists = null;
		try{ 
			Query query = getSession().createQuery("from User u where department = ?").setParameter(0, department);
			query.setFirstResult(offset);    
			query.setMaxResults(length);
			lists = query.list();
		}catch(Exception e){
			e.printStackTrace();
		} 
		return lists;
	}

	@Override
	public void deleteByDepartment(int id) {	
		getSession().createQuery("delete from User u where u.department = ?").setParameter(0, 10).executeUpdate();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllAdmin() {
		List<User> lists = null;
		try{ 
			Query query = getSession().createQuery("from User u where u.access != ''");
			lists = query.list();
		}catch(Exception e){
			e.printStackTrace();
		} 
		return lists;
	}
}
