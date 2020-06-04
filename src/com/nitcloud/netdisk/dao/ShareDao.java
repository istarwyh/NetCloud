package com.nitcloud.netdisk.dao;

import java.util.List;

import com.nitcloud.netdisk.domain.Share;

public interface ShareDao {

	void save(Share share);

	Share selectOne(String arg1, String arg2);

	List<Share> selectList(String arg1, String arg2);

	void deleteByName(String username, String filepath);

	List<Share> selectList();

	List<Share> selectList(String arg1, int arg2);

	void deleteByName(String username);

	void update(Share share);

	Share getShareByFilepath(String urlname);

	void delete(Share share);

	Share getShareByFilepathAndDepartment(String urlname, int shareLocation);


}
