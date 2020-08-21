<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Welcome to Key's Cinema</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/booking.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/custom.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/seat.css">
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- Third party plugin CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/styles.css" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/">Key's Cinema</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">

				<ul class="navbar-nav ml-auto my-2 my-lg-0">
					<c:if test="${sessionScope.userid != null }">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="#">${sessionScope.name} (${sessionScope.userid})님의 방문을
								환영합니다.</a></li>
					</c:if>
					<c:choose>
						<c:when test="${sessionScope.userid == null }">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="/member/login.do">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="#"> ${sessionScope.name}님이 로그인중입니다.</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="logout.do">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/member/write.do">회원가입</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">My page</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">고객센터</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="reserve-container h-100">
				<div style="margin-top: 100px; width: 350px;">
					<div class="reserve-title">예매 성공</div>
				</div>
			</div>
		</div>
		<div class="container" style="width: 450px;">
			<div class="reser_container">
				예매 정보
				<div class="reser_container_div">영화명 : ${bookdto.b_movie}</div>
				<div class="reser_container_div">상영관 : ${bookdto.b_branch}</div>
				<div class="reser_container_div">상영시간 : ${bookdto.b_time}</div>
			</div>

		</div>
		<form action="/">
			<div style="text-align: center; margin-top: 30px;">
				<button>돌아가기</button>
			</div>
		</form>


	</header>
</body>
</html>