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

</head>
<style>
body {
	display: flex;
}

.wrapper {
	box-sizing: border-box;
	width: 80%;
	height: 100vh;
	border: 1px solid red;
}

.wrapper .header {
	box-sizing: border-box;
	width: 100%;
	height: 10vh;
	border: 1px solid black;
	position: relative;
	padding-left: 70px;
	padding-right: 70px;
}

.wrapper .resultWrapper {
	box-sizing: border-box;
	width: 100%;
	height: 90vh;
	border: 1px solid green;
	overflow: auto;
	display: flex;
	justify-content: space-evenly;
	flex-wrap: wrap;
	padding-top: 10px;
}

.result {
		box-sizing: border-box;
	display: block;
	width: 30%;
	height: 500px;
	border: 1px solid blue;
	margin-bottom: 20px;
}

aside {
	box-sizing: border-box;
	width: 20%;
	height: 100vh;
	border: 1px solid black;
}

#logo {
	box-sizing: border-box;
	width: 100%;
	height: 10vh;
	border: 1px solid green;
}

a {
	text-decoration: none;
	cursor: pointer;
}

.articleWrapper {
	box-sizing: border-box;
	width: 100%;
	height: 60vh;
	border: 1px solid red;
	overflow: auto;
}

.article {
	box-sizing: border-box;
	width: 100%;
	height: 20vh;
	border: 1px solid blue;
	margin-bottom: 10px;
}

.title {
	box-sizing: border-box;
	width: 70%;
	height: 10vh;
	border: 1px solid blue;
	line-height: 10vh;
}

#count {
	width: 100%;
	height: 20vh;
	border: 1px solid red;
	line-height: 20vh;
}
</style>
<body>

	<div class="wrapper">
		<div class="header">
			<div class="title">요리제목</div>
		</div>
		<div class="resultWrapper">
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
			<img src="" alt="">
		</div>
		<div id="count"></div>
		<div class="articleWrapper">
	
		</div>
		<div id="menu"></div>
	</aside>

	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
	Launch demo modal
  </button>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
		  ...
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		  <button type="button" class="btn btn-primary">Save changes</button>
		</div>
	  </div>
	</div>
  </div>
</body>
</html>

<script>

	document.getElementById('resultWrapper').addEventListener('click', e=>{
		e.preventDefault();
		if(!e.target.matches('a')) return;
		$('#replyModal').modal('show');
	});

</script>