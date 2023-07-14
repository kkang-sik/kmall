<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <style>
    .text-gray-800 {
  	color: white;
	}
	
	.logininfo {
	color: white;
	padding-left: 30px;
	}
	</style>
	
<div style="margin-bottom:30px;">

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">


    
<!-- 
    <div class="order-1 md:order-1" style="float: left;">
    	<a class="flex items-left tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl " href="/" style="font-size: 28px;">
        	<svg class="fill-current text-gray-800 mr-2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M5,22h14c1.103,0,2-0.897,2-2V9c0-0.553-0.447-1-1-1h-3V7c0-2.757-2.243-5-5-5S7,4.243,7,7v1H4C3.447,8,3,8.447,3,9v11 C3,21.103,3.897,22,5,22z M9,7c0-1.654,1.346-3,3-3s3,1.346,3,3v1H9V7z M5,10h2v2h2v-2h6v2h2v-2h2l0.002,10H5V10z"></path>
            </svg>
            KMALL
        </a>
    </div>
 -->
            
     <ul class="navbar-nav mr-auto">
      	  <li class="nav-item active">
          <h2 class="nav-link"><a href="/">KMALL</a></h2>
     </ul>
         
    <div class="collapse navbar-collapse" id="navbarCollapse">
    
          
  <c:if test="${sessionScope.loginStatus != null }">
  <div class="logininfo">
  <span>${sessionScope.loginStatus.mem_name} 님</span> /
  <span>포인트 : ${sessionScope.loginStatus.mem_point} </span> /
  <span>최근접속 : 
  	<fmt:formatDate value="${sessionScope.loginStatus.mem_lastlogin}" pattern="yyyy-MM-dd HH:mm"/>
  </span>
  </div>
  </c:if>
    

      <ul class="navbar-nav ml-auto">
      
      		<!-- 기본 표시 -->
        <li class="nav-item active">
          <a class="nav-link" href="/product/pro_list/8/NEW">Shop</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/board/list">Board</a>
        </li>
        
            <!-- 로그인 이전 표시 -->
    	<c:if test="${sessionScope.loginStatus == null }">
        <li class="nav-item active">
          <a class="nav-link" href="/member/login">Login</a>
        </li>
        </c:if>
        
            <!--  로그인 이후 표시 -->
	    <c:if test="${sessionScope.loginStatus != null }">
	    <li class="nav-item active">
          <a class="nav-link" href="/cart/cart_list">Cart</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/member/modify">My</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/member/logout">Logout</a>
        </li>
	    </c:if>

      </ul>

    </div>
  </nav>
  
</div>
 