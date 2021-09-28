<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="m-4">회원가입</h1>
		<form id="signUpForm" method="post" action="/user/sign_up">
			<span class="sign-up-subject">ID</span>
			<%-- 인풋 옆에 중복확인 버튼을 옆에 붙이기 위해 div 만들고 d-flex --%>
			<div class="d-flex ml-3 mt-3">
				<input type="text" name="loginId" id="loginId" class="form-control col-6" placeholder="ID를 입력해주세요">
				<button type="button" id="loginIdCheckBtn" class="btn btn-success">중복확인</button>
			</div>

			<%-- 아이디 체크 결과 --%>
			<div class="ml-3 mb-3">
				<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력해주세요.</div>
				<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>
				<div id="idCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
			</div>

			<span class="sign-up-subject">Password</span>
			<div class="m-3">
				<input type="password" name="password" id="password" class="form-control col-6" placeholder="비밀번호를 입력하세요">
			</div>

			<span class="sign-up-subject">Confirm password</span>
			<div class="m-3">
				<input type="password" name="confirmPassword" id="confirmPassword" class="form-control col-6" placeholder="비밀번호를 입력하세요">
			</div>

			<span class="sign-up-subject">Name</span>
			<div class="m-3">
				<input type="text" name="name"  id="name" class="form-control col-6" placeholder="이름을 입력하세요">
			</div>

			<span class="sign-up-subject">이메일</span>
			<div class="m-3">
				<input type="text" name="email" id="email" class="form-control col-6" placeholder="이메일을 입력하세요">
			</div>

			<br>
			<div class="d-flex justify-content-center m-3">
				<button type="button" id="signUpBtn" class="btn btn-info">가입하기</button>
			</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function(){
		
		// 아이디 중복확인
		$('#loginIdCheckBtn').on('click', function(e){
			let loginId = $('input[name=loginId]').val().trim();
			
			// alert(loginId);
			// idCheckLength idCheckDuplicated idCheckOk
			if (loginId.length < 4) {
				$('#idCheckLength').removeClass('d-none'); // 경고문구 노출
				$('#idCheckDuplicated').addClass('d-none'); // 숨김
				$('#idCheckOk').addClass('d-none'); // 숨김
				return;
			}
			
			// ajax 서버 호출(중복여부)
			$.ajax({
				type:'get'
				, url: '/user/is_duplicated_id'
				, data: {'loginId':loginId}
				, success: function(data){
					//alert(data.result)
					
					if (data.result) {
						// 중복이다.
						$('#idCheckLength').addClass('d-none');
						$('#idCheckDuplicated').removeClass('d-none'); // 경고문구 노출
						$('#idCheckOk').addClass('d-none'); 
					} else {
						// 가능하다. 	
						$('#idCheckLength').addClass('d-none'); 
						$('#idCheckDuplicated').addClass('d-none'); 
						$('#idCheckOk').removeClass('d-none'); // 경고문구 노출
					}
				}
				, error: function(e){
					alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.")
				}
			});
		});
		
		// signUpBtn
		$('#signUpBtn').on('click', function() {
			let loginId = $('#loginId').val().trim();
			if(loginId == '') {
				alert("아이디를 입력하세요.")
				return
			}

			let password = $('#password').val();
			let confirmPassword = $("#confirmPassword").val();
			if (password == ''|| confirmPassword == ''){
				alert("비밀번호를 입력해주세요.")
				return;
			}
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다.")
				$('#password').val('');
				$("#confirmPassword").val('');
				return;
			}
			

			let name = $('#name').val().trim();
			if(name == '') {
				alert("이름을 입력하세요.")
				return
			}

			let email = $('#email').val().trim();
			if(email == '') {
				alert("이메일을 입력하세요.")
				return
			}
			
			//아이디 중복확인 완료됐는지 확인
			// -- #idCheckOk <div> 클레스에 d-none이 없으면 사용가능
			if ($('#idCheckOK').hasClass('d-none')){
				alert('아이디 중복확인을 해주세요.')
				return;
			}
			
			// 서버에 요청
			// $.ajax 다른 모양 jquary post함수
			let url = $('#signUpForm').attr('action');
			alert(url);
			let data = $('#signUpForm').serialize(); // 폼테그에 있는 데이터를 한번에 보낼 수 있게 구성한다. 그렇지 않으면 json으로 구성해야한다. 나열한다. 쿼리 스트링을 구성한다.
			alert(data)
			
			$.post(url, data)
			.done(function(data){
				if (data.result == 'success') {
					alert("가입을 환영합니다!! 로그인 해주세[요]")
					location.href = '/user/sign_in_view';
				}else{
					alert("가입에 실패했습니다.");
				} 
			});
			
		});
	});
</script>