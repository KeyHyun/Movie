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
 <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/booking.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/custom.css" />
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
			<a class="navbar-brand js-scroll-trigger" href="/">Key's
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
		<div class="container" style="height : 600px">
			 <div class="reserve-container h-100">
        <div class="movie-part" style="width : 200px">
            <div class="reserve-title">영화</div>
               <c:forEach var="i" items="${movie}">
            	<button class="m_button" name="movie" data-movie="${i}">${i}</button><br>          	
			</c:forEach>
            </div>
                 
        <div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="reserve-date" style="height : 568px"></div>
        </div>
        <div class="time-part">
            <div class="reserve-title">시간</div>
        </div>
         
			
            </div>
        </div>
        <div style="text-align:center;">
        <form method="post" action="selectSeat.do">
        <input type='hidden' id='selected_time' name='s_time'>
        <input type='hidden' id='selected_movie' name='s_movie'>
        <input type='hidden' id='selected_branch' name='s_branch'>
        <input class="r_button" type="submit" value="예매하기" name="reser">
        </form>
        </div>


   
    <script>



    $( document ).ready( function() {      
    	const date = new Date();
        // console.log(date.getFullYear());
        const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
        const reserveDate = document.querySelector(".reserve-date");

      
           const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
           const year = date.getFullYear();
           const month = date.getMonth();
           for (i = date.getDate(); i <= lastDay.getDate(); i++) {

               const button = document.createElement("button");
               const spanWeekOfDay = document.createElement("span");
               const spanDay = document.createElement("span");

               //class넣기
               button.classList = "movie-date-wrapper"
               spanWeekOfDay.classList = "movie-week-of-day";
               spanDay.classList = "movie-day";

               //weekOfDay[new Date(2020-03-날짜)]
               const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

               //요일 넣기
               if (dayOfWeek === "토") {
                   spanWeekOfDay.classList.add("saturday");
                   spanDay.classList.add("saturday");
               } else if (dayOfWeek === "일") {
                   spanWeekOfDay.classList.add("sunday");
                   spanDay.classList.add("sunday");
               }
               spanWeekOfDay.innerHTML = dayOfWeek;
               button.append(spanWeekOfDay);
               //날짜 넣기
               spanDay.innerHTML = i;
               button.append(spanDay);
               //button.append(i);
               reserveDate.append(button);

               dayClickEvent(button);
           }


        function dayClickEvent(button) {
            button.addEventListener("click", function() {
                const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                movieDateWrapperActive.forEach((list) => {
                    list.classList.remove("movie-date-wrapper-active");
                })
                button.classList.add("movie-date-wrapper-active");
            })
        }
             	
        $(".m_button").on('click',function(){
            alert($(this).html());
        	console.log($(this).data('movie'));
        	$('.m_button').removeClass('selected_movie');
    		$(this).addClass("selected_movie");
    	    $('#selected_movie').val($(this).data('movie'));
        	var movie = $(this).data('movie');
             $.ajax({
             url : "/movie/s_movie.do",
             data:{"movie":movie},
             dataType: "json",
             success: function(data){
                 console.log(data.s_list.length);
                 $('.time-part button').remove();
				 $('.theater-part button').remove();
                 for(var i = 0; i < data.s_list.length; i++){
                     var tt = data.s_list[i].s_time;
                     var ss = data.s_list[i].s_branch;
                     	$btn = $('<button class="times" onclick="clicktime('+i+')" data-time='+tt+' data-branch='+ss+' style="width:380px;height:50px">'+data.s_list[i].s_time+'<br>'+data.s_list[i].s_branch+'</button>');
//                      	$bts = $('<button class="times" style="width:100px;height:100px">');
// 						<button class="m_button" name="movie" data-movie="${i}">${i}</button><br>  
						$('.time-part').append($btn);
// 						$('.theater-part').append($bts);
						console.log($btn);
						console.log($('.time-part').html());
						
                     }
             },
             error: function(){
                console.log("실패");
             }
          });
            
		}); 
    });

    function clicktime(index){
        console.log(index);
        $('.times').removeClass('selected_time');
		$('.times:eq('+index+')').addClass("selected_time");
		$('#selected_time').val($('.times:eq('+index+')').data('time'));
		$('#selected_branch').val($('.times:eq('+index+')').data('branch'));
		console.log()
        }
        

        </script>
	
	</header>


</html>


