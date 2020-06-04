package com.nitcloud.netdisk.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.nitcloud.netdisk.domain.FileInfo;
import com.nitcloud.netdisk.domain.Share;

public class DealFile{
	
	private String address;
	private String root;
	private hdfs hdfs;
	
	public void test() {
		System.out.println("the root is " + root);
	}
	public static void main(String[] args) {
		new DealFile().rename("hdfs://192.168.56.100:9000/usr/Chen/新建文件", "hdfs://192.168.56.100:9000/usr/Chen/新建文件1");
	}
	
	public List<FileInfo> getAllFile(String dir) {
	
		List<FileInfo> lists = null;

		try {
			lists = hdfs.getAllFileStatus(root, dir);		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return lists;
	}
	
	//拿到所有文件，通过遍历文件夹
	public List<FileInfo> getTotalFiles(String dir) {
		List<FileInfo> lists = null;

		try {
			lists = hdfs.getTotalFiles(root, dir);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return lists;
	}
	
	public List<FileInfo> getFileByType(String dir, String type) {
		List<FileInfo> lists = new ArrayList<FileInfo>();
		List<FileInfo> allfiles = null;
		try {
			//先拿到所有的文件
			allfiles = hdfs.getTotalFiles(root, dir);
			
			for(int i=0; i<allfiles.size(); i++) {
				if(allfiles.get(i).getFiletype().equals(type)) {
					lists.add(allfiles.get(i));
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return lists;
	}
	
	
	public List<FileInfo> getShareFileStatus(List<Share> shareList) {
		List<FileInfo> lists = null;

		try {
			lists = hdfs.getShareFileStatus(root, shareList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return lists;
	}
	
	public FileInfo getFileStatus(String filepath) {
		try {
			return hdfs.getFileStatus(root, filepath);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean delete(String path) {
		try {
			return hdfs.removeFile(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}

	public boolean rename(String oldName, String newName) {
		try {
			return hdfs.renameFile(root, oldName, newName);
		} catch (IllegalArgumentException | IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean createDir(String path, String dirName) {	
		try {
			return hdfs.createDir(root, path, dirName);
		} catch (IllegalArgumentException | IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean upload(String dst, String src) {	
		try {
			return hdfs.uploadFile(root, dst, src);
		} catch (IllegalArgumentException | IOException e) {
			e.printStackTrace();
		}
	
		return false;
	}

	
	
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
		setRoot(address + ":9000");
	}

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}
	public hdfs getHdfs() {
		return hdfs;
	}
	@Resource
	public void setHdfs(hdfs hdfs) {
		this.hdfs = hdfs;
	}
}
