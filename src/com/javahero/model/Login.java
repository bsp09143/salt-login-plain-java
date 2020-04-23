package com.javahero.model;

public class Login {
	private String encUserId;
	private String password;
	private String dbPassword;

	public String getDbPassword() {
		return dbPassword;
	}

	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}

	private String salt;
	private String seqPassword;

	public String getEncUserId() {
		return encUserId;
	}

	public void setEncUserId(String encUserId) {
		this.encUserId = encUserId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getSeqPassword() {
		return seqPassword;
	}

	public void setSeqPassword(String seqPassword) {
		this.seqPassword = seqPassword;
	}
}
