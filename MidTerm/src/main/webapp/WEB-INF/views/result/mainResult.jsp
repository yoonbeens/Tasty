<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- reset.css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	
<link href="${pageContext.request.contextPath}/css/mainResult.css" rel="stylesheet">
</head>


<body>
	<div class="wrapper">
		<div class="header">
			<form action="${pageContext.request.contextPath}/result/mainResult"	method="post">
				<div id="searchInfo">
					<select name="weather">
						<option disabled selected>${searchCondition.weather}</option>
						<option value="맑음">맑음</option>
						<option value="흐림">흐림</option>
						<option value="비">비</option>
						<option value="오늘의날씨">오늘의날씨</option>
					</select> <select name="condition">
						<option disabled selected>${searchCondition.condition}</option>
						<option value="보통">보통</option>
						<option value="다이어트중">다이어트중</option>
						<option value="술마시고싶어요">술마시고싶어요</option>
					</select> <select name="feeling">
						<option disabled selected>${searchCondition.feeling}</option>
						<option value="신나요">신나요</option>
						<option value="우울해요">우울해요</option>
						<option value="피곤해요">피곤해요</option>
						<option value="특별한날">특별한날</option>
					</select>
					<button type="submit">다시추천</button>
			</form>



		</div>
		<div id="category">
		
		<a>모두보기</a>/<a>추천레시피</a>/<a>유저레시피</a>
		</div>

	</div>
	<div class="resultWrapper">
		<a href="${pageContext.request.contextPath}/result/resultDetail" class ="result">test</a>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
		<div class="result"></div>
	</div>
	</div>
	<aside>
		<div id="logo">
			로고 <img src="" alt="">
		</div>
		<div id="menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/midterm">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/mypageResult" >MyPage</a></li>
				<li>Following</li>
				<li>LogOut</li>
			</ul>


		</div>
	</aside>
</body>
</html>

<script>

function searchRecipe(){
	
}


</script>