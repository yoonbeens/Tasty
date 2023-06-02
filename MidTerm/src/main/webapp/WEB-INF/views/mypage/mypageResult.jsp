<%@page import="com.midterm.foodSNS.command.MusersVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardImgVO"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/mypageResult.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>

<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">

	</script>
	<div id="main-con">
		<div id="main-left">
			<div class="left" id="mystory">My Story</div>
			<div class="left" id="myrecipe">My Recipe</div>
			countFollowing: ${countFollowing} <br>
			countFollower : ${countFollower}
		</div>



		<div id="main">
			<%
			ArrayList<MfreeboardArticleVO> articles = new ArrayList<>();
			articles = (ArrayList<MfreeboardArticleVO>) request.getAttribute("article");
			ArrayList<MfreeboardImgVO> imgs = new ArrayList<>();
			imgs = (ArrayList<MfreeboardImgVO>) request.getAttribute("img");
			
			ArrayList<MusersVO> followers = (ArrayList<MusersVO>)request.getAttribute("countFollower");
			

		
			
			//System.out.println("cf: " + request.getAttribute("countFollowing"));
			
			
			/* if ((int) request.getAttribute("countFollowing") == 0) {
				countFollowing = 0;
			} else {
				countFollowing = (int) request.getAttribute("countFollowing");

			}
			if ((int) request.getAttribute("countFollower") == 0) {
				countFollowing = 0;
			} else {
				countFollowing = (int) request.getAttribute("countFollower");

			} */

			for (int i = 0; i < articles.size(); i++) {
				ArrayList<MfreeboardImgVO> imgcon = new ArrayList<>();
				for (int j = 0; j < imgs.size(); j++) {

					if (articles.get(i).getFreeboardArticleNumber() == imgs.get(j).getFreeboardArticleNumber()) {
				imgcon.add(imgs.get(j));
			%>
			

			<div class="boxbox scale" data-bs-toggle="modal"
				data-bs-target="#myModal">
				<img
					src="${pageContext.request.contextPath}/user/display/<%=imgcon.get(0).getFileLoca()%>
				/<%=imgcon.get(0).getFileName()%>"
					alt="default" id="article-img" data-userid="${login.userId}"
					data-fanum="<%=articles.get(i).getFreeboardArticleNumber()%>"
					data-content="<%=articles.get(i).getContent()%>">
			</div>

			<%
			break;
			}
			}
			%>

			<%
			}
			%>


		</div>
		<div id="main-right"> 			
		
			<div id="profile-img-con">
				<img
					src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}"
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
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
					</li>
					<li class="nav-item"><div class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#followerModal">Follower Chief</div></li>

					<li class="nav-item"><div class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#followingModal">Following Chief</div></li>

					<li class="nav-item"><a class="nav-link" href="#">Add My
							Recipe</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/freeboard/regist">Add
							My Story</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Option </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">회원정보수정</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#" style="color: red">Logout</a></li>
						</ul>
				</ul>

			</div>


		</div>



	</div>


	<nav class="navbar bg-success fixed-top ">
		<div class="container-fluid">
			<a class="navbar-brand text-light"
				href="${pageContext.request.contextPath}/">Tasty Friend</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<aside></aside>
				</div>

			</div>
		</div>
	</nav>

</body>

<!-- follow Modal -->
<div class="modal fade" id="followerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="exampleModalLabel">Follower</h1>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
		
		<%for(int i =0 ;i<followers.size();i++){
			%>
			
			<%-- <div><img src="${pageContext.request.contextPath}/user/display/<%=followers.get(i).getFileLoca()%>/<%=followers.get(i).getFileName()%>"
					alt="default" id="fprofile-img"> ${countFollower.userId}
			</div>
			 --%>
			
			
			<%} %>
		
			
		 
		</div>
		
	  </div>
	</div>
  </div>

<!-- follow Modal -->
<div class="modal fade" id="followingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="exampleModalLabel">Following</h1>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			
		 
		</div>
		
	  </div>
	</div>
  </div>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-body">
				<div class="modal-img">
					<div id="carouselExampleIndicators"
						class="carousel slide carousel-dark" data-bs-ride="true">
						<div class="carousel-indicators" id="carouselbtn">

							<!--여기 게시물별 버튼 들어감-->
						</div>

						<div class="carousel-inner" id="carouselinput">
							<!--여기 게시물별 이미지 들어감-->
						</div>

						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>

					</div>

				</div>
				<div class="modal-text">
					<div id="freeuserimg">
						<img
							src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}"
							alt="default" id="profile-img2">

						<div id="freeuserid"></div>
						<div class="dropdown" id="dbtn">

							<i class="bi bi-three-dots-vertical" style="font-size: 1.5rem"
								type="button" data-bs-toggle="dropdown" aria-expanded="false"></i>
							<ul class="dropdown-menu">


								<li><a class="dropdown-item" id="modify" href="#"">Modify</a></li>
								<hr>
								<li><a class=" dropdown-item" id="delete" href="#"
									style="color: red">Delete</a></li>
							</ul>
						</div>


					</div>
					<div id="freecontent"></div>
					<div class="modibox">
						<textarea id="modifyTextBox" class="shadow p-3 bg-body rounded">


					</textarea>
						<button id="modifyTextbtn" type="button" class="btn btn-success">Modify</button>
					</div>
					<div class="likeBox">like박스</div>

					<div class="replyBox">


						<!-- 댓글 영역 시작부분 -->
						<section>
							<div class="container">
								<div class="row">
									<div class="col-xs-12 col-md-9 write-wrap">
										<form class="reply-wrap">
											<div class="reply-image"></div>
											<!--form-control은 부트스트랩의 클래스입니다-->
											<div class="reply-content">
												<textarea class="form-control" rows="3" id="reply"></textarea>
												<div class="reply-group">
													<div class="reply-input">
														<input type="text" class="form-control" id="replyId"
															placeholder="이름"> <input type="password"
															class="form-control" id="replyPw" placeholder="비밀번호">
													</div>

													<button type="button" id="replyRegist"
														class="right btn btn-info">등록하기</button>
												</div>

											</div>
										</form>

										<!--여기에 접근 반복-->
										<div id="replyList">

											<!-- 자바스크립트 단에서 반복문을 이용해서 댓글의 개수만큼 반복 표현.
                    <div class='reply-wrap'>
                        <div class='reply-image'>
                            <img src='../resources/img/profile.png'>
                        </div>
                        <div class='reply-content'>
                            <div class='reply-group'>
                                <strong class='left'>honggildong</strong>
                                <small class='left'>2019/12/10</small>
                                <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
                                <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
                            </div>
                            <p class='clearfix'>여기는 댓글영역</p>
                        </div>
                    </div>
                    -->

										</div>
										<button type="button" class="form-control" id="moreList"
											style="display: none;">더보기(페이징)</button>
									</div>
								</div>
							</div>
						</section>





					</div>

				</div>
			</div>
		</div>

		<Script>
			let strimg = '';
			let strbtn = '';
			let strmodi = '';

			document.getElementById('main').addEventListener('click', e => {

			document.getElementById('main').addEventListener('click', e => {

				if (e.target.matches('.boxbox img')) {

					const userId = e.target.dataset.userid;
					const content = e.target.dataset.content;
					const faNum = e.target.dataset.fanum;


					strbtn = '';
					strimg = '';
					strmodi = '';

					console.log(faNum);
					console.log(userId);

					fetch('${pageContext.request.contextPath}/freeboard/getArticle/' + faNum)
						.then(res => res.json())
						.then(data => {
							console.log(data);
							document.getElementById('freeuserid').textContent = data.userId;
							document.getElementById('freecontent').textContent = data.content;
						});

					const $carousel = document.getElementById('carouselExampleIndicators');
					fetch('${pageContext.request.contextPath}/freeboard/getCarousel/' + faNum)
						.then(res => res.json())
						.then(data => {

							const imglength = data.length;

							while (document.getElementById('carouselbtn').firstChild) {
								document.getElementById('carouselbtn').firstChild.remove();
							}
							while (document.getElementById('carouselinput').firstChild) {
								document.getElementById('carouselinput').firstChild.remove();
							}

							// while (document.getElementById('modibtn').firstChild) {
							// 	document.getElementById('modibtn').firstChild.remove();
							// }

							for (var i = 0; i < imglength; i++) {

								if (i === 0) {
									strimg += `						
							<div class="carousel-item active">
								<img src="${pageContext.request.contextPath}/user/display/` + data[i].fileLoca + `/` + data[i].fileName + `"
									class="d-block w-100 simg" alt="smig"></div>`;

									strbtn += `
							<button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="` + i + `" class="active" aria-current="true"
                        aria-label="Slide ` + (i + 1) + `"></button>`;



								} else {
									strimg += `						
							<div class="carousel-item ">
								<img src="${pageContext.request.contextPath}/user/display/` + data[i].fileLoca + `/` + data[i].fileName + `"
									class="d-block w-100 simg" alt="smig">
							</div>`;

									strbtn += `
							<button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="` + i + `" class="active" aria-current="true"
                        aria-label="Slide ` + (i + 1) + `"></button>`;
								}


							}

							// strmodi +=
							// 	` <li><a class="dropdown-item" id ="modify" href="${pageContext.request.contextPath}/freeboard/modify/` +
							// 	faNum + `" >Modify</a></li>`;
							document.getElementById('carouselinput').insertAdjacentHTML('afterbegin', strimg);
							document.getElementById('carouselbtn').insertAdjacentHTML('afterbegin', strbtn);
							// document.getElementById('modibtn').insertAdjacentHTML('afterbegin', strmodi);



						});
					document.getElementById('modify').addEventListener('click', e => {

						document.getElementById('freecontent').style.display = "none";
						document.querySelector('.modibox').style.display = "block";
						document.getElementById('modifyTextBox').textContent = content;
					});

					document.getElementById('modifyTextbtn').addEventListener('click', e => {
						const moditext = document.querySelector('.modibox textarea').value;
						console.log("버튼누루고나서 번호:" + faNum);
						console.log("버튼누루고나서 글:" + moditext);


						const reqObj = {
							method: 'put',
							headers: {
								"Content-Type": "application/json"
							},
							body: JSON.stringify({
								"moditext": moditext

							})

						};

						fetch('${pageContext.request.contextPath}/freeboard/modify/' + faNum, reqObj)
							.then(res => {
								console.log('왜 여러번 눌림?');
								document.querySelector('.modibox').style.display = "none";
								document.getElementById('freecontent').textContent = moditext;
								document.getElementById('freecontent').style.display = "block";

							})
					});

					const myModal = document.getElementById('myModal')

					myModal.addEventListener('hidden.bs.modal', () => {
						console.log("모달닫힘");

						location.reload();
					})


					document.getElementById('delete').addEventListener('click', e => {
						if (confirm("정말 삭제하시겠습니까?")) {
							console.log(faNum);
							fetch('${pageContext.request.contextPath}/freeboard/delete/' + faNum, {
								method: 'delete'
							}).then(res => {
								if (res.status == 200) {
									document.getElementById('main').replaceChildren;
									location.reload();
								} else {
									alert(res.status);
								}
							});

						} else {
							return;
						}

					});

				} else {
					console.log('여기는 이벤트 대상이 아님');

					return;
				}





			});
		</Script>