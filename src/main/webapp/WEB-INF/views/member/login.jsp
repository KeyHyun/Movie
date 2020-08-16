<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 아래는 반응형 웹에 사용되는 기본 Meta --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta name="viewport" content="width=divice-width", initial-scale="1">
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<link rel="stylesheet" href="../resources/css/custom.css">
<title></title>
<script>
$(function(){
	$('#btnLogin').click(function(){
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		if(userid==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return;
		}
		if(passwd==""){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
		document.form1.action="login_check.do";
		document.form1.submit();
	});
});
</script>
</head>
<body>
<h2>로그인</h2>
<form name="form1" method="post">
<table border="1" width="400px">
	<tr>
		<td>아이디</td>
		<td><input id="userid" name="userid"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" id="passwd" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" id="btnLogin">로그인</button>
			<c:if test="${param.message == 'nologin' }">
				<div style="color:red;">
					먼저 로그인하세요.
				</div>
			</c:if>
			<c:if test="${param.message == 'error' }">
				<div style="color:red;">
					아이디 또는 비밀번호가 일치하지 않습니다.
				</div>
			</c:if>
			<c:if test="${param.message == 'logout' }">
				<div style="color:red;">
				로그아웃 되었습니다.
				</div>
			</c:if>
		</td>
	</tr>
</table>
</form>
</body>
</html>