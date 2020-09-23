<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.javalec.spring_gejo_board.dto.*"%>
<%@ page import="com.javalec.spring_gejo_board.dao.*"%>
<%@ page import="com.javalec.spring_gejo_board.service.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/mybatis.css" rel="stylesheet" type="text/css">
<title>Mybatis 게시판</title>
<%
	String pageNumberStr = request.getParameter("xpage");
	BListService service = new BListService();
	//BDao dao = sqlSession.getMapper(BDao.class);
	//BDao dao = new BDao();
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	MessageListView viewData = service.getMessageListView(pageNumber);
	int totalPages = viewData.getPageTotalCount();
	if(pageNumberStr==null) pageNumberStr="1";
	
	out.println(pageNumberStr + "/" + totalPages);
	List<BDto> subList = viewData.getMessageList();
%>

</head>
<body>
	<p class="list_p">${dtos.memId}님이 로그인 중입니다.<a href="logout" class="logout">[로그아웃]</a></p>
	<h1 class="list_h1">Spring Mybatis 게시판</h1>
	<table class="mybatis_table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<!-- model.setAttribute("list",dtos)로 서비스에서 등록한 내용을 읽어 뿌려준다. -->
		
		<c:forEach items="<%=subList %>" var="dto">
		<tbody id="notice-tbody">
			<tr>
				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td>
					<a href="content_view?bId=${dto.bId}">
					<c:forEach begin="1" end="${dto.bIndent}">[Re:]</c:forEach>${dto.bTitle}</a></td>
				<td><fmt:formatDate value="${dto.bDate}" pattern="yyyy-MM-dd"/></td>
				<td>${dto.bHit}</td>
			</tr>
		</tbody>
		</c:forEach>
		<tfoot>
			<tr>
				<td colspan="5">
					<c:if test="${dtos.memId != null}">
					<a href="write_view" class="btn_write_view">글작성</a>
					</c:if>
				</td>
			</tr>
		</tfoot>
	</table>
	<div class="container clearfix">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="list?xpage=<%=1%>"><span>처음</span></a></li>
		<%
			for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
		 %>
			<li class="page-item active"><a class="page-link" href="list?xpage=<%=i%>"><%=i%></a></li>
		<%
			}
		%>
			<li class="page-item"><a class="page-link" href="list?xpage=<%=totalPages%>"><span>나중</span></a></li>
		</ul>
	</div>
	
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
</body>
</html>