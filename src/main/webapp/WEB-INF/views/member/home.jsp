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
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
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
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Key's
				Cinema</a>
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
		<div class="container h-75">
			<div
				class="row h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-10 align-self-end">
					<h3 class="text-uppercase text-white font-weight-bold">BoxOffice
						Top 3</h3>
					<hr class="divider my-4" />
				</div>
				<div class="col-xl-12 align-self-baseline">

					<div class="container">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>
							<!--  -->
							<div class="carousel-inner">
								<c:forEach var="item" items="${imgurl }">
									<div class="carousel-item">
										<img src="${item }" width="450px" height="350px">
									</div>
								</c:forEach>
							</div>
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<c:choose>
							<c:when test="${sessionScope.userid != null }">
							<a class="btn btn-light btn-xl js-scroll-trigger"style="margin-top: 30px;" href="movie/booking.do">영화 예매하기</a>
							</c:when>
							<c:otherwise>
							<a class="btn btn-light btn-xl js-scroll-trigger"style="margin-top: 30px;" href="member/login.do">영화 예매하기</a>
							</c:otherwise>
							</c:choose>
					</div>
					<%--  <p class="text-white-75 font-weight-light mb-5">Start Bootstrap can help you build better websites using the Bootstrap framework! Just download a theme and start customizing, no strings attached!</p>
                        <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a>--%>
				</div>
			</div>
		</div>
	</header>
	<!-- About-->
	<section class="page-section bg-secondary" id="schedule">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 text-center">
					<h2 class="text-white mt-0">상영 예정작</h2>
					<hr class="divider light my-4" />
					<div class="container">
						<div class="row row-cols-1 row-cols-md-3">
							<div class="col mb-4">
								<div class="card">
									<img
										src="${pageContext.request.contextPath}/resources/images/my.jpg"
										class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">나의 소녀시대</h5>
										<p class="card-text">
											멜로/로맨스/드라마 <br> 2020.08.19 (재개봉)<br> 15세 관람가 <br>
											감독 프랭키 첸
										</p>
									</div>
								</div>
							</div>
							<div class="col mb-4">
								<div class="card">
									<img
										src="${pageContext.request.contextPath}/resources/images/memento.jpg"
										class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">메멘토</h5>
										<p class="card-text">
											범죄, 스릴러 <br> 2020.08.19 (재개봉)<br> 15세 관람가 <br>
											감독 크리스토퍼 놀란
										</p>
									</div>
								</div>
							</div>
							<div class="col mb-4">
								<div class="card">
									<img
										src="${pageContext.request.contextPath}/resources/images/1111.jpg"
										class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">국제 수사</h5>
										<p class="card-text">
											액션/드라마/범죄 <br> 2020.08.19 (개봉)<br> 15세 관람가 <br>
											감독 김봉한
										</p>
									</div>
								</div>
							</div>
						</div>
						<a class="btn btn-light btn-xl js-scroll-trigger" href="movie/detail.do">상영
							예정작 상세보기</a>
					</div>
				</div>
			</div>
	</section>
	<!-- Services-->
	<section class="page-section" id="services">
		<div class="container">
			<h2 class="text-center mt-0">At Your Service</h2>
			<hr class="divider my-4" />
			<div class="row">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<i class="fas fa-4x fa-gem text-primary mb-4"></i>
						<h3 class="h4 mb-2">Sturdy Themes</h3>
						<p class="text-muted mb-0">Our themes are updated regularly to
							keep them bug free!</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<i class="fas fa-4x fa-laptop-code text-primary mb-4"></i>
						<h3 class="h4 mb-2">Up to Date</h3>
						<p class="text-muted mb-0">All dependencies are kept current
							to keep things fresh.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<i class="fas fa-4x fa-globe text-primary mb-4"></i>
						<h3 class="h4 mb-2">Ready to Publish</h3>
						<p class="text-muted mb-0">You can use this design as is, or
							you can make changes!</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<i class="fas fa-4x fa-heart text-primary mb-4"></i>
						<h3 class="h4 mb-2">Made with Love</h3>
						<p class="text-muted mb-0">Is it really open source if it's
							not made with love?</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact-->
	<section class="page-section" id="contact">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 text-center">
					<h2 class="mt-0">고객센터</h2>
					<hr class="divider my-4" />
					<p class="text-muted mb-5">영화 예매 관련 문의 사항은 아래 고객센터로 연락주세요!</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
					<i class="fas fa-phone fa-3x mb-3 text-muted"></i>
					<div>010-2001-6721</div>
				</div>
				<div class="col-lg-4 mr-auto text-center">
					<i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
					<!-- Make sure to change the email address in BOTH the anchor text and the link target below!-->
					<a class="d-block" href="mailto:kokoder1@naver.com">kokoder1@naver.com</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="bg-light py-5">
		<div class="container">
			<div class="small text-center text-muted">Copyright © 2020 -
				Start Bootstrap</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value="/resources/js/scripts.js" />"></script>
</body>
<script type="text/javascript">
    $( document ).ready(function() {
        $('.carousel-item:eq(0)').addClass('active');
//     	$.ajax({
//         	url : "/movie/test.do",
//         	type : 'get',
//         	contentType: "application/json; charset=utf-8;",
//             dataType: "json",
//           	success: function(data){
//               	var str = data.imgurl+'';
//               	var list = str.split(",");
// 	             //console.log(list.size);
//               	for(var i = 1; i <= 3; i++){
//               		$('#top'+i).attr('src',list[i-1]);
// 	              	console.log($('#top'+i).attr('src'));
//                   }
//           	},
//           	error: function(){
//           		alert("error");
//           	}
//         });
       
    });
    
    </script>

</html>


