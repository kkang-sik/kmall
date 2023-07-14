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
    <title>KMALL</title>

  <%@ include file="/WEB-INF/views/include/config.jsp" %>

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
      
      
       div.container{
    }

    div.insert{
    }
    
    div.create{
    width: 700px;
    text-align: center;
    padding: 30px;
    border-bottom: 1px solid black;
    margin: auto;
    }

    table{
    height: 200px;
    width: 500px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
    
     td{
    border-bottom: 1px dotted black;
    }
 
    h1{
    text-align: center;
    font-weight: bold;
    color:#000;
    margin:10px auto;
    }
    
    .col1 {
    background-color: #e8e8e8;
    padding: 15px;
    text-align: center;
    font-weight: bold;
    width:125px;
    }
 
    .col2 {
    text-align: left;
    padding: 10px;
    }

    .but{
    height: 35px;
    width: 150px;
    background-color: #e8e8e8;
    border: 2px solid white;
    }
    
    </style>

  </head>
  <body>
    
<header>
  <%@ include file="/WEB-INF/views/include/header.jsp" %>
  <%@ include file="/WEB-INF/views/include/nav.jsp" %>
</header>


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

<section>
	
		<form method="post" action="/member/login">
        <div class="container">
    <div class="insert">
    <h1>로그인 </h1>
       <table>
    

    <tr>
        <td class="col1">아이디</td>
        <td class="col2">
            <input type="text" name="mem_id" id="mem_id" maxlength="10" class="join">
        </td>
    </tr>
    <tr>
        <td class="col1">비밀번호</td>
        <td class="col2">
            <input type="password" name="mem_password" id="mem_password" maxlength="16" class="join">
        </td>
    </tr>
    </table>
    
  </div>
 
  <div class="create">
    	<button type="button" class="but" id="btn_join" ><a href="/member/join">회원 가입</a></button>
        <button type="button" class="but" id="btn_idpw" >ID/PW 찾기</button>
        <button type="submit" class="but" id="btn_login" >로그인 하기</button>
  </div>
  </div>
  </form>
			
</section>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>

	$(document).ready(function() {
	    let msg = '${msg}';
	    if(msg == 'failID') {
	      alert("존재하지 않는 아이디 입니다.");
	      $("#mem_id").focus();
	    }else if(msg == 'failPW') {
	      alert("비밀번호가 틀렸습니다.");
	      $("#mem_password").focus();
	    }
  	});
	
</script>

  </body>
</html>
