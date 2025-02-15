<%@page import="com.midterm.foodSNS.command.MRecipeVO"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<title>Bootstrap demo</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="${pageContext.request.contextPath}/css/mainResult.css" rel="stylesheet">
<<<<<<< HEAD
=======
	
	<style type="text/css">
		@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");

*,
*::before,
*::after {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

body,
input {
  font-family: "Poppins", sans-serif;
}

#mainDiv {
	display: block;
}

main {
  width: 100%;
  min-height: 100vh;
  overflow: hidden;
  background-color: #ff8c6b;
  padding: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
}


.box {
  position: relative;
  width: 100%;
  max-width: 1020px;
  height: 640px;
  background-color: #fff;
  border-radius: 3.3rem;
  box-shadow: 0 60px 40px -30px rgba(0, 0, 0, 0.27);
}

.inner-box {
  position: absolute;
  width: calc(100% - 4.1rem);
  height: calc(100% - 4.1rem);
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.forms-wrap {
  position: absolute;
  height: 100%;
  width: 45%;
  top: 0;
  left: 0;
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 1fr;
  transition: 0.8s ease-in-out;
}

form {
  max-width: 260px;
  width: 100%;
  margin: 0 auto;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  grid-column: 1 / 2;
  grid-row: 1 / 2;
  transition: opacity 0.02s 0.4s;
}

form.sign-up-form {
  opacity: 0;
  pointer-events: none;
}

.logo {
  display: flex;
  align-items: center;
}

.logo img {
  width: 27px;
  margin-right: 0.3rem;
}

.logo h4 {
  font-size: 1.1rem;
  margin-top: -9px;
  letter-spacing: -0.5px;
  color: #151111;
}

.heading h2 {
  font-size: 2.1rem;
  font-weight: 600;
  color: #151111;
}

.heading h6 {
  color: #bababa;
  font-weight: 400;
  font-size: 0.75rem;
  display: inline;
}

.toggle {
  color: #151111;
  text-decoration: none;
  font-size: 0.75rem;
  font-weight: 500;
  transition: 0.3s;
}

.toggle:hover {
  color: #8371fd;
}

.input-wrap {
  position: relative;
  height: 37px;
  margin-bottom: 2rem;
}

.input-field {
  position: absolute;
  width: 100%;
  height: 100%;
  background: none;
  border: none;
  outline: none;
  border-bottom: 1px solid #bbb;
  padding: 0;
  font-size: 0.95rem;
  color: #151111;
  transition: 0.4s;
}

label {
  position: absolute;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  font-size: 0.95rem;
  color: #bbb;
  pointer-events: none;
  transition: 0.4s;
}

.input-field.active {
  border-bottom-color: #151111;
}

.input-field.active + label {
  font-size: 0.75rem;
  top: -2px;
}

.sign-btn {
  display: inline-block;
  width: 100%;
  height: 43px;
  background-color: #151111;
  color: #fff;
  border: none;
  cursor: pointer;
  border-radius: 0.8rem;
  font-size: 0.8rem;
  margin-bottom: 2rem;
  transition: 0.3s;
}

.sign-btn:hover {
  background-color: #8371fd;
}

.text {
  color: #bbb;
  font-size: 0.7rem;
}

.text a {
  color: #bbb;
  transition: 0.3s;
}

.text a:hover {
  color: #8371fd;
}

main.sign-up-mode form.sign-in-form {
  opacity: 0;
  pointer-events: none;
}

main.sign-up-mode form.sign-up-form {
  opacity: 1;
  pointer-events: all;
}

main.sign-up-mode .forms-wrap {
  left: 55%;
}

main.sign-up-mode .carousel {
  left: 0%;
}

.carousel {
  position: absolute;
  height: 100%;
  width: 55%;
  left: 45%;
  top: 0;
  background-color: #ffe0d2;
  border-radius: 2rem;
  display: grid;
  grid-template-rows: auto 1fr;
  padding-bottom: 2rem;
  overflow: hidden;
  transition: 0.8s ease-in-out;
}

.images-wrapper {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 1fr;
}

.image {
  width: 100%;
  grid-column: 1/2;
  grid-row: 1/2;
  opacity: 0;
  transition: opacity 0.3s, transform 0.5s;
}

.img-1 {
  transform: translate(0, -50px);
}

.img-2 {
  transform: scale(0.4, 0.5);
}

.img-3 {
  transform: scale(0.3) rotate(-20deg);
}

.image.show {
  opacity: 1;
  transform: none;
}

.text-slider {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.text-wrap {
  max-height: 2.2rem;
  overflow: hidden;
  margin-bottom: 2.5rem;
}

.text-group {
  display: flex;
  flex-direction: column;
  text-align: center;
  transform: translateY(0);
  transition: 0.5s;
}

.text-group h2 {
  line-height: 2.2rem;
  font-weight: 600;
  font-size: 1.6rem;
}

.bullets {
  display: flex;
  align-items: center;
  justify-content: center;
}

.bullets span {
  display: block;
  width: 1rem;
  height: 1rem;
  background-color: #aaa;
  margin: 0 0.5rem;
  border-radius: 50%;
  cursor: pointer;
  transition: 0.3s;
}

.bullets span.active {
  width: 2.1rem;
  background-color: #151111;
  border-radius: 1rem;
}

@media (max-width: 850px) {
  .box {
    height: auto;
    max-width: 550px;
    overflow: hidden;
  }

  .inner-box {
    position: static;
    transform: none;
    width: revert;
    height: revert;
    padding: 2rem;
  }

  .forms-wrap {
    position: revert;
    width: 100%;
    height: auto;
  }

  form {
    max-width: revert;
    padding: 1.5rem 2.5rem 2rem;
    transition: transform 0.8s ease-in-out, opacity 0.45s linear;
  }

  .heading {
    margin: 2rem 0;
  }

  form.sign-up-form {
    transform: translateX(100%);
  }

  main.sign-up-mode form.sign-in-form {
    transform: translateX(-100%);
  }

  main.sign-up-mode form.sign-up-form {
    transform: translateX(0%);
  }

  .carousel {
    position: revert;
    height: auto;
    width: 100%;
    padding: 3rem 2rem;
    display: flex;
  }

  .images-wrapper {
    display: none;
  }

  .text-slider {
    width: 100%;
  }
}

@media (max-width: 530px) {
  main {
    padding: 1rem;
  }

  .box {
    border-radius: 2rem;
  }

  .inner-box {
    padding: 1rem;
  }

  .carousel {
    padding: 1.5rem 1rem;
    border-radius: 1.6rem;
  }

  .text-wrap {
    margin-bottom: 1rem;
  }

  .text-group h2 {
    font-size: 1.2rem;
  }

  form {
    padding: 1rem 2rem 1.5rem;
  }
}







/* timer */

:root {
  --clockColor: #ff6e6e;
  /* --bgColor: #c5e1ff; */
  --timerTime: 180s;
  --grPercent: 47.5%;
}

#content {
  display: flex;
  align-items: center;
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
}

/*폰트 인클루드*/

/* @font-face {
  font-family: "ROKAFSlabSerifBold";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts2201-3@1.0/ROKAFSlabSerifBold.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}

@font-face {
  font-family: "Cafe24Ohsquareair";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202@1.0/Cafe24Ohsquareair.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}

html,
body {
  height: 100%;
  width: 100%;
  margin: 0;
  padding: 0;

  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  background-color: var(--bgColor);
  font-family: "Open Sans", sans-serif;

  scroll-behavior: smooth;
} */

#text {
  margin-top: 40px;
  margin-bottom: -25px;

  display: flex;
  justify-content: center;

  transform: scale(1);
  transition-duration: 0.5s;

  font-family: "ROKAFSlabSerifBold";
  font-size: 20pt;
  color: darkgrey;
  margin-bottom: 30px;

  animation-name: text;
  animation-duration: var(--timerTime);
  animation-play-state: paused;
  animation-iteration-count: infinite;
  animation-fill-mode: forwards;

  cursor: pointer;
}

#text:hover {
  transition-duration: 0.5s;
  transform: scale(1.2);
}

#speechBubble {
  animation: shake 0.3s linear 0s infinite alternate;
  margin-top: 0;
}

@keyframes text {
  0% {
    color: darkgrey;
  }
  100% {
    color: var(--clockColor);
  }
}

.clockBox {
  margin-top: 10px;
  margin-bottom: 50px;
  margin-left: 0px;
  margin-right: 0px;

  width: 130px;
  height: 130px;

  display: flex;
  align-items: center;
  justify-content: center;

  background: rgba(255, 255, 255, 0.15);
  /* box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); */
  backdrop-filter: blur(5px);
  -webkit-backdrop-filter: blur(5px);
  border-radius: 40px;
  border: 1.5px solid rgba(255, 255, 255, 0.18);
}

#timer {
  background: -webkit-linear-gradient(left, var(--clockColor) var(--grPercent), #eee 50%);
  /* Foreground color, Background colour */
  border-radius: 100%;
  height: 100px;
  /* Height and width */
  position: relative;
  width: 100px;
  /* Height and width */
  animation-name: time;
  animation-duration: var(--timerTime);
  animation-timing-function: linear;
  animation-play-state: paused;
  animation-iteration-count: infinite;
  animation-fill-mode: forwards; 
  cursor: pointer;
}

#mask {
  border-radius: 100% 0 0 100% / 50% 0 0 50%;
  height: 100%;
  left: 0;
  position: absolute;
  top: 0;
  width: 50%;

  animation-name: mask;
  animation-duration: var(--timerTime);
  animation-timing-function: linear;
  animation-play-state: paused;
  animation-iteration-count: infinite;
  animation-fill-mode: forwards;

  transform-origin: 100% 50%;
}
@keyframes time {
  0% {
  }
  100% {
    transform: rotate(360deg);
  }
}

@keyframes mask {
  0% {
    background: #eee;
    /* Background colour */
    transform: rotate(0deg);
  }
  50% {
    background: #eee;
    /* Background colour */
    transform: rotate(-180deg);
  }
  50.01% {
    background: var(--clockColor);
    /* Foreground colour */
    transform: rotate(0deg);
  }
  100% {
    background: var(--clockColor);
    /* Foreground colour */
    transform: rotate(-180deg);
  }
}

/* modal css */
.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.3);

  /* 숨기기 */
  z-index: -1;
  opacity: 0;
}

.show {
  opacity: 1;
  z-index: 1000;
  transition: all 0.5s;
}

.window {
  position: relative;
  width: 100%;
  height: 100%;
}

.popup {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  backdrop-filter: blur(16px) saturate(180%);
  -webkit-backdrop-filter: blur(16px) saturate(180%);
  background-color: rgba(255, 255, 255, 0.75);
  border-radius: 20px;
  border: 1px solid rgba(209, 213, 219, 0.3);

  /* 임시 지정 */
  width: 500px;
  height: 500px;

  transform: translate(-50%, -40%);
}

.show .popup {
  transform: translate(-50%, -50%);
  transition: all 0.5s;
}

input[type="color"] {
  padding: 0;
  width: 150%;
  height: 150%;
  margin: -25%;

  cursor: pointer;
}

.cp_wrapper {
  overflow: hidden;
  width: 2em;
  height: 2em;
  /* optional formatting below here */
  border-radius: 50%;
  box-shadow: 1px 1px 3px 0px grey;
  margin: 1em;
}

.wrapper {
  margin-top: 40%;
  display: flex;
  justify-content: center;
  align-content: center;
}

#submit {
  width: 100px;
  height: 30px;

  position: relative;
  border: none;
  display: inline-block;
  border-radius: 15px;
  font-family: "paybooc-Light", sans-serif;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  text-decoration: none;
  font-weight: 600;
  transition: 0.25s;

  background-color: #408080;
  color: #e9ded8;
}

#submit:hover {
  background-color: #2f5f5f;
  color: #f6f4f4;
}

.select {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  align-content: center;
}

input[type="number"] {
  width: 100px;
  height: 30px;
  margin: 10px;
  border-radius: 20px;
  border: none;
  -webkit-appearance: none;
  -moz-appearance: textfield;
  text-align: center;
}

#hour:focus {
  border: 2px solid #408080;
}

#min:focus {
  border: 2px solid #408080;
}

#sec:focus {
  border: 2px solid #408080;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;

  margin: 0;
}

input::placeholder {
  text-align: center;
}

.balloon {
  position: relative;
  display: inline-block;
  margin-bottom: 15px;
}

.balloon span {
  display: inline-block;
  padding: 10px;
  color: #fff;

  background: rgba(61, 61, 61, 0.87);
  border-radius: 16px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(6.4px);
  -webkit-backdrop-filter: blur(6.4px);
  border: 1px solid rgba(61, 61, 61, 0.38);
}

.balloon:after {
  content: "";
  position: absolute;
  width: 0;
  height: 0;
  border-style: solid;
}

.balloon.top:after {
  border-color: rgba(61, 61, 61, 0.87) transparent transparent transparent;
  bottom: -25px;
  border-width: 15px 10px;
  left: 50%;
  margin-left: -10px;
}

@keyframes shake {
  0% {
    margin-top: 0px;
  }
  100% {
    margin-top: 20px;
  }
}

#speech {
  font-family: Cafe24Ohsquareair;
  position: absolute;

  margin-bottom: 600px;

  visibility: visible;

  animation: shake;
  animation-duration: 0.3s;
  animation-iteration-count: 6;
  animation-direction: alternate;
  animation-delay: 1s;
}

@keyframes showToast {
  20% {
    opacity: 100%;
  }
  90% {
    opacity: 0%;
  }
}

.toast {
  opacity: 0%;

  width: 250px;
  height: 20px;
  height: auto;
  position: fixed;
  left: 50%;
  margin-left: -125px;
  bottom: 100px;
  z-index: 9999;
  background-color: #383838;
  color: #f0f0f0;
  font-family: Calibri;
  font-size: 15px;
  padding: 10px;
  text-align: center;
  border-radius: 5px;
  -webkit-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1);
  -moz-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1);
  box-shadow: 0px 0px 15px -1px rgba(56, 56, 56, 1);

  animation-name: showToast;
  animation-timing-function: ease;
  animation-duration: 4s;
  animation-play-state: paused;
}

button {
  margin: 10px;
}


#reset {
  margin-bottom: 5px;

  position: relative;
  border: none;
  display: none;
  padding: 15px 30px;
  border-radius: 15px;
  font-family: "paybooc-Light", sans-serif;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  text-decoration: none;
  font-weight: 600;
  transition: 0.25s;

  background-color: #408080;
  color: #ffeee4;
  cursor: pointer;
}

#reset:hover {
  transform: scale(1.02);
}

#fullButton {
  margin-bottom: 5px;

  position: relative;
  border: none;
  display: inline-block;
  padding: 15px 30px;
  border-radius: 15px;
  font-family: "paybooc-Light", sans-serif;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  text-decoration: none;
  font-weight: 600;
  transition: 0.25s;

  background-color: #408080;
  color: #ffeee4;
  cursor: pointer;
}

#buttons {
  display: flex;
  flex-direction: column;
  align-content: center;

  margin-top: 40px;
}

#formReset {
  width: 100px;
  height: 30px;

  margin: 10px;

  position: relative;
  border: none;
  display: inline-block;
  border-radius: 15px;
  font-family: "paybooc-Light", sans-serif;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  text-decoration: none;
  font-weight: 600;
  transition: 0.25s;

  background-color: #f6f4f4;
  color: #408080;
}

#formReset:hover {
  background-color: #2f5f5f;
  color: #f6f4f4;
}

#colorBox {
  display: flex;
  justify-content: center;
}

#clColor {
  margin-right: 30px;
}

#bgColor {
  margin-left: 30px;
}

#content {
  display: flex;
  flex-direction: column;

  background-color: var(--bgColor);
}

#close {
  /* New added property */
  width: 20px;
  height: 20px;
  border: none;
  border-radius: 10px;
  background-color: var(--clockColor);
  color: var(--clockColor);
}

#close:hover {
  color: white;
  background-color: #e56262;
}

.popupText {
  font-family: "Cafe24Ohsquareair";
}


/* 반응형 미디어쿼리 */

@media (max-width: 520px) {
  .popup {
    /* width: 500px; */
    width: 350px;
  }

  #sec {
    width: 220px;
  }
}

@media (max-width: 430px) {
  .clockBox {
    width: 350px;
    height: 350px;
  }
}

@media (max-width: 400px) {
  #buttons {
    /* flex-direction: column; */
    /* align-content: center; */
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 40px;
    margin-bottom: 20px;
  }

  /* #timerButton {
    width: 150px;
  } */

  #reset {
    width: 150px;
  }

  .popup {
    /* width: 500px; */
    width: 350px;
  }

  #speech {
    margin-bottom: 570px;
  }

  #sec {
    width: 220px;
  }
}
		
	</style>
	
>>>>>>> yb
</head>

<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">

	</script>
	<div id="main-con">
		<div id="main-left">ddd</div>
		<div id="main">
			<%
			ArrayList<MRecipeVO> recipes = new ArrayList<>();
			recipes = (ArrayList<MRecipeVO>) request.getAttribute("recipe");
			for (int i = 0; i < recipes.size(); i++) {
				
			
			%>
<<<<<<< HEAD
			<div class="boxbox scale" data-bs-toggle="modal" data-bs-target="#myModal">
				<img class="titleimg " alt="결과이미지" data-userid="${login.userId}"
					data-cooknum=<%=recipes.get(i).getCooknum()%> src="<%=recipes.get(i).getTitleimg()%>" alt="default">
=======
			<div class="boxbox" data-bs-toggle="modal" data-bs-target="#myModal">
				<img class="titleimg" alt="결과이미지" data-userid="${login.userId}"
					data-cooknum=<%=recipes.get(i).getCooknum()%> src="<%=recipes.get(i).getTitleimg()%>">
>>>>>>> yb
			</div>
			<%
		}
		%>
		</div>

		<div id="main-right">ddd</div>




	</div>




	<nav class="navbar bg-success fixed-top ">
		<div class="container-fluid">
			<a class="navbar-brand text-light" href="#">Tasty Friend</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
				aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<aside>
						<div id="logo">
							<img src="" alt="">
						</div>
						<div id="profile-img-con">
							<img src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}"
								alt="default" id="profile-img">
						</div>
						<div class="profileWrapper">
							<div id="simpleProfile">
								<h1>${login.userId}</h1>
								<a href="${pageContext.request.contextPath}/user/userProfileModify"
									id="promodify">프로필수정</a>
								<h3>${login.userNick}</h3>
								<h5>${login.message}</h5>
							</div>
							<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
								<li class="nav-item"><a class="nav-link active" aria-current="page"
										href="${pageContext.request.contextPath}/">Home</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Follow
										Chief</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Add
										My Recipe</a></li>
								<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath}/freeboard/regist">Add
										My Story</a></li>


								<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath}/mypage/mypageResult">마이페이지(임시)</a></li>

								<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button"
										data-bs-toggle="dropdown" aria-expanded="false"> Option </a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">회원정보수정</a></li>
										<li><a class="dropdown-item" href="#">Another action</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" href="#">Logout</a></li>
									</ul>
							</ul>


						</div>


					</aside>
				</div>

			</div>
		</div>
	</nav>

</body>


<!-- Modal -->
<<<<<<< HEAD
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-body">

=======
<!-- <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-body">
>>>>>>> yb
				<div id="foodname"></div>
				<div class="modal-img">
					<img alt="" src="" id="titleimg">
				</div>
				<div id="ingredient"></div>
				<div id="tip"></div>
				<div class="modal-img">
					<img src="" id="img1">
				</div>
				<div id="text1"></div>
				<div class="modal-img">
					<img id="img2">
				</div>
				<div id="text2"></div>
				<div class="modal-img">
					<img id="img3">
				</div>
				<div id="text3"></div>
				<div class="modal-img">
					<img id="img4">
				</div>
				<div id="text1"></div>
<<<<<<< HEAD
			</div>
			<div class="modal-like">
				<div id="likenum"></div>
				<button type="button" id="likeBtn">좋아요</button>

			</div>
		</div>
=======
			</div>
			<div class="modal-like">
				<div id="likenum"></div>
				<button type="button" id="likeBtn">좋아요</button>
			</div>
		</div> -->
		
<div id="mainDiv">
	<main>
      <div class="box">
        <div class="inner-box">
          <div class="forms-wrap">
            <form action="index.html" autocomplete="off" class="sign-in-form">
              <div class="logo">
                <!-- <img src="./img/logo.png" alt="easyclass" /> -->
                <h4>SOUP</h4>
              </div>

              <div class="heading">
                <h2 id="foodname"></h2>
                <h6>댓글 쓰러 가기</h6>
                <a href="#" class="toggle">comment</a>
              </div>

              <div class="actual-form">
                <div class="input-wrap">
                  <!-- <input
                    type="text"
                    minlength="4"
                    class="input-field"
                    autocomplete="off"
                    required
                  /> -->
                  <label>재료 소개</label>
                  <div id="ingredient"></div>
                </div>

                <div class="input-wrap">
                  <!-- <input
                    type="password"
                    minlength="4"
                    class="input-field"
                    autocomplete="off"
                    required
                  /> -->
                  <label>예상 조리 시간</label>
                  <!-- <div>예상 조리 시간</div> -->
                </div>

                <!-- <input type="submit" value="Timer Strat" class="sign-btn" />

                <p class="text">
                  Forgotten your password or you login datails?
                  <a href="#">Get help</a> signing in
                </p> -->







                

                
                <div id="content">
                  <div id="f5Text">
                    <div id="text" style="margin-bottom: -25px;">
                      <span id="minutes">3</span> <span> minutes</span>
                    </div>
                    <!--end text-->
                  </div>
                  <!--end f5Text-->
             
                  <!--modal pop-up-->
                  <div class="background">
                    <div class="window">
                      <div class="popup">
                        <button id="close">X</button>
                        <form>
                          <div class="select">
                            <input id="hour" type="number" placeholder="시간" />
                            <input id="min" type="number" placeholder="분" />
                            <input id="sec" type="number" placeholder="초" />
                          </div>
                          <!--end select-->
                          <br />
                          <br />
                          <div id="colorBox">
                            <div id="clColor">
                              <span class="popupText">시계 색상</span>
                              <div class="cp_wrapper">
                                <input id="clockColor" type="color" value="#ff6e6e" />
                              </div>
                              <!--end cp_wrapper-->
                            </div>
                            <!--end clColor-->
                            <div id="bgColor">
                              <span class="popupText">배경 색상</span>
                              <div class="cp_wrapper">
                                <input id="backColor" type="color" value="#c5e1ff" />
                              </div>
                              <!--end cp_wrapper-->
                            </div>
                            <!--end bgColor-->
                          </div>
                          <!--end colorBox-->
                          <!--end cp_wrapper-->
                          <div class="wrapper">
                            <input type="reset" id="formReset" value="기본값" />
                            <button type="button" id="submit">적용</button>
                          </div>
                          <!--end wrapper-->
                        </form>
                      </div>
                      <!--end popup-->
                    </div>
                    <!--end window-->
                  </div>
                  <!--end background-->
                  
                  
                  <div class="zoomContents">
                    <div id="buttons">
                      <!-- <button id="timerButton" class="start">시작</button> -->
                      <button id="reset">초기화</button>
                    </div>
                    <div class="clockBox">
                        <div id="f5">
                            <div id="timer" class="start">
                                <div id="mask"></div>
                                <!--end mask-->
                            </div>
                            <!--end timer-->
                        </div>
                    </div>
                    <!--end clockBox, #f5-->
                    <!--end buttons-->
                  </div>
                  <!--end zoomContents-->
                </div>
                <!--end content-->
                <!--<button id="fullButton">전체화면</button>-->
                <div class="toast">Error</div>
                <script src="script.js"></script>
                <!-- toastr js 라이브러리 -->
                <script
                  type="text/javascript"
                  src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
                ></script>


              </div>
            </form>

            <form action="index.html" autocomplete="off" class="sign-up-form">
              <div class="logo">
                <!-- <img src="./img/logo.png" alt="easyclass" /> -->
                <h4>좋아요</h4>
                <h4>즐겨찾기</h4>
              </div>

              <div class="heading">
                <h2>Get Started</h2>
                <h6>요리 시간 재기</h6>
                <a href="#" class="toggle">Timer</a>
              </div>

              <div class="actual-form">
                <div class="input-wrap">
                  <input
                    type="text"
                    minlength="4"
                    class="input-field"
                    autocomplete="off"
                    required
                  />
                  <label>Name</label>
                </div>

                <div class="input-wrap">
                  <input
                    type="email"
                    class="input-field"
                    autocomplete="off"
                    required
                  />
                  <label>Email</label>
                </div>

                <div class="input-wrap">
                  <input
                    type="password"
                    minlength="4"
                    class="input-field"
                    autocomplete="off"
                    required
                  />
                  <label>Password</label>
                </div>

                <input type="submit" value="Sign Up" class="sign-btn" />


              </div>
            </form>
          </div>

          <div class="carousel">
            <div class="images-wrapper">
              <img src="" class="image img-1 show" alt="" id="titleimg"/>
              <img src="" class="image img-2" alt="img1" />
              <img src="" class="image img-3" alt="img2" />
              <img src="" class="image img-3" alt="img3" />
              <img src="" class="image img-3" alt="img4" />
            </div>

            <div class="text-slider">
              <div class="text-wrap">
                <div class="text-group">
                  <h2 id="tip"></h2>
                  <h2 id="text1"></h2>
                  <h2 id="text2"></h2>
                  <h2 id="text3"></h2>
                  <h2 id="text4"></h2>
                </div>
              </div>

              <div class="bullets">
                <span class="active" data-value="1"></span>
                <span data-value="2"></span>
                <span data-value="3"></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
</div>	
		
		
		
		
		
>>>>>>> yb

</html>

<Script>
	document.getElementById('main').addEventListener('click', e => {
<<<<<<< HEAD

=======
		console.log('클릭 됐니?')
>>>>>>> yb
		if (e.target.matches('.boxbox img')) {
			const faNum = e.target.dataset.fanum;
			const userId = e.target.dataset.userid;
			const cooknum = e.target.dataset.cooknum;

			console.log(faNum);
			console.log(userId);
			console.log(cooknum);

			fetch('${pageContext.request.contextPath}/freeboard/getArticle/' + faNum)
				.then(res => res.json())
				.then(data => {
					console.log(data);
					document.getElementById('freeuserid').textContent = data.userId;
					document.getElementById('freecontent').textContent = data.content;
				});

			//레시피 상세정보 불러오기
			fetch('${pageContext.request.contextPath}/result/recipe/' + cooknum)
				.then(res => res.json())
				.then(recipe => {
					console.log(recipe);
					document.getElementById('foodname').textContent = recipe.foodname;
					document.getElementById('ingredient').textContent = recipe.ingredient;
					document.getElementById('tip').textContent = recipe.tip;
					document.getElementById('titleimg').setAttribute('src', recipe.titleimg);
					if (recipe.text1 !== '') {
						document.getElementById(`text1`).textContent = recipe.text1;
					}
					if (recipe.img1 !== '') {
						document.getElementById(`img1`).setAttribute('src', recipe.img1);
					}
					if (recipe.text2 !== '') {
						document.getElementById(`text2`).textContent = recipe.text2;
					}
					if (recipe.img2 !== '') {
						document.getElementById(`img2`).setAttribute('src', recipe.img2);
					}
					if (recipe.text3 !== '') {
						document.getElementById(`text3`).textContent = recipe.text3;
					}
					if (recipe.img3 !== '') {
						document.getElementById(`img3`).setAttribute('src', recipe.img3);
					}
					if (recipe.text4 !== '') {
						document.getElementById(`text4`).textContent = recipe.text4;
					}
					if (recipe.img4 !== '') {
						document.getElementById(`img4`).setAttribute('src', recipe.img4);
					}
<<<<<<< HEAD
				});
			//좋아요
			getlike(cooknum);
			document.getElementById('likenum').dataset.cooknum = recipe.cooknum; //like에 레시피 번호 저장
				
=======
					document.getElementById('likenum').dataset.cooknum = recipe.cooknum; //like에 레시피 번호 저장
				});
			//좋아요
			// getlike(cooknum);
				doucument.getElimentById('mainDiv').style.display = 'block';
>>>>>>> yb

		} else {
			console.log('여기는 이벤트 대상이 아님');
				doucument.getElimentById('mainDiv').style.display = 'none';
			return;
		}

	});
<<<<<<< HEAD
	
=======
	/*
>>>>>>> yb
	//좋아요 개수 불러오기
	function getlike(cooknum) {
		fetch('${pageContext.request.contextPath}/result/recipe/like/' + cooknum)
				.then(res => res.json())
				.then(like => {
					console.log(like);
<<<<<<< HEAD
					document.getElementById('likenum').textContent = like;
=======
					document.getElementById('likenum').textContent = like.likenum;
>>>>>>> yb
				});
	}
	//좋아요 버튼 클릭
	document.getElementById('likeBtn').addEventListener('click', e => {
		e.preventDefault();
		const cooknum = document.getElementById('likenum').dataset.cooknum;
		const userId = '${login.userId}'
		console.log(userId);
		const reqObj = {
			method: 'put',
			headers: {
				'Content-Type' : 'application/json'
			},
			body: JSON.stringify({
				'userId' : userId
			})
		}
		fetch('${pageContext.request.contextPath}/result/recipe/like/' + cooknum, reqObj)
			.then(res => res.text())
			.then(data => {
				console.log(data);
				document.getElementById('likenum').textContent = data.likenum;
				getlike(cooknum);
			});
	});
<<<<<<< HEAD
	
=======
	*/
>>>>>>> yb
</Script>