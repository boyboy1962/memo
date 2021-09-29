<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h1 class="mt-3">로그인</h1>
		<form method="POST" action="/servlet/quiz10" class="p-5 bg-light">
			<div class="form-group w-100">
				<input type="text" class="form-control" id="id" name="id"
					placeholder="Username">
			</div>
			<div class="form-group w-100">
				<input type="password" class="form-control" id="pw" name="pw"
					placeholder="····">
			</div>
			<div class="d-flex">
				<button type="submit" class="btn btn-secondary mr-3 w-50">회원가입</button>
				<button type="submit" class="btn btn-primary ml-3 w-50">로그인</button>
			</div>
		</form>
	</div>
	<div class="col-3"></div>
</div>

<div class="login-box">
	<h1>로그인</h1>
	<form id="loginForm" action="/user/sign_in" method="post">
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">ID</span>
			</div>
			<input type="text" class="input-group" id="loginId" name=loginId>
		</div>
		
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">PW</span>
			</div>
			<input type="password" class="input-group" id="password" name=password>
		</div>
		
		<input type="submit" class="btn btn-primary btn-block" value="로그인">
		<a href="/user/sign_up_view" class="btn btn-secondary btn-block">회원가입</a>
	</form>
</div>

<script>
	$(document).ready(function(){
		$('#loginForm').submit(function(e){
			e.preventDefault();
			
			//validation
			let loginId = $('input[name=loginId]').val().trim();
			if(loginId == ''){
				alert("아이디를 입력해주세요.");
				return false;
			}
			let password = $('input[name=password]').val();
			if(password == ''){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			let url = $('#loginForm').attr('action');
			let data = $('#loginForm').serialize(); // 쿼리스트리으로 name 값들을 구성하고 request
			console.log("url: " + url);
			console.log("data: " + data);
			
			$.post(url, data)
			.done(function(data){
				if (data.result == 'success') {
					location.href = "/post/post_list_view";
				} else {
					alert("로그인에 실패했습니다. 다시 시도해주세요.");
				}
			})
			
		})
	})
</script>