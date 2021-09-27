<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
        <!-- <link rel="stylesheet" href="jQuery_advance_problem_style.css" type="text/css"> -->
		<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
        <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript" src="jQuery_complete_problem_script.js"></script>
        
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <link rel="stylesheet" type="text/css" href="/css/lesson06/style.css">
    </head>
<body>
	<div class="container">
		<header class="bg-secondary p-3">
			<h1>메모 게시판</h1>
        </header>
        <div class="d-flex">
            <div class="col-3"></div>
            <div class="col-6">
                <h1 class="mt-3">로그인</h1>
                <form method="POST" action="/servlet/quiz10" class="p-5 bg-light">
                    <div class="form-group w-100">
                        <input type="text" class="form-control" id="id" name="id" placeholder="Username">
                    </div>
                    <div class="form-group w-100">
                        <input type="password" class="form-control" id="pw" name="pw" placeholder="····">
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
</body>
</html>