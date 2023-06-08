<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tasty Friends</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">

<!-- reset.css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link href="${pageContext.request.contextPath}/css/resultDetail.css" rel="stylesheet">


</head>
<body>

	<div class="wrapper">
		<div class="header">
		<div class="title">요리제목</div>
		</div>
		<div class="resultWrapper">
			<div class="result" id="mainImg">이미지</div>			
			<div class="result" id="ingrdient">재료</div>			
			<div class="result" id="cooking">조리법</div>
		</div>
	</div>

	<aside>
		<div id="logo">
			로고 <img src="" alt="">
		</div>
		<div id="count">
			__명의 친구가 요리했어요
		</div>
		<div class ="articleWrapper">
			<div class="article"> 후기1</div>
			<div class="article"> 후기2</div>
			<div class="article"> 후기3</div>
			<div class="article"> 후기4</div>
			<div class="article"> 후기5</div>

		</div>
		<div id="menu"></div>
	</aside>
</body>
</html>