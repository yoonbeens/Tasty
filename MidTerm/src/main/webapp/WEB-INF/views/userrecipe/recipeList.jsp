<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardImgVO"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardVO"%>
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
<title>Tasty Friends</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">

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
		<div id="main-left">ddd</div>



		<div id="main">
			<c:forEach var="article" items="${article}">
				<div class="boxbox" data-bs-toggle="modal" data-bs-target="#myModal">
					<img src="${pageContext.request.contextPath}/css/TastyFriend.png"
						alt="default" id="article-img" data-userid="${login.userId}"
						data-bno="${article.bno}" />
					<div id="title" name="title">${article.title}</div>
				</div>
			</c:forEach>




			<%-- 		<%
			ArrayList<MfreeboardVO> articles = new ArrayList<>();
			articles = (ArrayList<MfreeboardVO>) request.getAttribute("article");

			for (int i = 0; i < articles.size(); i++) {
				ArrayList<MfreeboardImgVO> imgcon = new ArrayList<>();
			%>

			<div class="boxbox" data-bs-toggle="modal" data-bs-target="#myModal">
				<img src="${pageContext.request.contextPath}" alt="default" id="article-img" data-userid="${login.userId}"
					data-bno="<%=articles.get(i).getBno()%>">
				<div id="title" name="title"><%=articles.get(i).getTitle()%></div>
			</div>

			<%
			break;
			}
			%>

 --%>

		</div>
		<div id="main-right">ddd</div>

	</div>
	</div>

	<nav class="navbar bg-success fixed-top ">
		<div class="container-fluid">
			<a class="navbar-brand text-light" href="#">Tasty Friend</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<aside>
						<div id="logo">
							<img src="" alt="">
						</div>
						<div id="profile-img-con">
							<img
								src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}"
								alt="default" id="profile-img">
						</div>
						<div class="profileWrapper">
							<div id="simpleProfile">
								<h1>${login.userId}</h1>
								<a
									href="${pageContext.request.contextPath}/user/userProfileModify"
									id="promodify">프로필수정</a>
								<h3>${login.userNick}</h3>
								<h5>${login.message}</h5>
							</div>
							<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Follow
										Chief</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Add
										My Recipe</a></li>
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
<div class="modal fade" id="myModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-body"></div>
		</div>
	</div>
</div>


<Script>
			let strimg = '';
			let strbtn = '';
			let strmodi = '';

			document.getElementById('main').addEventListener('click', e => {

				if (e.target.matches('.boxbox img')) {

					const bno = e.target.dataset.bno;


					strbtn = '';
					strimg = '';
					strmodi = '';

					console.log(bno);

					fetch('${pageContext.request.contextPath}/userrecipe/recipeDetail/' + bno)
						.then(res => res.json())
						.then(data => {
							console.log(data);
							document.getElementById('freeuserid').textContent = data.writer;
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