<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="w-50">
		<h1>글쓰기</h1>
		
		<input type="text" id="subject" class="form-control" placeholder="제목을 입력해주세요.">
		
		<textarea id="content" rows="10" cols="100" class="form-control" placeholder="내용을 입력해주세요."></textarea>
		
		<div class="d-flex justify-content-end">
			<input type="file" id="file" accept=".jpg, .jpeg, .png, .gif">		
		</div>
		
		<div class="clearfix">
			<a href="/post/post_list_view" class="btn btn-dark float-left">목록</a>
			<div class="float-right">
				<button type="button" id="clearBtn" class="btn btn-secondary">모두지우기</button>
				<button type="button" id="saveBtn" class="btn btn-primary">저장</button>			
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		// 모두지우기 버튼 클릭
		$('#clearBtn').on('click', function(){
			// 제목 input, 내용 textarea 영역을 비칸으로 만든다.
			if(confirm("내용을 지우시겠습니까?")){
				$('#subject').val("");
				$('#content').val("");
			}
		});
		
		// 글 내용 저장버튼 클릭
		$('#saveBtn').on("click", function(){
			let subject = $('#subject').val().trim();
			console.log(subject);
			if (subject == '') {
				alert('제목을 입력해주세요.');
				return;
			}
			
			let content = $('#content').val();
			console.log(content);
			if (content == '') {
				alert('내용을 입력해주세요.');
				return;
			}
			
			let file = $('#file').val();
			console.log("file: " + file);
			
			if (file != ''){
				//console.log(file.split(".")); // 파일명을 . 기준으로 짤른다.
				let ext = file.split('.').pop().toLowerCase();
				if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val(""); // 잘못된 파일을 비운다.
					return;
				}
			}
			
			// 폼태그를 자바스크립트에서 만든다.
			let formData = new FormData();
			formData.append("subject", subject);
			formData.append("content", content);
			formData.append("file", $('#file')[0].files[0]);
			
			// ajax
			$.ajax({
				type:'post' // 파일이 있어 request body를 이용하여 넘길 수 있다.
				, url: '/post/create'
				, data: formData
				, enctype: 'multipart/form-data'	// 파일 업로드 필수 설정
				, processData: false				// 파일 업로드 필수 설정
				, contentType: false 				// 파일 업로드 필수 설정
				// 이 위에가 request 위한 설정이다.
				// 나머지 그냥 설정
				, success: function(data) {
					alert("메모가 저장됐습니다." + e);
				}
				
			});
			
		});
		
	});
</script>