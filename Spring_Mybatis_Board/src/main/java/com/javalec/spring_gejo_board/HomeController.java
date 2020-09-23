package com.javalec.spring_gejo_board;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_gejo_board.dao.IDao;
import com.javalec.spring_gejo_board.dto.BDto;
import com.javalec.spring_gejo_board.dto.JoinDto;
import com.javalec.spring_gejo_board.service.*;

@Controller //DispatcherServlet Context 가 사용할 컨트롤러임을 알림 
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	IBoarderService service;
	SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.sqlSession = this.sqlSession;
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		System.out.println("list()");
		service = new BListService();
		service.execute(model);
		return "list";
	}
	
	@RequestMapping("/join_view")
	public String join_view() {
		System.out.println("join_view()");
		
		return "join_view";
	}
	
	@RequestMapping("/join")
	public String join(HttpServletRequest request, HttpSession httpSession, Model model) {
		System.out.println("join()");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		if(request.getParameter("memId").isEmpty() || request.getParameter("memName").isEmpty() || request.getParameter("memPw").isEmpty()) {
			JOptionPane.showMessageDialog(null, "빈칸을 모두 채우세요.");
			return "join_view";
		}
		dao.join(request.getParameter("memId"), request.getParameter("memName"), request.getParameter("memPw"));
		JOptionPane.showMessageDialog(null, request.getParameter("memId")+"님의 회원가입이 완료되었습니다.");
		return "redirect:login_view";
	}
	
	@RequestMapping(value= {"/login_view", "/"})
	public String login_view() {
		System.out.println("login_view()");
		
		return "login_view";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpSession httpSession, Model model) {
		System.out.println("login()");
		
		JoinDto dtos;
		IDao dao = sqlSession.getMapper(IDao.class);
		dtos = dao.login(request.getParameter("memId"), request.getParameter("memPw"));
		httpSession.setAttribute("dtos", dtos);
		
		System.out.println(dtos);
		if(request.getParameter("memId").isEmpty() || request.getParameter("memPw").isEmpty()) {
			JOptionPane.showMessageDialog(null, "아이디나 비밀번호를 입력하세요.");
			return "login_view";
		}else if(dtos==null||!request.getParameter("memId").equals(dtos.getMemId())) {
			JOptionPane.showMessageDialog(null, "아이디가 달라요.");
			return "login_view";
		}else if(dtos==null||!request.getParameter("memPw").equals(dtos.getMemPw())) {
			JOptionPane.showMessageDialog(null, "비밀번호가 달라요.");
			return "login_view";
		}
		model.addAttribute("login", dao.login(request.getParameter("memId"), request.getParameter("memPw")));
		JOptionPane.showMessageDialog(null, request.getParameter("memId") + "님 환영합니다!");
		return "redirect:list";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession httpSession) {
		System.out.println("logout()");
		
		httpSession.invalidate();
		return "redirect:login_view";
	}
	
	@RequestMapping("/write_view")
	public String write_view() {
		System.out.println("write_view()");
		
		return "write_view";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request) {
		System.out.println("write()");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.write(request.getParameter("bName"), request.getParameter("bTitle"), request.getParameter("bContent"));
		return "redirect:list";
	}
	
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request) {
		System.out.println("reply()");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int bGroup = Integer.parseInt(request.getParameter("bGroup"));
		int bStep = Integer.parseInt(request.getParameter("bStep"));
		dao.replyShape(bGroup, bStep);
		int bindent = Integer.parseInt(request.getParameter("bIndent"));
		dao.reply(request.getParameter("bName"), request.getParameter("bTitle"), request.getParameter("bContent"), bGroup, bStep + 1, bindent + 1);
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int bid = Integer.parseInt(request.getParameter("bId"));
		dao.delete(bid);
		
		return "redirect:list";
	}

	
	@RequestMapping("/modify")
	public String update(HttpServletRequest request, Model model) {
		System.out.println("modify()");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int bid = Integer.parseInt(request.getParameter("bId"));
		dao.modify(request.getParameter("bTitle"), request.getParameter("bContent"), bid);
		return "redirect:list";
	}
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("content_view()");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int bid = Integer.parseInt(request.getParameter("bId"));
		dao.upHit(bid);
		dao.content_view(bid);
		model.addAttribute("content_view", dao.content_view(bid));
		
		return "content_view";
	}
	
	@RequestMapping("/content_view_modify")
	public String content_view_modify(HttpServletRequest request, Model model) {
		System.out.println("content_view_modify()");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int bid = Integer.parseInt(request.getParameter("bId"));
		dao.content_view_modify(bid);
		model.addAttribute("content_view_modify", dao.content_view_modify(bid));
		
		return "content_view_modify";
	}
	
	@RequestMapping("/reply_view")
	public String reply_view(HttpServletRequest request, Model model) {
		System.out.println("reply_view()");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int bid = Integer.parseInt(request.getParameter("bId"));
		dao.reply_view(bid);
		model.addAttribute("reply_view", dao.reply_view(bid));
		
		return "reply_view";
	}
}
