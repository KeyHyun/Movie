<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.1.1">
<%-- 아래는 반응형 웹에 사용되는 기본 Meta --%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta name="viewport" content="width=divice-width" , initial-scale="1">
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<link rel="stylesheet" href="../resources/css/custom.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/sign-in/">

<meta name="theme-color" content="#563d7c">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/signin.css"
	rel="stylesheet">
<title></title>
</head>
<body class="text-center">
	<form class="form-signin" action="login_check.do" method="post">
		<img class="mb-4"
			src="${pageContext.request.contextPath}/resources/images/media.png"
			alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
		<input id="userid" name="userid" class="form-control" placeholder="ID"
			required autofocus> <input type="password" id="passwd"
			name="passwd" class="form-control" placeholder="Password" required>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
			in</button>
	</form>
</body>
</html>
