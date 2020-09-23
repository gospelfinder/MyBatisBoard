<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/mybatis.css" rel="stylesheet" type="text/css">
<title>댓글 내용</title>
</head>
<body>
<p class="list_p">${dtos.memId}님이 로그인 중입니다.<a href="logout" class="logout">[로그아웃]</a></p>
<h1 class="list_h1">답변하기</h1>
	<form action="reply" method="post">
			<input type="hidden" name="bId" value="${reply_view.bId}">
			<input type="hidden" name="bGroup" value="${reply_view.bGroup}">
			<input type="hidden" name="bStep" value="${reply_view.bStep}">
			<input type="hidden" name="bIndent" value="${reply_view.bIndent}">
		<table class="reply_view_table">
			<tr>
				<th> 번호 </th>
				<td> ${reply_view.bId} </td>
			</tr>
			<tr>
				<th> 조회수 </th>
				<td> ${reply_view.bHit} </td>
			</tr>
			<tr>
				<th> 제목 </th>
				<td> <input type="text" name="bTitle" size="60" value="${reply_view.bTitle}"></td>
			</tr>
			<tr>
				<th> 답변자 </th>
				<td> <input type="text" name="bName" value="${dtos.memId}" readonly size="61"></td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td> <textarea rows="10"  name="bContent">${reply_view.bContent}</textarea></td>
			</tr>
		<tfoot>
			<tr>
				<td colspan="2">
					<a href="list" class="btn_list_view">목록보기</a> &nbsp;&nbsp;
					<input type="submit" value="답변완료" class="btn_submit"> 
				</td>
			</tr>
		</tfoot>
		</table>
	</form>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
</body>
</html>