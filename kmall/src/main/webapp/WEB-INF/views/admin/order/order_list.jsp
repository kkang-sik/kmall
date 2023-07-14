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

  	<%@ include file="/WEB-INF/views/include/config.jsp" %>

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

	<script>

	let msg = "${msg}";
	if(msg == 'modify') {
		alert("상품이 수정되었습니다.");
	}else if(msg == 'delete') {
		alert("상품이 삭제되었습니다.");
	}

	</script>
    
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
		<div class="box-header with-border">
		  
			<div class="form-group row">
			  <div class="col-md-3">
			  <form id="searchForm" action="/admin/product/pro_list" method="get">
				<select name="type">
				  <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----</option>
				  <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
				  <option value="P" <c:out value="${pageMaker.cri.type eq 'P'? 'selected':'' }" />>제조사</option>    
				</select>
				<input type="text" name="keyword" placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword }" />'>
				<input type="hidden" name="pageNum" value="1">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<button type="submit"  class="btn btn-success">Search</button>
			   </form>
			  </div>

			  <div class="col-md-2">
			   <button type="button"  id="categorySearch" class="btn btn-success">Search</button>
			  </div>
			  <div class="col-md-2">
				<button type="button" id="btn_checkedModify" class="btn btn-primary">선택상품수정</button>
				<button type="button" id="btn_checkedDelete" class="btn btn-primary">선택상품삭제</button>
			  </div>
			</div>
		 
		</div>
		<!-- /.box-header -->
        <div class="row">
        	<div class="col-md-12">
        	
        		<div class="box">
            <div class="box-header with-border">
                <div class="form-group row">
                  <div class="col-md-12">
                  <form id="searchForm" action="" method="get">
                    주문일 : <input type="date" name="sDate" value="${sDate}"> ~ <input type="date" name="eDate" value="${eDate}">
                    <select name="type">
                      <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----</option>
                      <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>주문번호</option>
                      <option value="I" <c:out value="${pageMaker.cri.type eq 'I'? 'selected':'' }" />>주문자ID</option>    
                      <option value="R" <c:out value="${pageMaker.cri.type eq 'R'? 'selected':'' }" />>수령인</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword }" />'>
                    <input type="hidden" name="pageNum" value="1">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                    <button type="button" id="btn_order_search" class="btn btn-success">Search</button>
                   </form>
                  </div>
                </div>
             
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody><tr>
                  <th style="width: 2%"><input type="checkbox" id="checkAll"></th>
                  <th style="width: 15%">주문일시</th>
                  <th style="width: 18%">주문번호</th>
                  <th style="width: 15%">주문자/수령인</th>
                  <th style="width: 25%">주문금액/배송비</th>
                  <th style="width: 15%">결제방식</th>
                  <th colspan="2" style="width: 10%">주문관리</th>
                </tr>
                <c:forEach items="${orderList }" var="orderVO">
                <tr>
                  <td><input type="checkbox" name="check" value="${orderVO.ord_code }"></td>
                  <td>
                  	<fmt:formatDate value="${orderVO.ord_regdate }" pattern="yyyy-MM-dd HH:mm"/>
                  </td>
                  <td>
                    ${orderVO.ord_code }
                  </td>
                  <td>
                    ${orderVO.mem_id } / ${orderVO.ord_name }
                  </td>
                  <td>
                  	${orderVO.ord_price }
                  </td>
                  <td>${orderVO.pay_method }</td>
                  <td>
                    <button type="button" name="btn_orderDetail" data-ord_code="${orderVO.ord_code }" class="btn btn-link">상세</button>
                  </td>
                  <td>
                    <button type="button" name="btn_orderDelete" data-ord_code="${orderVO.ord_code }" class="btn btn-link">삭제</button>
                  </td>
                </tr>
                </c:forEach>
                
              </tbody></table>
            </div>
</div>
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
	
	</div>
	</div>


<!-- 1)Include Handlebars from a CDN -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<!-- 2)handlebars template. 댓글UI -->
<script id="orderDetailView" type="text/x-handlebars-template">
 <table class="table table-bordered">
 <tbody>
  <tr>
   <th style="width: 2%"><input type="checkbox" id="checkAll"></th>
   <th style="width: 8%">주문상품</th>
   <th style="width: 25%">판매가</th>
   <th style="width: 10%">수량</th>
   <th style="width: 20%">주문금액</th>
   <th style="width: 15%">상태</th>
   <th style="width: 10%">배송료</th>
   <th style="width: 10%">비고</th>
 </tr>
 {{#each .}}
   <tr> 
   <td style="width: 2%">
	<input type="checkbox" name="checkAll">
    <input type="hidden" name="ord_code" value="{{ord_code}}">
	</td>
   <td style="width: 8%"><img src="{{imageView pro_up_folder pro_img}}"> {{pro_name}}</td>
   <td style="width: 25%">{{dt_price}}</td>
   <td style="width: 10%">{{dt_amount}}</td>
   <td style="width: 20%">주문금액</td>
   <td style="width: 15%">상태</td>
   <td style="width: 10%">배송료</td>
   <td style="width: 10%"><button type="button" name="btn_order_product_del"  data-pro_num="{{pro_num}}" class="btn btn-link">Delete</button></td>
   </tr>	
 {{/each}}
 </tbody>
 </table>
</script>
<script>
  Handlebars.registerHelper("imageView", function(folder, file) {
    
    let url = "/admin/order/displayImage?folderName=" + folder.replace(/\\/g, "/") + "&fileName=" + "s_" + file;

    return  url;
  
  });
  
  
        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
        <script src="/admin/dashboard.js"></script>
        
        
<script>
$(document).ready(function() {
	   
    // 상세 버튼을 클릭 
    $("button[name='btn_orderDetail']").on("click", function() {

      // ajax요청에서 주문상세정보 json형태로 받는 작업
      
      let ord_code = $(this).data("ord_code");

      let url = "/admin/order/order_detail?ord_code=" + ord_code;

      $.getJSON(url, function(data) {
    	  
        let templateObj = Handlebars.compile($("#orderDetailView").html());
        let orderDetailVwHtml = templateObj(data); // 테이블과 댓글데이타가 바인딩된 결과
        
        // 추가된 기존 상세정보를 제거.
        $("#modalDetailView").empty();

        $("#modalDetailView").append(orderDetailVwHtml);

        $('#orderDetailModal').modal('show');

      });
      
      

     });

     // 주문삭제
     $("button[name='btn_orderDelete']").on("click", function() {
      
      if(!confirm("주문정보를 삭제하시겠습니까?")) return;

      let ord_code = $(this).data("ord_code");

      $.ajax({
          url: '/admin/order/orderInfoDelete',
          type: 'post',
          data: {ord_code : ord_code},
          dataType: 'text',
          success: function(result) {
            if(result == 'success') {
              alert("주문정보가 삭제되었습니다.");
              location.href = "/admin/order/order_list";
              
            }
          }

        });
     });

     //주문상세내역에서 삭제 클릭
     $("div#modalDetailView").on("click", "button[name='btn_order_product_del']", function() {
        
        if(!confirm("주문상세 상품을 삭제하시겠습니까?")) return;
        let cur_row = $(this).parent().parent();

        let pro_num = $(this).data("pro_num");
        let ord_code = $(this).parent().parent().find("input[name='ord_code']").val();

        $.ajax({
          url: '/admin/order/order_detail_product_delete',
          type: 'post',
          data: {ord_code : ord_code, pro_num : pro_num},
          dataType: 'text',
          success: function(result) {
            if(result == 'success') {
              alert("주문상품이 삭제되었습니다.");
              cur_row.remove();
              
            }
          }

        });
     });

     // 검색 클릭
     let searchForm = $("#searchForm");
     $("#btn_order_search").on("click", function() {
      searchForm.attr("action", "/admin/order/order_list");
      searchForm.find("input[name='pageNum']").val(1);
      searchForm.submit();
     });

     let actionForm = $("#actionForm");

     $("ul.pagination a").on("click", function(e) {
      e.preventDefault(); // a태그의 하이퍼링크 기능이 취소.

      // 현재 페이지번호 변경작업
      // form태그의 정보  
      // <input type="hidden" name="pageNum" value="1">
      // <input type="hidden" name="amount" value="10">
      actionForm.attr("action", "/admin/order/order_list");
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));

      actionForm.find("input[name='sDate']").remove();
      actionForm.find("input[name='eDate']").remove();

      actionForm.append("<input type='hidden' name='sDate' value='${sDate}'>");
      actionForm.append("<input type='hidden' name='eDate' value='${eDate}'>");

      actionForm.submit();
      });
    

  }); // jquery ready event end
</script>
<!-- Button trigger modal 
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>
-->
<!-- Modal -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">주문상세내역</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalDetailView">
        
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary">선택삭제</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>

  </body>
</html>
