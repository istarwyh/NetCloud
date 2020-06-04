package com.nitcloud.netdisk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nitcloud.netdisk.dao.ShareDao;
import com.nitcloud.netdisk.domain.Share;
import com.nitcloud.netdisk.service.ShareService;

@Component("shareService")
public class ShareServiceImpl implements ShareService {

	private ShareDao shareDao;
	
	@Override
	public void add(Share share) {
		shareDao.save(share);
	}

	public ShareDao getShareDao() {
		return shareDao;
	}
	@Resource
	public void setShareDao(ShareDao shareDao) {
		this.shareDao = shareDao;
	}

	@Override
	public List<Share> getShareByName(String username) {
		return shareDao.selectList("username", username);
	}

	@Override
	public void deleteByName(String username, String filepath) {
		shareDao.deleteByName(username, filepath);
	}

	@Override
	public void cancelShare(Share share) {
		deleteByName(share.getUsername(), share.getFilepath());
	}

	@Override
	public List<Share> getAllShare() {
		return shareDao.selectList();
	}

	@Override
	public List<Share> getShareByDepartment(int department) {
		return shareDao.selectList("department", department);
	}

	@Override
	public void deleteByName(String username) {
		shareDao.deleteByName(username);
	}

	@Override
	public void update(Share share) {
		shareDao.update(share);
	}

	@Override
	public Share getShareByFilepath(String urlname) {
		return shareDao.getShareByFilepath(urlname);
	}

	@Override
	public void delete(Share share) {
		shareDao.delete(share);
	}

	@Override
	public Share getShareByFilepathAndDepartment(String urlname,
			int shareLocation) {
		return shareDao.getShareByFilepathAndDepartment(urlname, shareLocation);
	}
}
