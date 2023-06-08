<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Friends</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">

</head>

<style>

.form_box {
    background-color: #ffffff;
    margin: 10px;
    border-radius: 4px;
    border: 1px solid #ddd;
    padding: 10px;
}
.input_field {
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 4px;
    margin: 3px 0;
    font-size: 14px;
    width: 100%;
}
.textarea_field {
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 4px;
    margin: 3px 0;
    font-size: 14px;
    width: 100%;
    height: 160px;
}
#uploadBtn {
    display: inline-block;
    padding: 6px 10px;
    color: #fff;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #5cb85c;
    cursor: pointer;
    border: 1px solid #4cae4c;
    border-radius: none;
    -webkit-transition: background-color 0.2s;
    transition: background-color 0.2s;
}

.file_upload {
    display: none;
}

label {
    display: inline-block;
    padding: 6px 10px;
    color: #fff;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #5cb85c;
    cursor: pointer;
    border: 1px solid #4cae4c;
    border-radius: none;
    -webkit-transition: background-color 0.2s;
    transition: background-color 0.2s;
}

</style>

<body>

	<div class="fileDiv">
		<img id="fileImg" src="${pageContext.request.contextPath}/img/img_ready.png">
	</div>
	
    <div class="form_box">
        <h3>게시물 올리기</h3>
        <input class="input_field" type="text" placeholder="title" ><br>
        <input class="input_field" type="text" placeholder="제목을 입력해주세요." ><br>
        <textarea id="content" class="textarea_field" placeholder="내용을 입력해주세요."></textarea><br>

        <form action="${pageContext.request.contextPath}/fileupload/" method="post" enctype="multipart/form-data">
            <label for="file">이미지업로드</label> 
            <input type="file" multiple="multiple" name="files" class="file_upload" id="file">
            <button id="uploadBtn">등록</button>
        </form>
    </div>  
	
	<script>

		const homePath = '${pageContext.request.contextPath}'

        //등록하기 버튼 클릭 이벤트
		document.getElementById('uploadBtn').onclick = () => {regist();}

		//등록을 담당하는 함수
		function regist() {

			//현재 로그인 중인 사용자
			const userId = '${sessionScope.login}';

			//파일 확장자만 남기기
			let file = document.getElementById('file').value
			let exe = file.slice(file.indexOf('.')+1).toLowerCase();
			console.log(userId);
			
			if(userId === '') {
				alert('로그인이 필요한 서비스 입니다.');
				return;
			} else if(exe !== 'jpg' && exe!== 'jpeg' && exe !== 'png' && exe !== 'bmp') {
				alert('이미지 파일(jpg, jpeg, png, bmp)만 등록이 가능합니다');
				file = '';
				return;
			} 
			
			//비동기 요청
			const formData = new FormData();
			const $data = document.getElementById('file'); //이미지 첨부하는 input
			let content = document.getElementById('content').value; //textarea

			console.log('$data: ' + $data);
			console.log($data.files); //파일 태그에 담긴 파일 정보를 확인
			console.log($data.files[0]); //등록한 최종 파일의 정보

			//업로드한 파일의 정보를 FormData에 전달
			for(let i=0; i<$data.files.length; i++) formData.append(`file${i}`, $data.files[i]);
			formData.append('content', content); //글 내용 추가
			formData.append('writer', userId); //작성자 추가

			//fetch
			fetch(homePath + '/snsboard/upload', {method : 'post', body : formData})
			.then(res => res.text())
			.then(data => {
				console.log(data);
				file = ''; //file input 비우기
				content = ''; //글 영역 비우기
				document.querySelector('.fileDiv').style.display = 'none'; //미리보기 감추기
				getList(1, true); //글 목록 함수 호출
			});
		} //end regist()

    </script>

</body>
</html>