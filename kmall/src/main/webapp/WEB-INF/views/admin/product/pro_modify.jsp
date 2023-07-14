<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;f
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/admin/dashboard.css" rel="stylesheet">
  </head>
  <body>
    
<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<div class="container-fluid">
  <div class="row">
  
    <%@include file="/WEB-INF/views/admin/include/nav.jsp" %>

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
       
       <div class="row mt-4 ml-4">
     	<div class="col-md">
     		<div class="box box-primary">
     			<form id="productForm" action="" method="post" enctype="multipart/form-data">
     			<div class="box-header mb-4 text-center">
     				<h1 class="pro_insert">상품 수정</h1>
     			</div>
     			<div class="box-body">
     				
					  <div class="form-group row">
					    <label for="pdt_name" class="col-sm-2 col-form-label">카테고리</label>
					    <div class="col-sm-3">
					    	<input type="hidden" name="pageNum" value="${cri.pageNum }">
					    	<input type="hidden" name="amount" value="${cri.amount }">
					    	<input type="hidden" name="type" value="${cri.type }">
					    	<input type="hidden" name="keyword" value="${cri.keyword }">
					    	<select name="cat_prtcode" id="firstCategory" class="form-control">
					    		<option value="">1차카테고리 선택</option>
					    		<c:forEach items="${categoryList }" var="category">
					    			<option value="${category.cat_code }" ${category.cat_code == categoryVO.cat_code ? 'selected': ''}>${category.cat_name }</option>
					    		</c:forEach>
					     	</select>
					    </div>
						<div class="col-sm-3">					    	
					    	<select name="cat_code" id="secondCategory" class="form-control">
					    		<option value="">2차카테고리 선택</option>
					    		<c:forEach items="${subCategoryList }" var="category">
					    			<option value="${category.cat_code }" ${category.cat_code ==  productVO.cat_code ? 'selected' : ''}>${category.cat_name }</option>
					    		</c:forEach>
					    	</select>
					    </div>
					  </div>
					  
					  <div class="form-group row">
					    <label for="pro_name" class="col-sm-2 col-form-label">상품명</label>
					    <div class="col-sm-4">
					      <input type="hidden" class="form-control" id="pro_num" name="pro_num" value="${productVO.pro_num}">
					      <input type="text" class="form-control" id="pro_name" name="pro_name" value="${productVO.pro_name}">
					    </div>
					    <label for="pro_price" class="col-sm-2 col-form-label">상품가격</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="pro_price" name="pro_price" value="${productVO.pro_price}">
					    </div>
					  </div>
					  
					  <div class="form-group row">
					    <label for="pro_discount" class="col-sm-2 col-form-label">할인율</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="pro_discount" name="pro_discount" value="${productVO.pro_discount}">
					    </div>
					    <label for="pro_publisher" class="col-sm-2 col-form-label">제조사</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="pro_publisher" name="pro_publisher" value="${productVO.pro_publisher}">
					    </div>
					  </div>
					  
					  <div class="form-group row">
					    <label for="pdt_img" class="col-sm-2 col-form-label">상품이미지</label>
					    <div class="col-sm-6"> <!-- name="pdt_img" 존재안함.  스프링에서는 Null 이 됨.-->
					      <input type="hidden" name=pro_up_folder value="${productVO.pro_up_folder}">
					      <input type="hidden" name="pro_img" value="${productVO.pro_img}">
					      <input type="file" class="form-control" id="uploadFile" name="uploadFile">
					    </div>
					  </div>
					  
					  <div class="form-group row">
					    <label for="change_img" class="col-sm-4 col-form-label">현재 / 변경 이미지</label>
					    <div class="col-sm-4">
					      <img id="curr_img" src="/admin/product/displayImage?folderName=${productVO.pro_up_folder }&fileName=s_${productVO.pro_img}" style="width: 200px;height: 200px;">
					    </div>
              			<div class="col-sm-4">
					      <img id="change_img" style="width: 200px;height: 200px;">
					    </div>
					  </div>
			  
					  <div class="form-group row">
					    <label for="pro_content" class="col-sm-2 col-form-label">상품설명</label>
					    <div class="col-sm-10">
					      <textarea class="form-control" id="pro_content" name="pro_content" rows="3">${productVO.pro_content}</textarea>
					    </div>
					  </div>
					  
					  <div class="form-group row">
					    <label for="pro_amount" class="col-sm-2 col-form-label">수량</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="pro_amount" name="pro_amount" value="${productVO.pro_amount}">
					    </div>
					    <label for="pro_buy" class="col-sm-2 col-form-label">판매여부</label>
					    <div class="col-sm-4">
					      <select id="pro_buy" name="pro_buy">
					      	<option value="Y" ${productVO.pro_buy == 'Y' ? 'selected':''}>판매가능</option>
					      	<option value="N" ${productVO.pro_buy == 'N' ? 'selected':''}>판매불가능</option>
					      </select>
					    </div>
					  </div>	  
				 
     			</div>
     			<div class="box-footer">
     				<div class="form-group">
     					<ul class="uploadedList"></ul>
     				</div>    				
     				<div class="form-group row">
						  <div class="col-sm-12 text-center">
						  	<button type="submit" class="btn btn-dark" id="btnProduct">상품등록</button>
						  </div>			
					</div>
     			</div>
     			</form>
     		</div>
     	</div>
     </div>
  </div>
</div>


    
        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
        <script src="/admin/dashboard.js"></script>
        
        <script src="/bower_components/ckeditor/ckeditor.js"></script>
    <script>
    	$(document).ready(function(){
    		// ckeditor 버전: 4.12.1 (Standard)환경설정. javascript object구문사용
    		let ckeditor_config = {
    			resize_enabled : false,
    			enterMode : CKEDITOR.ENTER_BR,
    			shiftEnterMode : CKEDITOR.ENTER_P,
    			toolbarCanCollapse : true,
    			removePlugins : "elementspath",
    			filebrowserUploadUrl : '/admin/product/imageUpload'		// 업로드 탭 표시하기
    		}
    	
    		CKEDITOR.replace("pro_content", ckeditor_config);
    		
    		// 1차카테고리 선택
			$("#firstCategory").change(function() {

				let cat_code = $(this).val();

				// 선택한 1차카테고리에 의한 2차카테고리 목록	
				let url = "/admin/product/subCategory/" + cat_code + ".json";
				// ajax기능 메서드
				$.getJSON(url, function(subCategoryData){
					
				let optionStr = "";
				let secondCategory = $("#secondCategory");

				secondCategory.find("option").remove(); // 카테고리 변경에 따른 이전 상태를 제거
				secondCategory.append("<option value=''>2차 카테고리 선택</option");

				for(let i=0; i<subCategoryData.length; i++) {
					optionStr += "<option value='" + subCategoryData[i].cat_code + "'>" + subCategoryData[i].cat_name + "</option>";
				}

				secondCategory.append(optionStr);



				});
			});
    		
    		// 파일첨부 이미지 미리보기
    		$("#uploadFile").on("change", function(e) {
    			let file = e.target.files[0];			// 선택한 파일들 중 첫번째 파일
    			
    			let reader = new FileReader();			// 첨부된 파일을 읽기위한 파일입력객체
    			
    			// reader객체가 파일을 로딩했을 때
    			reader.onload = function(e) {
    				$("#change_img").attr("src", e.target.result);
    			}
    			
    			// reader객체에 파일객체를 할당하기
    			reader.readAsDataURL(file);
    		});
    	});
    </script>
  </body>
</html>
