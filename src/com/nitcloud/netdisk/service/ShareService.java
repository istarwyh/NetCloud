package com.nitcloud.netdisk.service;

import java.util.List;

import com.nitcloud.netdisk.domain.Share;

public interface ShareService {

	void add(Share share);

	List<Share> getShareByName(String username);

	void deleteByName(String username, String string);

	void cancelShare(Share share);

	List<Share> getAllShare();

	List<Share> getShareByDepartment(int department);

	void deleteByName(String username);

	void update(Share share);

	Share getShareByFilepath(String urlname);

	void delete(Share share);

	Share getShareByFilepathAndDepartment(String urlname, int shareLocation);
}
