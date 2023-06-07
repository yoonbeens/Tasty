<%@page import="com.midterm.foodSNS.command.MRecipeVO"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/mainResult.css"
	rel="stylesheet">

<style type="text/css"> 



	</style>

</head>

<body>

	<div id="superCon">

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">

		</script>
		<div id="main-con">
			<div id="main-left">



				<div class="left" id="mystory" data-alength="${fn:length(recipe)}"
					data-rlength="${fn:length(userRecipe)}">Tasty Recipe</div>
				<div class="left" id="myrecipe" data-alength="${fn:length(recipe)}"
					data-rlength="${fn:length(userRecipe)}">User Recipe</div>


				<form action="${pageContext.request.contextPath}/result/mainResult" id='reRc' method="POST">
					<div class="selectWrapper">
						<select name="weather" class="form-select optionbox" aria-label="Default select example">
							<option value="날씨" selected>${searchCondition.weather}</option>
							<option value="맑음">맑음</option>
							<option value="흐림">흐림</option>
							<option value="비">비</option>
							<option id="todayWeather"></option>
						</select> <select name="condition" class="form-select optionbox"
							aria-label="Default select example">
							<option value="상태" selected>${searchCondition.condition2}</option>
							<option value="보통">보통</option>
							<option value="다이어트중">다이어트중</option>
							<option value="술마시고싶어요">술마시고싶어요</option>

						</select> <select name="feeling" class="form-select optionbox"
							aria-label="Default select example">
							<option value="기분" selected>${searchCondition.feeling}</option>
							<option value="신나요">신나요</option>
							<option value="우울해요">우울해요</option>
							<option value="피곤해요">피곤해요</option>
							<option value="특별한날">특별한날</option>
						</select>
						<button type="submit" id="recipe" class="btn btn-success">레시피
							다시 추천!</button>
					</div>
				</form>

				<img id='reImg' src="${pageContext.request.contextPath}/css/TastyFriend.png" alt="로고">

			</div>




			<div id="main">
				<%
				ArrayList<MRecipeVO> recipes = new ArrayList<>();
				recipes = (ArrayList<MRecipeVO>) request.getAttribute("recipe");
				for (int i = 0; i < recipes.size(); i++) {
				%>
				<div class="boxbox mystorybox scale">
					<img class="titleimg" alt="결과이미지" data-userid="${login.userId}"
						data-cooknum=<%=recipes.get(i).getCooknum()%> src="<%=recipes.get(i).getTitleimg()%>">
				</div>
				<%
				}
				%>
				<c:forEach var="recipe" items="${userRecipe}">
					<div class="boxbox2 scale myrecipebox" data-bs-toggle="modal" data-bs-target="#userRecipeModal">
						<img src="${pageContext.request.contextPath}/css/TastyFriend.png" alt="default" id="article-img"
							data-reuserid="${recipe.writer}" data-rebno="${recipe.bno}" />
						<div id="rtitle" name="title">${recipe.title}</div>
						<div id="rcon" name="title">${recipe.content}</div>
						<div id="rweather" name="title" style="display: none">${recipe.weather}</div>
						<div id="rcondition" name="title" style="display: none">${recipe.condition2}</div>
						<div id="rfeeling" name="title" style="display: none">${recipe.feeling}</div>
						<div id="rWriter" name="title" style="display: none">${recipe.writer}</div>

					</div>
				</c:forEach>
			</div>

			<div id="main-right">
				<div id="profile-img-con">
					<img src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}"
						alt="default" id="profile-img">
				</div>
				<div class="profileWrapper">
					<div id="simpleProfile">
						<h1>${login.userId}</h1>
						<a href="${pageContext.request.contextPath}/user/userProfileModify" id="promodify">프로필수정</a>
						<h3>${login.userNick}</h3>
						<h5>${login.message}</h5>
					</div>
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item"><a class="nav-link active" aria-current="page"
								href="${pageContext.request.contextPath}/">Home</a>
						</li>
						
						<li class="nav-item"><a class="nav-link active" aria-current="page"
								href="${pageContext.request.contextPath}/mypage/mypageResult">My
								Page</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal"
								data-bs-target="#FollowerModal">Follower
								Chief</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal"
								data-bs-target="#FollowingModal">Following
								Chief</a></li>
						<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/userrecipe/uploadRecipe">Add
								My Recipe</a></li>
						<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/freeboard/regist">Add
								My Story</a></li>

						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Option </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/user/userUpdate">회원정보수정</a></li>
								<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/userLogout"
								style="color: red">Logout</a></li>
					</ul>


				</div>



			</div>




		</div>




		<!--원본 <nav class="navbar bg-success fixed-top ">
			<div class="container-fluid">
				<a class="navbar-brand text-light" href="#">Tasty Friend</a>

				<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
					aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-header">
						<aside></aside>
					</div>

				</div>
			</div>
		</nav> -->


		<nav class="navbar bg-success fixed-top">
			<div class="container-fluid">
				<a class="navbar-brand text-light" href="#">Tasty Friend</a>

				<div class="ml-auto">
					<form class="form-inline ml-auto"
						action="${pageContext.request.contextPath}/userrecipe/search"
						method="POST">
						<div class="input-group">
							<input type="text" class="form-control" name="query"
								placeholder="검색어를 입력하세요">
							<button type="submit" class="btn btn-outline-light">검색</button>
						</div>
					</form>
				</div>

			</div>
		</nav>















		<div id="mainDiv">
			<main id="mainClose">
				<div class="box" id="modalBox">
					<div class="inner-box">
						<div class="forms-wrap">
							<form action="index.html" autocomplete="off" class="sign-in-form">
								<div class="logo">
									<!-- <img src="./img/logo.png" alt="easyclass" /> -->
									<h4>SOUP</h4>
								</div>

								<div class="heading">
									<h2 id="foodname"></h2>
									<h6>요리 시간 재기</h6>
									<a href="#" class="toggle">Timer</a>
								</div>

								<div class="actual-form">
									<div class="input-wrap">

										<label>재료 소개</label> <br> <br>
										<div id="ingredient"></div>


									</div>

									<div class="input-wrap">
										<div class="blank"></div>

									</div>


								</div>
							</form>

							<form action="${pageContext.request.contextPath}/freeboard/regist" autocomplete="off"
								class="sign-up-form">
								<div class="logo">
									<!-- <img src="./img/logo.png" alt="easyclass" /> -->
									<div class="modal-like">
										<div id="likenum"></div>
										<button type="button" id="likeBtn">좋아요</button>
									</div>


								</div>

								<div class="heading">
									<h6>재료 보러 가기</h6>
									<a href="#" class="toggle">Detail</a>
								</div>

								<div class="actual-form">

									<div id="content">
										<div id="f5Text">
											<div id="text" style="margin-bottom: -25px;">
												<span id="minutes"></span> <span> minutes</span>
											</div>
											<!--end text-->
										</div>
										<!--end f5Text-->




										<!-- modal pop-up-->
										<div class="background">
											<div class="window">
												<div class="popup">
													<button id="close">X</button>
													<form>
														<div class="select">
															<input id="hour" type="number" placeholder="시간" /> <input
																id="min" type="number" placeholder="분" /> <input
																id="sec" type="number" placeholder="초" />
														</div>
														<!--end select-->
														<br /> <br />
														<div id="colorBox">
															<div id="clColor">
																<span class="popupText">시계 색상</span>
																<div class="cp_wrapper">
																	<input id="clockColor" type="color"
																		value="#ff6e6e" />
																</div>
																<!--end cp_wrapper-->
															</div>
															<!--end clColor-->
															<div id="bgColor">
																<span class="popupText">배경 색상</span>
																<div class="cp_wrapper">
																	<input id="backColor" type="color"
																		value="#c5e1ff" />
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
										<!--end background -->


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

									<!-- toastr js 라이브러리 -->
									<script type="text/javascript"
										src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js">
									</script>



									<div class="input-wrap"></div>

									<input type="submit" value="이 레시피 Stroy 쓰기" class="sign-btn" />


								</div>
							</form>
						</div>

						<div class="carousel">
							<div class="images-wrapper">
								<img src="" class="image img-1 show" alt="" id="titleimg" /> <img src=""
									class="image img-2" alt="img1" id="img1" /> <img src="" class="image img-3"
									alt="img2" id="img2" /> <img src="" class="image img-4" alt="img3" id="img3" /> <img
									src="" class="image img-5" alt="img4" id="img4" />
							</div>

							<div class="text-slider">
								<div class="text-wrap">
									<div class="text-group">
										<h2 id="tip" class="text text-1 show"></h2>
										<h2 id="text1" class="text text-2"></h2>
										<h2 id="text2" class="text text-3"></h2>
										<h2 id="text3" class="text text-4"></h2>
										<h2 id="text4" class="text text-5"></h2>
									</div>
								</div>

								<div class="bullets">
									<span class="active" data-value="1"></span> <span data-value="2"></span> <span
										data-value="3"></span> <span data-value="4"></span> <span data-value="5"></span>
								</div>

							</div>
							<!-- end text-slider -->
						</div>
						<!-- end carousel -->
					</div>
				</div>
			</main>
		</div>

		<!-- Follower Modal -->
		<div class="modal fade" id="FollowerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Follower</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="fmodal-body" id="followerM">

						<c:forEach var="follower" items="${countFollower}">

							<div id="followerdiv">
								<img src="${pageContext.request.contextPath}/user/display/${follower.fileLoca}/${follower.fileName}"
									alt="default" id="fprofile-img"> <a
									href="${pageContext.request.contextPath}/mypage/userResult/${follower.userId}">${follower.userId}</a>&nbsp&nbsp<span>${follower.message}</span>
							</div>

						</c:forEach>



					</div>
				</div>
			</div>
		</div>





		<!-- Following Modal -->
		<div class="modal fade" id="FollowingModal" tabindex="-1" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Following</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="fmodal-body" id="followingM">

						<c:forEach var="following" items="${countFollowing}">

							<div id="followerdiv">
								<img src="${pageContext.request.contextPath}/user/display/${following.fileLoca}/${following.fileName}"
									alt="default" id="fprofile-img"> <a
									href="${pageContext.request.contextPath}/mypage/userResult/${following.userId}">${following.userId}</a>&nbsp&nbsp<span>${following.message}</span>
							</div>

						</c:forEach>


					</div>
				</div>
			</div>
		</div>


		<!-- Modal uesrRecipe-->


		<div class="modal fade" id="userRecipeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">

			<div class="modal-dialog modal-xl modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-body">
						<div id="urTitle">

							<!--유저레시피 제목오는곳-->
						</div>

						<div id="urWeather">
							<!--검색 조건오는곳-->
						</div>

						<div id="urContent">
							<!--유저레시피 내용오는곳-->
	
						</div>

					</div>

					

				</div>
			</div>
		</div>
	</div>


	<Script>

		(


			function recipbox() {


				const recipebox = document.querySelectorAll('.myrecipebox');

				for (var i = 0; i < recipebox.length; i++) {
					const recipebox = document.querySelectorAll('.myrecipebox');
					recipebox[i].style.display = "none";
				}
			})();
		let strimg = '';
		let strbtn = '';
		let strmodi = '';
		let rtitle = '';
		let rcon = '';

	
			console.log("날씨시도");

			fetch('${pageContext.request.contextPath}/result/getWeather')
				.then(res => res.json())
				.then(data => {
					console.log("날씨성공");
					console.log(data.weather);
					let ctemp = data.temp - 273.15;
					console.log(ctemp.toFixed(2));
					let weather1='';

					if (data.weather==="Clear") {
						 weather1 = '맑음';
					} else if (data.weather==="Rain") {
						 weather1 = '비';
					} else if (data.weather==="Clouds") {
						 weather1 = '흐림';
					} else {
						 weather1 = '흐림';
					}

					document.getElementById('todayWeather').setAttribute("value", data.weather);
					document.getElementById('todayWeather').textContent = "오늘의 날씨 : " +weather1 + "/" + ctemp.toFixed(2) + "°C";


				});

		document.getElementById('main-left').addEventListener('click', e => {
			console.log("left click");

			if (e.target.matches('#mystory')) {
				const alength = e.target.dataset.alength;
				const rlength = e.target.dataset.rlength;


				console.log("story 클릭");


				for (var i = 0; i < alength; i++) {
					const storybox = document.querySelectorAll('.mystorybox');
					storybox[i].style.display = "block";
				}
				for (var i = 0; i < rlength; i++) {
					const recipebox = document.querySelectorAll('.myrecipebox');

					recipebox[i].style.display = "none";
				}

			}


			if (e.target.matches('#myrecipe')) {
				const alength = e.target.dataset.alength;
				const rlength = e.target.dataset.rlength;

				console.log("recipe 클릭");



				for (var i = 0; i < alength; i++) {
					const storybox = document.querySelectorAll('.mystorybox');
					storybox[i].style.display = "none";
				}



				for (var i = 0; i < rlength; i++) {
					const recipebox = document.querySelectorAll('.myrecipebox');

					recipebox[i].style.display = "block";
				}
			}





		});


		// document.getElementById('main').addEventListener('click', e => {
		// 	if (e.target.matches('.boxbox2 img')) {

				






		// 	}
		// });




		document.getElementById('main-con').addEventListener('click', e => {
			console.log('클릭됐니?')
			if (e.target.matches('.boxbox img')) {
				/* const faNum = e.target.dataset.fanum; */
				const userId = e.target.dataset.userid;
				const cooknum = e.target.dataset.cooknum;

				/* console.log(faNum); */
				console.log(userId);
				console.log(cooknum);



				//레시피 상세정보 불러오기
				fetch('${pageContext.request.contextPath}/result/recipe/' + cooknum)
					.then(res => res.json())
					.then(recipe => {
						console.log(recipe);
						document.getElementById('foodname').textContent = recipe.foodname;
						document.getElementById('ingredient').textContent = recipe.ingredient;
						document.getElementById('tip').textContent = recipe.tip;
						document.getElementById('titleimg').setAttribute('src', recipe.titleimg);
						document.getElementById('minutes').textContent = recipe.cookTime;

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
						document.getElementById('likenum').dataset.cooknum = recipe.cooknum; // like에 레시피 번호 저장
					});

				document.getElementById('mainDiv').style.display = 'block';
				getlike(cooknum);


				/* 				document.getElementById('main-con').style.display = 'none'; */

				console.log('Div보여줘');
			
			} else if(e.target.matches('.boxbox2 img')) {
				console.log('main 내 boxbox2 클릭');

				document.getElementById('urTitle').insertAdjacentHTML('afterbegin', e.target.nextElementSibling
					.textContent);
				document.getElementById('urContent').insertAdjacentHTML('afterbegin', e.target.nextElementSibling
					.nextElementSibling.innerHTML);
				document.getElementById('urWeather').insertAdjacentHTML('afterbegin', e.target.nextElementSibling
					.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent);
				document.getElementById('urWeather').insertAdjacentHTML('afterbegin', e.target.nextElementSibling
					.nextElementSibling.nextElementSibling.nextElementSibling.textContent + ' / ');
				document.getElementById('urWeather').insertAdjacentHTML('afterbegin', e.target.nextElementSibling
					.nextElementSibling.nextElementSibling.textContent + ' / ');
				document.getElementById('urWeather').insertAdjacentHTML('afterbegin', '작성자 : ' + e.target
					.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling
					.nextElementSibling.nextElementSibling.textContent + '&nbsp&nbsp&nbsp&nbsp&nbsp');


				document.getElementById('userRecipeModal').addEventListener('hidden.bs.modal', () => {
					document.getElementById('urTitle').textContent = "";
					document.getElementById('urContent').innerHTML = "";
					document.getElementById('urWeather').textContent = "";

				});

			}

		});


		document.getElementById('mainDiv').addEventListener('click', e => {
			if (e.target.matches('#mainClose')) { //!e.target.matches('#mainDiv')
				console.log('여기는 이벤트 대상이 아님');
				// document.getElementById('mainDiv').style.display = 'none';
				// console.log('없어졌니');
				document.getElementById('mainDiv').style.display = 'none';
				console.log('없어졌니');
				/* 			document.getElementById('main-con').style.display = 'block'; */

			}
		});

		// if(!e.target.matches('.boxbox img') || !e.target.matches('#modalBox')) {
		//         document.getElementById('mainDiv').style.display = 'none';
		// 			  console.log('없어졌니');
		// }



		//좋아요 개수 불러오기
		function getlike(cooknum) {
			fetch('${pageContext.request.contextPath}/result/recipe/like/' + cooknum)
				.then(res => res.json())
				.then(like => {
					console.log(like);
					document.getElementById('likenum').textContent = '이 레시피를 ' + like + '명이 좋아합니다';
				});
		}
		//좋아요 버튼 클릭
		document.getElementById('likeBtn').addEventListener('click', e => {
			e.preventDefault();
			const cooknum = document.getElementById('likenum').dataset.cooknum;
			console.log(cooknum);

			const reqObj = {
				method: 'put',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({
					'userId': '${login.userId}'
				})
			}
			fetch('${pageContext.request.contextPath}/result/recipe/like/' + cooknum, reqObj)
				.then(res => res.json())
				.then(data => {
					console.log(data);
					console.log(data.likenum);
					document.getElementById('likenum').textContent = data.likenum;
					console.log(data.userId);
					if (data.userId == 0) { //좋아요 클릭 하지 않은 상태일때
						document.getElementById('likeBtn').style.backgroundColor = 'blue';
					} else {
						document.getElementById('likeBtn').style.backgroundColor = '#fff';
					}
					getlike(cooknum);
				});
		});

		const inputs = document.querySelectorAll(".input-field");
		const toggle_btn = document.querySelectorAll(".toggle");
		const main = document.querySelector("main");
		const bullets = document.querySelectorAll(".bullets span");
		const images = document.querySelectorAll(".image");
		const texts = document.querySelectorAll('.text');

		inputs.forEach((inp) => {
			inp.addEventListener("focus", () => {
				inp.classList.add("active");
			});
			inp.addEventListener("blur", () => {
				if (inp.value != "") return;
				inp.classList.remove("active");
			});
		});

		toggle_btn.forEach((btn) => {
			btn.addEventListener("click", () => {
				main.classList.toggle("sign-up-mode");
			});
		});

		function moveSlider() {
			let index = this.dataset.value;
			console.log('bullet index: ' + index);
			const imgClassName = '.img-' + index;
			const textClassName = '.text-' + index;

			let currentImage = document.querySelector(imgClassName);
			images.forEach((img) => img.classList.remove("show"));
			currentImage.classList.add("show");

			let currentText = document.querySelector(textClassName);
			texts.forEach((text) => text.classList.remove("show"));
			currentText.classList.add("show");


			// const textSlider = document.querySelector(".text-group");
			// textSlider.style.transform = `translateY(` + (-(index - 1) * 6.6) + `rem)`;




			bullets.forEach((bull) => bull.classList.remove("active"));
			this.classList.add("active");

		}

		// let fixedText = document.getElementById('fixedText');
		// console.log(fixedText.firstElementChild);
		// console.log(typeof fixedText.firstElementChild);
		// let textGroup = document.querySelector('.text-group');

		bullets.forEach((bullet) => {
			bullet.addEventListener("click", moveSlider);
		});

		// bullets.forEach((bullet) => {
		//   bullet.addEventListener("click", e => {
		//     console.log('이벤트 동작 확인');
		//     console.log('[0]: ' +  bullets[0]);
		//     console.log('result: ' + (bullets[0] === bullet));
		//     console.log('first: ' + fixedText.firstElementChild);
		//     if (bullets[0] === bullet) {
		//       fixedText.firstElementChild.setAttribute("class", "tip");
		//     } else if (bullets[1] === bullet) {
		//       fixedText.firstElementChild.setAttribute("class", "text1");
		//     } else if (bullets[2] === bullet) {
		//       fixedText.firstElementChild.setAttribute("class", "text2");
		//     } else if (bullets[3] === bullet) {
		//       fixedText.firstElementChild.setAttribute("class", "text3");
		//     } else if (bullets[4] === bullet) {
		//       fixedText.firstElementChild.setAttribute("class", "text4");
		//     }

		//   });
		// });


		//타이머


		function toast(msg) {
			document.querySelector(".toast").innerHTML = msg;
			document.querySelector(".toast").style.animationPlayState = "running";
		}

		//modal function
		function show() {
			document.querySelector(".background").className = "background backShow";
		}

		function close() {
			document.querySelector(".background").className = "background";
		}

		document.querySelector("#f5Text").addEventListener("click", show);
		document.querySelector("#close").addEventListener("click", close);
		//end modal function

		var total;
		var forCount;

		function setTime() {
			var hour = document.getElementById("hour").value;
			var min = document.getElementById("min").value;
			var sec = document.getElementById("sec").value;

			total = hour * 3600 + min * 60 + sec * 1;
			forCount = total;
			total = total + "s";
			var realMin = hour * 60 + min * 1;

			if (total !== "0s") {
				document.getElementById("minutes").innerHTML = realMin;
				document.body.style.setProperty("--timerTime", total);
			} else {
				toast("시간을 설정하세요");
			}

			if (realMin === 1) {
				document.getElementById("title").innerHTML = "1 minute";
			} else {
				document.getElementById("title").innerHTML = realMin + " minutes";
			}
		}

		document.getElementById("submit").addEventListener("click", close);

		// function setColor() {
		//   var clColor = document.getElementById("clockColor").value;
		//   var bgColor = document.getElementById("backColor").value;

		//   document.body.style.setProperty("--bgColor", bgColor);
		//   document.body.style.setProperty("--clockColor", clColor);
		// }

		function hide() {
			document.getElementById("speech").style.visibility = "hidden";
		}

		document.getElementById("f5Text").addEventListener("click", hide);
		document.getElementById("submit").addEventListener("click", setTime);
		// document.getElementById("submit").addEventListener("click", setColor);

		var condition = "paused";

		function start() {
			if (condition === "paused") {
				startTimer();
			} else {
				stopTimer();
			}
		}

		//[f5] div 만 새로고침 fn
		function f5() {
			stopTimer();
			document.getElementById("f5").innerHTML = document.getElementById(
				"f5"
			).innerHTML;
		}


		function f5Text() {
			document.getElementById("f5Text").innerHTML = document.getElementById(
				"f5Text"
			).innerHTML;
		}

		document.querySelector("#reset").addEventListener("click", f5);
		document.querySelector("#reset").addEventListener("click", f5Text);

		document.querySelector("#timer").addEventListener("click", start);

		document.querySelector("#text").addEventListener("animationiteration", function () {
			Swal.fire({
				title: '시간 초과',
				showDenyButton: false,
				showCancelButton: false,
				confirmButtonText: '확인',
				icon: "warning"
			}).then((result) => {
				/* Read more about isConfirmed, isDenied below */
				if (result.isConfirmed) {
					reset();
				}
			});

			f5();
			f5Text();
		});


		function reset() {
			window.location.reload();
		}

		function startTimer() {

			document.getElementById("timer").className = "stop";
			// document.getElementById("timerButton").innerHTML = "정지";
			document.getElementById("timer").style.animationPlayState = "running";
			document.getElementById("mask").style.animationPlayState = "running";
			document.getElementById("text").style.animationPlayState = "running";
			condition = "running";

			document.body.style.setProperty("--grPercent", "50%");
		}

		function stopTimer() {

			document.getElementById("timer").className = "start";
			// document.getElementById("timerButton").innerHTML = "시작";
			document.getElementById("timer").style.animationPlayState = "paused";
			document.getElementById("mask").style.animationPlayState = "paused";
			document.getElementById("text").style.animationPlayState = "paused";
			condition = "paused";

			document.body.style.setProperty("--grPercent", "50%");
		}
	</Script>


	<!-- superCon end-->
	</div>
	<footer> copyright © TastyFriends. all rights reserved </footer>
</body>

</html>
