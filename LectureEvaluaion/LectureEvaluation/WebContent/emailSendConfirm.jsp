<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv = "Content-Type" content="text/html; charset=UTF-8">
	<meta name = "viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 	viewport는 화면관련설은을 담당, width=device-width는 크기에 알맞게 화면조정, initial-scale=1는 초기 확대/축소값 조정, shrink-to-fit=no는 사파리 브라우저에서 필요한 내용-->	 
	<title>The Red Devils</title>
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/custom.css">
</head>

<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");	
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">The Red Devils</a>
      	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
        	<span class="navbar-toggler-icon"></span>
     	</button>
     	<div class = "collapse navbar-collapse" id="navbar">
     		<ul class ="navbar-nav mr-auto">
     			<li class="nav-item active">
     				<a class = "nav-link" href="index.jsp">메인</a>
     			</li>
     			<li class="nav-item dropdown">
     				<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
     					회원관리
     				</a>
     				<div class="dropdown-menu" aria-labelledby="dropdown">
<%
	if(userID == null){
%>     				    				    				     			
     					<a class="dropdown-item" href="userLogin.jsp">로그인</a>
     					<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
<%
	} else {
%>
     					<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
<%
	}
%>
     				</div>
     			</li>
     		</ul>
     		<form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
     			<input type="text" name="search" class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">
     			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
     		</form>
     	</div>
	</nav>
	
<!--본문 내용을 담을 때는 section 사용-->
 	<section class = "container mt-3" style="max-width: 560px;">
 		<div class = "alert alert-warning mt-4" role="alert">
 			이메일 주소 인증을 하셔야 이용 가능합니다. 인증 메일을 받지 못하셨나요?
 		</div>
 		<a href = "emailSendAction.jsp" class="btn btn-primary">인증 메일 다시받기</a>
	</section>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2019 WENO ALL Rights Reserved.
	</footer>
	



	<script src = "./js/jquery.min.js"></script>
	<script src = "./js/popper.js"></script>
	<script src = "./js/bootstrap.min.js"></script>
	
</body>
</html>