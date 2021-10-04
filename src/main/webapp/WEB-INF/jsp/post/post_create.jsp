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
					alert("메모가 저장됐습니다." + data);
					location.href = "/post/post_list_view"
				}
				, error: function(e) {
					alert("메모 저장에 실패했습니다." + e);
				}
			});
			
		});
		
	});
</script>
<!-- 
<script>
	$(document).ready(function(){
		// 파일 업로드 이미지 버튼 클릭 => 파일 선택장이 뜸
		$('#fileUpladBtn').on('click', function(e){
			e.preventDefault(); 	// 제일 위로 올라가는 동작 중지
			$('#file').click();		// 사용자가 input file을 클릭한 것과 같은 동작
		});
		
		// 사용자가 파일을 선택했을 때 => 파일명을 옆에 노출시킴
		$('#file').on('change', function(e){
			let fileName = e.target.files[0].name;
			console.log("fileName: " + fileName);
			
			let fileNameArr = fileName.split('.');
			if (
					fileNameArr[fileNameArr.length - 1] != 'png'
					&& fileNameArr[fileNameArr.length - 1] != 'gif'
					&& fileNameArr[fileNameArr.length - 1] != 'jpg'
					&& fileNameArr[fileNameArr.length - 1] != 'jpeg'
			) {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$(this).val('');		// 올라가 있는 파일 지워 준다.
				$("#fileName").text("");	// 잘못된 파일명도 지워준다. 
				return;
			}
			
			$("#fileName").text(fileName); // 파일명을 div 사이에 노출시킨다.
			
		})
	}
</script>
 -->