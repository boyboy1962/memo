<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<div class="w-50">
		<h1>글 상세/수정</h1>
		
		<input type="text" id="subject" class="form-control" placeholder="제목을 입력해주세요." value="${post.subject}">
		
		<textarea id="content" rows="10" cols="100" class="form-control" placeholder="내용을 입력해주세요.">${post.content}</textarea>
		
		<div class="d-flex justify-content-end">
			<input type="file" id="file" accept=".jpg, .jpeg, .png, .gif">		
		</div>
		
		<%-- 이미지가 있을 때만 이미지 영역 추가 --%>
		<c:if test="${not empty post.imgUrl}">
			<div>
				<img alt="업로드 이미지" src="${post.imgUrl}" width="300">
			</div>
		</c:if>
		
		<div class="clearfix">
			<a href="/post/post_list_view" class="btn btn-danger float-left">삭제</a>
			<div class="float-right">
				<button type="button" id="listBtn" class="btn btn-dark">목록으로</button>
				<button type="button" id="saveBtn" class="btn btn-primary" data-post-id="${post.id}">수정</button>			
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		// 목록으로 버튼 클릭 => 목록으로 이동
		$('#listBtn').on('click', function(){
			location.href = "/post/post_list_view";
		});
		
		// 글 수정
		$('#saveBtn').on('click', function(){
			let subject = $('#subject').val().trim();
			if (subject == '') {
				alert("제목을 입력해주세요.");
				return;
			}
			
			let content = $('#content').val();
			if (content == '') {
				alert("내용을 입력해주세요.");
				return;
			}
			
			let fileName = $('#file').val();
			if (fileName != ''){
				let fileArr = fileName.split('.');
				let ext = fileArr.pop().toLowerCase();
				if ($.inArray(ext,['jpg', 'jpeg', 'png', 'gif']) == -1) {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val(''); // 잘못된 파일 지운다.
					return;
				}
			}
			
			let postId = $(this).data('post-id');
			console.log("postId: " + postId);
			
			// 폼태그를 자바스크립트에서 만든다.
			let formData = new FormData();
			formData.append('postId', postId);
			formData.append('subject', subject);
			formData.append('content', content);
			formData.append('file', $('#file')[0].files[0]);
			
			// ajax 통신으로 서버에 전송한다. view에다 보낼 수 없고 REstController에게 보낼 수 있다.
			$.ajax({
				type:'put'
				, url: '/post/update'
				, data: formData
				, enctype: 'multipart/form-data'	//파일 업로드를 위한 필수 설정
				, processData: false				//파일 업로드를 위한 필수 설정
				, contentType: false				//파일 업로드를 위한 필수 설정
				, success: function(data) {
					if (data.result == 'success') {
						alert("메모가 수정되었습니다.");
						location.reload(true);		// 세로고침
					}
				}
				, error: function(e) {
					alert("메모 수정에 실패했습니다. 관리자에게 문의해주세요. " + e)
				} 
			});
		});
	});
</script>