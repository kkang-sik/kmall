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

 
    h2{
    text-align: center;
    font-weight: bold;
    color:#000;
    margin:10px auto;
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
	
		<form method="post" action="">
        <div class="container">
    <div class="order_complete">

    <h2>주문이 정상적으로 처리되었습니다!</h2>
 
  <div class="create">
    	<button type="button" class="but" id="btn_order_list" ><a href="/product/pro_list/8/NEW">쇼핑 더하기</a></button>
        <button type="button" class="but" id="btn_home" ><a href="/">홈으로 이동</a></button>
  </div>
  </div>
  </div>
  </form>
			
</section>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->
	<!-- /.container -->


<%@ include file="/WEB-INF/views/include/footer.jsp" %>


  </body>
</html>
