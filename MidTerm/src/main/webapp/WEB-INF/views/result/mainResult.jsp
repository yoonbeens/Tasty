<%@page import="com.midterm.foodSNS.command.MRecipeVO"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<style type="text/css">
	
		
	</style>
	
</head>

<body>

  <div id="superCon">

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
			<div class="boxbox" >
				<img class="titleimg" alt="결과이미지" data-userid="${login.userId}"
					data-cooknum=<%=recipes.get(i).getCooknum()%> src="<%=recipes.get(i).getTitleimg()%>">
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
	
	
<!-- Modal -->
<!-- <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-body">
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
			</div>

		</div> -->
		
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
                  <!-- <input
                    type="text"
                    minlength="4"
                    class="input-field"
                    autocomplete="off"
                    required
                  /> -->
                  <label>재료 소개</label>
                  <br> <br>
                  <div id="ingredient"></div>


                </div>

                <div class="input-wrap">
                  <div class="blank"></div>
                  <!-- <input
                    type="password"
                    minlength="4"
                    class="input-field"
                    autocomplete="off"
                    required
                  /> -->
                  <!-- <label>예상 조리 시간</label> -->
                  <!-- <div>예상 조리 시간</div> -->
                </div>

                <!-- <input type="submit" value="Timer Strat" class="sign-btn" />

                <p class="text">
                  Forgotten your password or you login datails?
                  <a href="#">Get help</a> signing in
                </p> -->







                

                
                


              </div>
            </form>

            <form action="index.html" autocomplete="off" class="sign-up-form">
              <div class="logo">
                <!-- <img src="./img/logo.png" alt="easyclass" /> -->
            <div class="modal-like">
				<div id="likenum"></div>
				<button type="button" id="likeBtn">좋아요</button>
			</div>
                
              </div>

              <div class="heading">
                <h2>맛있게 드세요</h2>
                <h6>재료 보러 가기</h6>
                <a href="#" class="toggle">Detail</a>
              </div>

              <div class="actual-form">
                <!-- <div class="input-wrap">
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
                </div> -->


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
                <script
                  type="text/javascript"
                  src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
                ></script>



                <div class="input-wrap">
                  <!-- <input
                    type="password"
                    minlength="4"
                    class="input-field"
                    autocomplete="off"
                    
                  /> -->
                  <!-- <label>Password</label> -->
                </div>

                <input type="submit" value="후기 쓰러 가기" class="sign-btn" />


              </div>
            </form>
          </div>

          <div class="carousel">
            <div class="images-wrapper">
              <img src="" class="image img-1 show" alt="" id="titleimg"/>
              <img src="" class="image img-2" alt="img1" id="img1" />
              <img src="" class="image img-3" alt="img2" id="img2" />
              <img src="" class="image img-4" alt="img3" id="img3" />
              <img src="" class="image img-5" alt="img4" id="img4" />	
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
                <span data-value="4"></span>
                <span data-value="5"></span>
              </div>              
              
            </div> <!-- end text-slider -->
          </div><!-- end carousel -->
        </div>
      </div>
    </main>
</div>	
		
	
	
<Script>
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
		} 

	});


  document.getElementById('mainDiv').addEventListener('click', e => {
    if(e.target.matches('#mainClose')) { //!e.target.matches('#mainDiv')
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
	  
	  let currentImage = document.querySelector(imgClassName);
	  images.forEach((img) => img.classList.remove("show"));
	  currentImage.classList.add("show");


	  
	  bullets.forEach((bull) => bull.classList.remove("active"));
	  this.classList.add("active");

	}
	  
		bullets.forEach((bullet) => {
		  bullet.addEventListener("click", moveSlider);
		});


  //타이머


	function toast(msg) {
	  document.querySelector(".toast").innerHTML = msg;
	  document.querySelector(".toast").style.animationPlayState = "running";
	}

	//modal function
	function show() {
	  document.querySelector(".background").className = "background show";
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

	document.querySelector("#text").addEventListener("animationiteration", function() {
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
</body>
		

</html>
