package com.nitcloud.netdisk.domain;
/**
 * 
 * @author GuoFeng Chen
 *
 */
public class FileInfo {

	private String filename;
	private String filetype;
	private String url;
	private int isdirectory;         // 1 is a directory, 0 is not a directory
	private String size;
	private String date;
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getIsdirectory() {
		return isdirectory;
	}
	public void setIsdirectory(int isdirectory) {
		this.isdirectory = isdirectory;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
