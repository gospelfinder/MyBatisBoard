package com.javalec.spring_gejo_board.dao;

import java.util.ArrayList;

import com.javalec.spring_gejo_board.dto.BDto;
import com.javalec.spring_gejo_board.dto.JoinDto;

public interface IDao {

	public ArrayList<BDto> listDao();
	public void write(String bName, String bTitle, String bContent);
	public void reply(String bName, String bTitle, String bContent, int bGroup, int bStep, int bIndent);
	public void replyShape(int bGroup, int bStep);
	public void modify(String bTitle, String bContent, int bId);
	public void delete(int bId);	
	public BDto content_view(int bId);
	public BDto content_view_modify(int bId);
	public BDto reply_view(int bId);
	public void upHit(int bId);
	public void join(String memId, String memName, String memPw);
	public JoinDto login(String memId, String memPw);
	public BDto delete_check(int bId, int bGroup);
	
}
