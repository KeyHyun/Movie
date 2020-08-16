<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 아래는 반응형 웹에 사용되는 기본 Meta --%>
<meta name="viewport" content="width=divice-width", initial-scale="1">
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<link rel="stylesheet" href="../resources/css/custom.css">
<title></title>
</head>
<body>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post">
					<h3 style="text-align: center;">수정화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userid" value="${dto.userid}" readonly maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="passwd" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="name" value="${dto.name}" maxlength="20">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="email" value="${dto.email}" maxlength="20">
					</div>
					<div style="display: inline-block">
					<input type="submit" class="btn btn-primary form-control" value="수정하기" formaction="update.do">
					</div>
					<div style="display: inline-block">
					<input type="submit" class="btn btn-primary form-control" value="삭제하기" formaction="delete.do" >
					</div>
					<div style="display: inline-block; color:red">${message}
					</div>
				</form>
		</div>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../resources/js/bootstrap.js"></script>
</body>
</html>