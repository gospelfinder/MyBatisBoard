<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/mybatis.css" rel="stylesheet" type="text/css">
<title>글 내용</title>
</head>
<body>
<p class="list_p">${dtos.memId}님이 로그인 중입니다.<a href="logout" class="logout">[로그아웃]</a></p>
<h1 class="list_h1">내용 보기</h1>
		<table class="content_view_table">
			<tr>
				<th> 번호 </th>
				<td> ${content_view.bId} </td>
			</tr>
			<tr>
				<th> 조회수 </th>
				<td> ${content_view.bHit} </td>
			</tr>
			<tr>
				<th> 작성자 </th>
				<td>${content_view.bName}</td>
			</tr>
			<tr>
				<th> 제목 </th>
				<td>${content_view.bTitle}</td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td>${content_view.bContent}</td>
			</tr>
			<tfoot>
				<tr>
					<td colspan="2"> 
							<a href="list" class="btn_list_view">목록보기</a> &nbsp;&nbsp; 
						<c:if test="${content_view.bName == dtos.memId}">
							<a href="content_view_modify?bId=${content_view.bId}" class="btn_modify_view">수정하기</a> &nbsp;&nbsp; 
						</c:if>
						<c:if test="${dtos.memId != null}">
							<a href="reply_view?bId=${content_view.bId}" class="btn_reply_view">답변하기</a>
						</c:if>
					</td>
				</tr>
			</tfoot>
		</table>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
</body>
</html>