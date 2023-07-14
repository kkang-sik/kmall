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
    <title>Dashboard Template · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/dashboard/">

    <!-- jQuery 3 -->
	<script src="/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/dist/js/adminlte.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	    

    <!-- Bootstrap core CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  
    <!-- Custom styles for this template -->
    <link href="/admin/dashboard.css" rel="stylesheet">
  </head>
  <body>
    
<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<div class="container-fluid">
  <div class="row">
    <%@include file="/WEB-INF/views/admin/include/nav.jsp" %>
       
	<div class="col-md-10" style="padding:50px;">	
        	
        		<div class="box">
            
		            <!-- /.box-header -->
		            <div class="box-body">
		              <table class="table table-bordered">
		                <tbody><tr>
		                  <th style="width: 2%">
		                  1차 카테고리 주문통계
		                  </th>
		                </tr>
		                <tr>
		                	<td>
		                		<div id="firstCategoryChart"></div>
		                	</td>
		                </tr>
		                
		              </tbody></table>
		            </div>
		            <!-- /.box-body -->
           
          		</div>
        	
        	</div>
        	

		<!-- /.box-body -->
		<!-- [이전] 1 2 3 4 5 [다음] 출력작업 -->
		<div class="box-footer clearfix">
		  <ul class="pagination pagination-sm no-margin pull-right">
			<c:if test="${pageMaker.prev }">
				<li><a href="${pageMaker.startPage - 1}">[prev]</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
				<li ${pageMaker.cri.pageNum == pageNum ? "class='active'": ""}><a href="${pageNum }">${pageNum }</a></li>
			</c:forEach>
			
			
			<c:if test="${pageMaker.next }">
				<li><a href="${pageMaker.endPage + 1}">[next]</a></li>
			</c:if>
		  </ul>
		  <!-- 페이징정보. Criteria 클래스 필드정보작업 -->
		  <form id="actionForm" action="/admin/product/pro_list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="type" value="${pageMaker.cri.type}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		  </form>
		</div>
	  </div>
		
		</div>
   
        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
        <script src="/admin/dashboard.js"></script>
        
<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
        
        let categoryData = $.ajax({
          url: '/admin/chart/firstCategoryOrderPrice',
          type: 'get',
          dataType: 'json',
          async:false
        }).responseText;
        
        // Create the data table.
        // 데이터형식을 2차원배열로
        // var data = new google.visualization.arrayToDataTable(${firstCategoryData});
        // 데이터형식을 json으로
        var data = new google.visualization.DataTable(categoryData);
        
        // Set chart options
        var options = {'title':'1차 카테고리별 주문금액차트',
                       'width':500,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('firstCategoryChart'));
        chart.draw(data, options);
      }
    </script>

<script>
  $(document).ready(function() {
   
    

  }); // jquery ready event end

    </script>
  </body>
</html>
