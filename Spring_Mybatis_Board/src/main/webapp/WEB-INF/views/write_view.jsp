<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/mybatis.css" rel="stylesheet" type="text/css">
<title>글 작성</title>
</head>
<body>
<p class="list_p">${dtos.memId}님이 로그인 중입니다.<a href="logout" class="logout">[로그아웃]</a></p>
<h1 class="list_h1">글 작성하기</h1>
	<form action="write" method="post">
		<table class="write_view_table">
			<tr>
				<th> 작성자 </th>
				<td><input type="text" name="bName" value="${dtos.memId}" size = "50" readonly></td>
			</tr>
			<tr>
				<th> 제목 </th>
				<td> <input type="text" name="bTitle" size = "50"> </td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td> <textarea name="bContent" rows="10" ></textarea> </td>
			</tr>
			<tfoot>
			<tr >
				<td colspan="2">
					<a href="list" class="btn_list_view">목록보기</a>
					<input type="submit" value="입력하기" class="btn_submit"> &nbsp;&nbsp;
				</td>
			</tr>
			</tfoot>
		</table>
	</form>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
</body>
</html>