<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/mybatis.css" rel="stylesheet" type="text/css">
<title>로그인</title>
</head>
<body>
	<h1 class="list_h1">로그인</h1>
	<form action="login" method="post">
		<table class="login_table">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="memId" size = "40"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memPw" size = "40"></td>
			</tr>
			<tfoot>
			<tr>
				<td	colspan="2">
					<a href="join_view" class="btn_list_view">회원가입하기</a> &nbsp;&nbsp;
					<input type="submit" value="로그인하기" class="btn_submit">
				</td>
			</tr>
			</tfoot>
		</table>
	</form>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
</body>
</html>