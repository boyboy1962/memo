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
</div>
