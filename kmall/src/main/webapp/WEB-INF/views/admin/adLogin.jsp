<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Signin Template · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="/user/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

	<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/css/adLogin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<form class="form-signin" action="/admin/admin_ok" method="post">
  <img class="mb-4" img src="/image/KLogo.jpg" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  
  <label for="inputID" class="sr-only">ID</label>
  <input type="text" name="admin_id" class="form-control" placeholder="Admin ID" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" name="admin_pw" class="form-control" placeholder="Password" required>
  
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember me
    </label>
  </div>
  
  <button class="btn btn-lg btn-primary btn-block" type="submit" value="Sign In">Sign in</button>
  
  <p class="mt-5 mb-3 text-muted">&copy; 2017-2022</p>
</form>


 <script>
 	$(document).ready(function() {
 	  let msg = '${msg}';
      if(msg == 'failID') {
        alert("아이디를 확인하세요");
      }else if(msg == 'failPW') {
    	  alert("비밀번호를 확인하세요");
      }
 	});  

 </script>


    
  </body>
</html>
