package com.nitcloud.netdisk.utils;

import java.util.Arrays;

public class DealType {

	private String audio;
	private String video;
	private String picture;
	private String zip;
	private String document;
	
	private String encryptall;
	
	
	public String getFileType(String url) {
		//拿到文件后缀名
		String []type = url.split("\\.");
		String extension = type[type.length-1];
		
		//array转list，不转也可以
		String []audios = audio.split(";");
		String []videos = video.split(";");
		String []pictures = picture.split(";");
		String []zips = zip.split(";");
		String []documents = document.split(";");
		
		if(Arrays.asList(audios).contains(extension)) {
			return "audio";
		} else
		if(Arrays.asList(videos).contains(extension)) {
			return "video";
		} else
		if(Arrays.asList(pictures).contains(extension)) {
			return "picture";
		} else
		if(Arrays.asList(zips).contains(extension)) {
			return "zip";
		} else
		if(Arrays.asList(documents).contains(extension)) {
			return "document";
		} else {
			return "other";
		}
	}
	
	public boolean isEncryptAllType(String url) {
		//拿到文件后缀名
		String []type = url.split("\\.");
		String extension = type[type.length-1];
		
		String []encryptalls = encryptall.split(";");
		
		if(Arrays.asList(encryptalls).contains(extension)) {
			return true;
		}
		
		return false;
	}
	
	
	public String getAudio() {
		return audio;
	}
	public void setAudio(String audio) {
		this.audio = audio;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public String getEncryptall() {
		return encryptall;
	}
	public void setEncryptall(String encryptall) {
		this.encryptall = encryptall;
	}
}
