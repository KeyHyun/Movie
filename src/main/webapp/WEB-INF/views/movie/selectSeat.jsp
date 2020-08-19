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
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
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
		<div class="select-container">
			<div class="select-wrapper">
				<div class="select-title">인원/좌석</div>
				<div class="select-seat-container">
					<div class="select-seat-number-container">
						<div class="select-seat-number-wrapper">
							<div class="select-seat">
								<div class="select-seat-age">일반</div>
								<div class="select-seat-number">
									<ul class="select-seat-ul select-seat-ul-normal">
										<li class="select-number-normal">0</li>
										<li class="select-number-normal">1</li>
										<li class="select-number-normal">2</li>
										<li class="select-number-normal">3</li>
										<li class="select-number-normal">4</li>
										<li class="select-number-normal">5</li>
										<!--  <li class="select-number-normal">6</li>
                                    <li class="select-number-normal">7</li>
                                    <li class="select-number-normal">8</li> -->
									</ul>
								</div>
							</div>
							<div class="select-seat">
								<div class="select-seat-age">청소년</div>
								<div class="select-seat-number">
									<ul class="select-seat-ul select-seat-ul-teen">
										<li class="select-number-teen">0</li>
										<li class="select-number-teen">1</li>
										<li class="select-number-teen">2</li>
										<li class="select-number-teen">3</li>
										<li class="select-number-teen">4</li>
										<li class="select-number-teen">5</li>
										<!-- <li class="select-number-teen">6</li>
                                    <li class="select-number-teen">7</li>
                                    <li class="select-number-teen">8</li> -->
									</ul>
								</div>
							</div>
							<div class="select-seat">
								<div class="select-seat-age">우대</div>
								<div class="select-seat-number">
									<ul class="select-seat-ul  select-seat-ul-old">
										<li class="select-number-old">0</li>
										<li class="select-number-old">1</li>
										<li class="select-number-old">2</li>
										<li class="select-number-old">3</li>
										<li class="select-number-old">4</li>
										<li class="select-number-old">5</li>
										<!-- <li class="select-number-old">6</li>
                                    <li class="select-number-old">7</li>
                                    <li class="select-number-old">8</li> -->
									</ul>
								</div>
							</div>

						</div>
						<div class="reserve-number-wrapper">
							<div class="reserve-number-title">선택된 좌석 수</div>
							<div class="reserve-number">0</div>
						</div>
					</div>
					<div class="select-seat-information">
						<div class="selected-movie">aa</div>
						<div class="select-seat-information-wrapper">
							<div class="select-theater-place selected-theater-place-info">CGV강남</div>
							<div class="select-theater-place selected-theater-place-info">3관
								8층</div>
							<div class="select-theater-place">
								<span>남은좌석</span><span class="remain-seats">152</span>/<span
									class="all-seats">172</span>
							</div>

						</div>
						<div class="select-theater-date">
							<div class="theater-date">aa</div>
							<div class="theater-time">aa</div>
						</div>
						<div class="selected-seats-wrapper">
							<span class="selected-seats-title">좌석번호</span> <span
								class="selected-seats">선택한 좌석이 없습니다.</span>
						</div>
						<div class="ticket-price-wrapper">
							<div class="ticket-price-title">가격</div>
							<div class="ticket-price">0원</div>
						</div>
						<form action="moveKakao.do" class="seatForm" method="post">
							<input type="hidden" class="title" name="title"> <input
								type="hidden" class="selectedTheater" name="selectedTheater">
							<input type="hidden" class="reserveDate" name="movieDate">
							<input type="hidden" class="runningTime" name="runningTime">
							<input type="hidden" class="movieAge" name="movieAge" value="a">
							<!-- 티켓의수(선택한 좌석) -->
							<input type="hidden" class="ticketNumber" name="ticketNumber">
							<input type="hidden" class="selectedSeat" name="selectedSeat">
							<!-- 결제 정보 -->
							<input type="hidden" class="payMoney" name="payMoney">
							<button type="button" class="reserve-button">
								결제하기<img src="./images/payment_icon_yellow_medium.png">
							</button>
						</form>
					</div>

				</div>
				<div class="seat-container">

					<div class="seat-wrapper">
						<div class="screen-view-wrapper">
							<div class="screen-view">SCREEN</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
<script src="${pageContext.request.contextPath}/resources/js/seat.js"></script>
</html>
