package com.nitcloud.netdisk.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {

	private int id;
	private String username;
	private String password;
	private String userdir;
	private String key;
	private String iv;
	private int department;
	private String access;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="st_username")
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column(name="st_password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name="st_userdir")
	public String getUserdir() {
		return userdir;
	}
	public void setUserdir(String userdir) {
		this.userdir = userdir;
	}
	@Column(name="st_key")
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	@Column(name="st_iv")
	public String getIv() {
		return iv;
	}
	public void setIv(String iv) {
		this.iv = iv;
	}
	@Column(name="st_department")
	public int getDepartment() {
		return department;
	}
	public void setDepartment(int department) {
		this.department = department;
	}
	@Column(name="st_access")
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
}
