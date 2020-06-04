package com.nitcloud.netdisk.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.nitcloud.netdisk.dao.ShareDao;
import com.nitcloud.netdisk.domain.Share;

@Component("shareDao")
public class ShareDaoImpl implements ShareDao {

	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Share selectOne(String arg1, String arg2) {
		List<Share> lists = null;
		try{ 
			Query query = getSession().createQuery("from Share s where s." + arg1 + " = ?").setParameter(0, arg2);
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
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Share> selectList(String arg1, String arg2) {
		List<Share> lists = null;
		try{ 
			Query query = getSession().createQuery("from Share s where s." + arg1 + " = ?").setParameter(0, arg2);
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
	public List<Share> selectList(String arg1, int arg2) {
		List<Share> lists = null;
		try{ 
			Query query = getSession().createQuery("from Share s where s." + arg1 + " = ?").setParameter(0, arg2);
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
	
	
	@Override
	public void save(Share share) {
		getSession().save(share);
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
	public void deleteByName(String username, String filepath) {
		try{ 
			Query query = getSession().createQuery("delete from Share s where s.username = ? and s.filepath = ?")
					.setParameter(0, username)
					.setParameter(1, filepath);
			query.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		} 
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Share> selectList() {
		List<Share> lists = null;
		try{ 
			Query query = getSession().createQuery("from Share s");
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

	@Override
	public void deleteByName(String username) {
		try{ 
			Query query = getSession().createQuery("delete from Share s where s.username = ?")
					.setParameter(0, username);
			query.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		} 
	}

	@Override
	public void update(Share share) {
		getSession().saveOrUpdate(share);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Share getShareByFilepath(String urlname) {
		List<Share> lists = null;
		try{ 
			Query query = getSession().createQuery("from Share s where s.filepath = ?").setParameter(0, urlname);
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

	@Override
	public void delete(Share share) {
		getSession().delete(share);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Share getShareByFilepathAndDepartment(String urlname,
			int shareLocation) {
		List<Share> lists = null;
		try{ 
			Query query = getSession().createQuery("from Share s where s.filepath = ? and s.department = ?")
					.setParameter(0, urlname)
					.setParameter(1, shareLocation);
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
}
