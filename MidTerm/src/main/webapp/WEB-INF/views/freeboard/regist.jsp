<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/regist.css" rel="stylesheet">
</head>

<body>
	<div class="container">
		<div id="imgcon">


		</div>
	
		<form action="${pageContext.request.contextPath}/freeboard/regist" method="post" enctype="multipart/form-data">
			<label for="file">이미지업로드</label>
			<input multiple="multiple" type="file" name="file" id="file">
			<input type="hidden" name="userId" value="${login.userId}">
			<table class="table">
				<tbody class="t-control">
					<tr>
						<td><textarea class="form-control" rows="7" name="content"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="titlefoot">
				<button class="btn" type="submit">등록</button>
			</div>
		</form>
	</div>
</body>

</html>

<script>
	document.getElementById('file').onchange = function () {
		readURL(this); //this는 #file자신 태그를 의미

	};

	let strimg='';

	function readURL(input) {
		if (input.files && input.files[0]) {
			console.log(input.files.length);

			for (var i = 0; i < input.files.length; i++) {
				var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
				//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
				reader.readAsDataURL(input.files[i]);
				//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
				//$(".fileDiv").css("display", "block");

				strimg=`
						<img class="fileImg" src="">
						`;
				document.getElementById('imgcon').insertAdjacentHTML('afterbegin', strimg);
				//document.querySelector('.fileDiv').style.display = 'block';

				reader.onload = function (event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
					document.getElementById('imgcon').lastElementChild.setAttribute('src', event.target.result);
					console.log(event.target) //event.target은 이벤트로 선택된 요소를 의미
				}
				
			}
		}
	}
</script>