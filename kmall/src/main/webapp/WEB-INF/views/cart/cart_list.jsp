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
    <title>Pricing example · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

    <%@ include file="/WEB-INF/views/include/config.jsp" %>

    


    <!-- Favicons 
<link rel="apple-touch-icon" href="/docs/4.6/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.6/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.6/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.6/assets/img/favicons/browserconfig.xml">
-->
<meta name="theme-color" content="#563d7c">


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
   
    
  </head>
  <body>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h4 class="display-4">장바구니</h4>
</div>

<div class="container">
 <div class="row">
  	<div class="col-md-12">

              <table class="table table-bordered">
                <tbody><tr>
                  <th style="width: 50%">상품명</th>
                  <th style="width: 10%">수량</th>
                  <th style="width: 10%">포인트</th>
                  <th style="width: 10%">배송비</th>
                  <th style="width: 10%">가격</th>
                  <th style="width: 10%">취소</th>
                </tr>
                <c:forEach items="${cart_list }" var="cartListDTO">
                <tr>
                  <td>
                  	<a class="move" href="${cartListDTO.pro_num }"><img src="/cart/displayImage?folderName=${cartListDTO.pro_up_folder }&fileName=s_${cartListDTO.pro_img}" /></a>
                    <a class="move" href="${cartListDTO.pro_num }"><c:out value="${cartListDTO.pro_name }" ></c:out></a>
                  	<input type="hidden" name="cart_code" value="${cartListDTO.cart_code }">
                  </td>
                  <td>
                    <input type="text" name="cart_amount" style="width:100px" value="${cartListDTO.cart_amount }">
                    <button type="button" name="btn_cart_amount_change" class="btn btn-link">수량변경</button>
                  </td>
                  <td>포인트 : 0</td>
                  <td>
                  	[기본배송조건]
                 </td>
                  <td><input type="text" name="unitprice" style="width:100px" value="${cartListDTO.unitprice }"></td>
                  <td><button type="button" name="btn_cart_del" class="btn btn-link">삭제</button></td>
                </tr>
                </c:forEach>
                
              </tbody>
              <c:if test="${!empty  cart_list}">
              <tfoot>
              	<tr>
              		<td colspan="6" class="text-right">총 구매금액 : <fmt:formatNumber type="currency" pattern="₩#,###" value="${cart_tot_price }"/></td>
              	</tr>
              </tfoot>
              </c:if>
              <c:if test="${empty  cart_list}">
              <tfoot>
              	<tr>
              		<td colspan="6" class="text-center">[장바구니에 담긴 상품이 없습니다.]</td>
              	</tr>
              </tfoot>
              </c:if>
              </table>

  	</div>
 </div>
 <div class="row">
 	<div class="col-md-12 text-center">
 		<button type="button" id="btn_cart_empty" class="btn btn-light">장바구니 비우기</button>
 		<button type="button" class="btn btn-light">게속 쇼핑하기</button>
 		<button type="button" id="btn_order" class="btn btn-dark">주문하기</button>
 	</div>
 </div>
     <hr class="featurette-divider">
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>
   <script>
    $(document).ready(function() {

      // 장바구니 수량변경
      $("button[name='btn_cart_amount_change']").on("click", function(){
        let cur_amount_change = $(this);

        let cart_code = cur_amount_change.parent().parent().find("input[name='cart_code']").val();
        let cart_amount = cur_amount_change.parent().find("input[name='cart_amount']").val();

        $.ajax({
          url: '/cart/cart_amount_change',
          type: 'post',
          data: {cart_code : cart_code, cart_amount: cart_amount},
          dataType: 'text',
          success : function(result) {
            if(result = "success") {
              alert("장바구니 수량이 변경됨.");
              // 1)새로 읽어올것인가?
              // 2)현재 위치에서 작업을 통하여 변경 할 것인가?

              location.href = "/cart/cart_list";
            }
          }
        });
      });

      // 장바구니 삭제
      $("button[name='btn_cart_del']").on("click", function() {

        
        if(!confirm("해당 상품을 삭제하시겠습니까?")) return;
        
        let cart_code = $(this).parent().parent().find("input[name='cart_code']").val();



        $.ajax({
          url: '/cart/cart_delete',
          type: 'post',
          data: {cart_code : cart_code},
          dataType: 'text',
          success : function(result) {
            if(result = "success") {
              alert("장바구니에서 삭제됨.");
              // 1)새로 읽어올것인가?
              // 2)현재 위치에서 작업을 통하여 변경 할 것인가?

              location.href = "/cart/cart_list";
            }
          }
        });
      });

      // 장바구니 비우기
      $("#btn_cart_empty").on("click", function() {

        if(!confirm("장바구니를 비우겠습니까?")) return;

        location.href = "/cart/cart_empty";
      });
      
      // 주문하기
      $("#btn_order").on("click", function() {
    	 
    	  location.href = "/order/order_info"; 
      });


    });


   </script>
  </body>
</html>