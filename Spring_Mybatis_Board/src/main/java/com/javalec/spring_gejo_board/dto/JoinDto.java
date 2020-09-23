package com.javalec.spring_gejo_board.dto;

public class JoinDto {
	String memId;
	String memName;
	String memPw;
	
	public JoinDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JoinDto(String memId, String memName, String memPw) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memPw = memPw;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
}
