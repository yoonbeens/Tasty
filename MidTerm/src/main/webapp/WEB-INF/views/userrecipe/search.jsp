<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Friends</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">

</head>
<body>

<form action="${pageContext.request.contextPath}/userrecipe/search" method="POST">
  <input type="text" name="query" placeholder="검색어를 입력하세요">
  <button type="submit">검색</button>
</form>

</body>
</html>