<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<div class="w-50">
		<h1>글 상세/수정</h1>
		
		<input type="text" id="subject" class="form-control" placeholder="제목을 입력해주세요." value="${post.subject}">
		
		<textarea id="content" rows="10" cols="100" class="form-control" placeholder="내용을 입력해주세요.">${post.content}</textarea>
		
		<div class="d-flex justify-content-end">
			<input type="file" id="file" accept=".jpg, .jpeg, .png, .gif" value="${post.file}">		
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
				<button type="button" id="saveBtn" class="btn btn-primary">수정</button>			
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
			location.href = "/post/post_list_view";
		});
	});
</script>