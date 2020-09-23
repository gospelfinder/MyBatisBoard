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
<h1 class="list_h1">내용 수정하기</h1>
	<form action="modify" method="post">
		<input type="hidden" name="bId" value="${content_view_modify.bId}">
		<table class="content_view_modify_table">
			<tr>
				<th> 번호 </th>
				<td> ${content_view_modify.bId} </td>
			</tr>
			<tr>
				<th> 히트 </th>
				<td> ${content_view_modify.bHit} </td>
			</tr>
			<tr>
				<th> 이름 </th>
				<td> ${content_view_modify.bName}</td>
			</tr>
			<tr>
				<th> 제목 </th>
				<td> <input type="text" name="bTitle" size="60" value="${content_view_modify.bTitle}"></td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td> <textarea rows="10" name="bContent">${content_view_modify.bContent}</textarea></td>
			</tr>
			<tfoot>
				<tr>
					<td colspan="2"> 
						<a href="list" class="btn_list_view">목록보기</a> &nbsp;&nbsp;
						<a href="delete?bId=${content_view_modify.bId}" class="btn_delete_view">삭제하기</a> &nbsp;&nbsp;
						<input type="submit" value="수정완료" class="btn_submit">  
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
</body>
</html>