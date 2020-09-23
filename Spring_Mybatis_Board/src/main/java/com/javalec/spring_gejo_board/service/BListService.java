package com.javalec.spring_gejo_board.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import com.javalec.spring_gejo_board.dto.BDto;
import com.javalec.spring_gejo_board.dao.IDao;

public class BListService implements IBoarderService {

	private SqlSession sqlSession = Constant.sqlSession;
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	public BListService(){}
	
	@Override
	public void execute(Model model) {

		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<BDto> dtos = dao.listDao();
		model.addAttribute("listDao", dtos);
	}
	
	public  List<BDto> selectList(int a,int z) throws SQLException{
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<BDto> dtos =  dao.listDao();
		return dtos.subList(a-1,z);
	}
	public  MessageListView getMessageListView(int pageNumber) throws SQLException{
		int currentPageNumber = pageNumber;
		IDao dao = sqlSession.getMapper(IDao.class);
		int messageTotalCount = dao.listDao().size();
		List<BDto> messageList = null;
		int firstRow =0;
		int endRow =0;
		if(messageTotalCount>0){
			firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE+1;
			endRow = firstRow+MESSAGE_COUNT_PER_PAGE-1;
			if(endRow>messageTotalCount)endRow=messageTotalCount;
			messageList =selectList(firstRow,endRow);
		}else{
			currentPageNumber =0;
			messageList = Collections.emptyList();
		}
		return new MessageListView(messageList,messageTotalCount,currentPageNumber,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
	}

}
