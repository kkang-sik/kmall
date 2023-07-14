<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
        <div class="container">
        <div class="row">
        	<div class="col-md-12">
        	<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">게시판</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" method="post" action="/board/modify">
              <div class="box-body">
                <div class="form-group">
                    <input type="hidden" name="boa_bno" value='<c:out value="${board.boa_bno}" />'>
                	<select name="boa_category" id="boa_category" class="custom-select w-40 col-md-4">
          			<option value="">카테고리를 선택하세요.</option>
          				<option value="교환/환불/취소 문의">교환/환불/취소 문의</option>
          				<option value="상품 문의">상품문의</option>
          				<option value="기타">기타</option>
          			</select>
<!--           			<label for="mem_id col-md-4">작성자</label> -->
          			<input type="hidden" class="form-control col-md-4" id="mem_id" name="mem_id" value="${sessionScope.loginStatus.mem_id}" readonly>
          		</div>
                <div class="form-group">
                  <label for="boa_title">Title</label>
                  <input type="text" class="form-control" id="boa_title" name="boa_title"  value='<c:out value="${board.boa_title}" />'>
                </div>
                <div class="form-group">
                	<label for="boa_content">Content</label>
             	    <textarea class="form-control" rows="3" id="boa_content" name="boa_content"><c:out value="${board.boa_content}" /></textarea>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">수정하기</button>
              </div>
            </form>
          </div>
          
        	</div>
        	       	
        </div>
	</div>
    </section>
    
    

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

<!-- /.container -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

  </body>
</html>
