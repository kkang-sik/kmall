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
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/css/style.css">
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    
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
	  /* 상품후기 쓰기에서 별 표시 */
      p#star_rv_score a.rv_score {
        font-size: 22px;
        text-decoration: none;
        color: lightgray;
      }
	   /* 상품후기 쓰기에서 별 클릭시 적용 */
      p#star_rv_score a.rv_score.on {
        color: black;
      }
		/* 상품후기 목록에서 별 표시 */
      td#star_rv_score a.rv_score {
        font-size: 22px;
        text-decoration: none;
        color: lightgray;
      }
		/* 상품후기 목록에서 수정클릭시 별 선택시 적용 */
      td#star_rv_score a.rv_score.on {
        color: black;
      }
    </style>
	  
    
  </head>
  <body>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h4 class="display-4">${cat_name }</h4>
</div>

<div class="container">
 <div class="row">
    <div class="col-md-6">
	   <img style="width: 400px; height: 400px" src="/product/displayImage?folderName=${productVO.pro_up_folder }&fileName=${productVO.pro_img}"> 
	</div>
    <div class="col-md-6">
    	<p>상품명: ${productVO.pro_name}</p>
    	<p>가격: <fmt:formatNumber type="currency" pattern="₩#,###" value="${productVO.pro_price}"/></p>
    	<p>제조사: ${productVO.pro_publisher}</p>
    	<p>수량: <input type="text" id="pro_amount" value="1" style="width: 50px;"></p>
    	<button type="button" name="btn_cart"  data-pro_num="${productVO.pro_num}" class="btn btn-link">장바구니</button>
	    <button type="button" name="btn_direct_order" data-pro_num="${productVO.pro_num}" class="btn btn-link">바로구매</button>
    </div> 
 </div>
 
<div class="row">
	<div class="col-md-12"> 
		<div id="tabs">
		  <ul>
		    <li><a href="#pro_desc">상세정보</a></li>
		    <li><a href="#pro_review">상품리뷰</a></li>
		  </ul>
		  <div id="pro_desc">
		    ${productVO.pro_content}
		  </div>
		  <div id="pro_review">
		    
		    <!-- 상품후기목록및페이징작업 -->
		    <!-- 상품후기쓰기 폼 -->
		    <div class="row">
		      <div class="col-md-12">
		        <!--<form role="form">-->
		          <div class="box-body">
		            <div class="form-group row">
		              <div class="col-md-8">
		                <input type="text" class="form-control" id="rev_content" placeholder="상품후기를 작성하세요...">
		                <p id="star_rv_score">
		                	<a class="rv_score" href="#">☆</a>
		                	<a class="rv_score" href="#">☆</a>
		                	<a class="rv_score" href="#">☆</a>
		                	<a class="rv_score" href="#">☆</a>
		                	<a class="rv_score" href="#">☆</a>
		                </p>
		              </div>
		              <div class="col-md-4">
		                <button type="button" id="btn_review_write" class="btn btn-primary">등록</button>
		              </div>  
		            </div>
		          </div>
		        <!--</form>-->
		      </div>
		    </div>
		    <!-- 상품후기목록이 출력되는 위치 -->
		    <div id="replyList"></div>
		    <!-- 페이징 출력되는 위치 -->
		    <div id="replyPaging"></div>
		    
		    
		  </div>
		</div>
	</div>
</div>

<script>
  $(function () {
	  $( "#tabs" ).tabs();
  })
</script>
 

 
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<!-- 1)Include Handlebars from a CDN -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<!-- 2)handlebars template. 댓글UI -->
<script id="replyViewTemplate" type="text/x-handlebars-template">
  <table class="table">
    {{#each .}}
    <tr>
      <td>{{rev_num}}</td>
	    <td>{{displayStar rev_score}} <input type="hidden" name="rev_score" value="{{rev_score}}"></td>
      <td>{{rev_content}}</td>
      <td>{{mem_id}}</td>
      <td>{{convertDate rev_regdate}}</td>
      <td>
 		{{authority mem_id rev_num}}
      </td>
    </tr>
    {{/each}}
  </table>
</script>
<!-- Handlebar의 사용자정의 Helper. milisecond를 자바스크립트의 Date객체작업. -->
<script>
  // 날짜데이터가 json으로 변환되어, 밀리세컨드 단위로 된것을 다시 날짜로 변환작업.
  Handlebars.registerHelper("convertDate", function(timeValue) {
    const date = new Date(timeValue);

    return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
  })
  
  // 평점을 별로 표시하는 함수.
  Handlebars.registerHelper("displayStar", function(rating) {
    
	  let starStr = "";
	  switch(rating) {
	  	case 1:
		  	starStr = "★☆☆☆☆";
		  	break;
	  	case 2:
		  	starStr = "★★☆☆☆";
		  	break;
	  	case 3:
		  	starStr = "★★★☆☆";
		  	break;
	  	case 4:
		  	starStr = "★★★★☆";
		  	break;
	  	case 5:
		  	starStr = "★★★★★";
		  	break;
	  }
	  
	  return starStr;
  })
  
  Handlebars.registerHelper("authority", function(mem_id, rev_num) {
	  let str = "";
      let login_id = '${sessionScope.loginStatus.mem_id}';
      if(mem_id == login_id) {
    	  // <button type="button" data-rev_num="{{rev_num}}" name="btn_re_edit" class="btn btn-link">Edit</button>
    	  str += "<button type='button' class='btn btn-link' name='btn_re_edit' data-rev_num='" + rev_num + "'>Edit</button>";
        // <button type="button" data-rev_num="{{rev_num}}" name="btn_re_delete" class="btn btn-link">Delete</button>
    	  str += "<button type='button' class='btn btn-link' name='btn_re_delete' data-rev_num='" + rev_num + "'>Delete</button>";
      }

      return new Handlebars.SafeString(str);
  })
</script>
<script>

    $(document).ready(function() {
	
      $("#tabs").tabs();	
    	
      // 장바구니 클릭
      $("button[name=btn_cart]").on("click", function() {
    	  
        $.ajax({
          url: '/cart/cart_add',
          type: 'post',
          data: {pro_num : $(this).data("pro_num"), cart_amount : $("#pro_amount").val()},
          success: function(result) {
            if(result == "success") {
              alert("장바구니에 추가됨");
              if(confirm("장바구니로 이동하겠습니까?")) {
                location.href = "/cart/cart_list";
              }
            }
          }
        });
      });
      
      $("button[name='btn_direct_order']").on("click", function() {

          let url = "/cart/direct_cart_add?pro_num=" + $(this).data("pro_num") + "&cart_amount=1";
          
          location.href = url;
        });
    });



  </script>
  
  <script>

    // jQuery 이벤트 설정
    $(document).ready(function() {

      */
     // 동적으로 추가된 태그를 click 이벤트 설정시 하는 작업
      $("#replyPaging").on("click", "li a", function(e) {
          e.preventDefault(); // 링크기능 취소.

          // 선택한 댓글 페이지번호.
          reviewPage = $(this).attr("href");
          url = "/review/list/" + pro_num + "/" + reviewPage + ".json";
          getPage(url); // 스프링에서 댓글번호에 해당하는 댓글데이타 가져오기.
      });

      // 평점 별 클릭
      $("p#star_rv_score a.rv_score").on("click", function(e){
        e.preventDefault();
        $(this).parent().children().removeClass("on");
        $(this).addClass("on").prevAll("a").addClass("on");        
      });

      //댓글쓰기
      $("#btn_review_write").on("click", function() {
        let rev_content = $("#rev_content").val(); // 상품후기내용
        let rv_score = 0;

        // 별평점 체크
        $("p#star_rv_score a.rv_score").each(function(index, item) {
          if($(this).attr("class") == "rv_score on") {
            rv_score += 1;
          }
        });

        if(rv_score == 0) {
          alert("별 평점을 선택하세요.");
          return;
        }

        if(rev_content == "") {
          alert("상품후기를 입력하세요");
          return;
        }

        // {"pro_num": 275, "replyer": "홍길동", "reply":"댓글내용"}
        let reviewData = JSON.stringify({pro_num: ${productVO.pro_num}, rev_score : rv_score, rev_content: rev_content});

        $.ajax({
          type: 'post',
          url: '/review/new',  // 매핑주소의 컨트롤러 클래스가 @RestController 이므로, 전송데이타를 JSON 형식으로 사용함.
          headers: {
            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"
          },
          dataType: 'text', // 스프링 메서드의 리턴타입
          data: reviewData, // 서버로 보내는 JSON데이타.
          success: function(result) {
            if(result == "success") {
              alert("상품후기 등록됨");
              $("#rev_content").val("");
              $("p#star_rv_score a.rv_score").removeClass("on");

              reviewPage = 1;
              url = "/review/list/" + pro_num + "/" + reviewPage + ".json";

              getPage(url);
            }
          }
        });
      }); // 댓글쓰기

      



      // 상품후기 수정폼
      $("div#replyList").on("click", "button[name='btn_re_edit']",function() {

        let cur_tr = $(this).parent().parent(); // 선택한 edit버튼의 현재 tr

        let rev_num = cur_tr.children().eq(0).text();
        
        let rev_score = cur_tr.children().eq(1).find("input[name='rev_score']").val();

        let displayStar = "";
        for(let i=0; i<5; i++) {
          
          if(i < rev_score) {
            displayStar += "<a href='#' class='rv_score on'>";
            displayStar += "★";
          }else {
            displayStar += "<a href='#' class='rv_score'>";
            displayStar += "☆";
          }

          displayStar += "</a>";

        }

        let input_displayStar = "<input type='hidden' name='rev_score' value='" + rev_score + "'>";

        let rev_content = cur_tr.children().eq(2).text();
        let mem_id = cur_tr.children().eq(3).text();
        let rev_regdate = cur_tr.children().eq(4).text();

        // Edit버튼이 선택된 tr의 td를 모두 삭제한다.
        cur_tr.empty();

        let rev_num_str = "<td><input type='text' id='edit_rev_num' value='" + rev_num + "' readonly></td>";
        let rev_score_str = "<td id='star_rv_score'>" + displayStar + input_displayStar + "</td>";
        let rev_content_str = "<td><input type='text' id='edit_rev_content' value='" + rev_content + "'></td>";
        let mem_id_str = "<td>" + mem_id + "</td>";
        let rev_regdate_str = "<td>" + rev_regdate + "</td>";

        let btn_str = "<td><button type='button' id='btn_re_cancel' class='btn btn-link'>취소</button>";
        btn_str += "<button type='button' id='btn_re_register' class='btn btn-link'>수정</button></td>";
     

        cur_tr.append(rev_num_str, rev_score_str, rev_content_str, mem_id_str, rev_regdate_str, btn_str);

      }); // 댓글수정폼

      // 평점 별 클릭 - 동적으로 생성된 태그에 이벤트 설정
      $("div#replyList").on("click", "td#star_rv_score a.rv_score", function(e){
        e.preventDefault();
        $(this).parent().children().removeClass("on");
        $(this).addClass("on").prevAll("a").addClass("on");        
      });
      
      // 상품후기 수정하기
      $("div#replyList").on("click", "#btn_re_register", function() {
        let edit_rev_num = $("#edit_rev_num").val();
        let edit_rev_content = $("#edit_rev_content").val();
        
        let rv_score = 0;

        // 별평점 수정 읽어오기
        // 별평점 체크
        $("td#star_rv_score a.rv_score").each(function(index, item) {
          if($(this).attr("class") == "rv_score on") {
            rv_score += 1;
          }
        });

        let reviewData = JSON.stringify({rev_num: edit_rev_num, rev_content: edit_rev_content, rev_score : rv_score});
        
        
        $.ajax({
          type: 'patch',
          url: '/review/modify/',
          headers: {
            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "PATCH"
          },
          data: 'text',
          data: reviewData,
          success: function(result) {
            if(result == "success") {
              alert("상품후기 수정됨");

              url = "/review/list/" + pro_num + "/" + reviewPage + ".json";

              getPage(url);
            }
          }
        });
      }); // 댓글수정하기

      // 상품후기 수정 취소하기
      $("div#replyList").on("click", "#btn_re_cancel",function() {
        

        let cur_tr = $(this).parent().parent();
        let edit_rev_num = cur_tr.children().eq(0).find("#edit_rev_num").val();
        let edit_star = cur_tr.children().eq(1).html();
        let edit_rev_content = cur_tr.children().eq(2).find("#edit_rev_content").val();
        let edit_mem_id = cur_tr.children().eq(3).text();
        let edit_rev_regdate = cur_tr.children().eq(4).text();

        let edit_rev_num_str = "<td>" + edit_rev_num + "</td>";
        let edit_star_str = "<td>" + edit_star + "</td>";
        let edit_rev_content_str = "<td>" + edit_rev_content + "</td>";
        let edit_mem_id_str = "<td>" + edit_mem_id + "</td>";
        let edit_rev_regdate_str = "<td>" + edit_rev_regdate + "</td>";

        let btn_str = "<td><button type='button' data-rev_num=" + edit_rev_num + " name='btn_re_edit' class='btn btn-link'>Edit</button>";
        btn_str += "<button type='button' data-rev_num=" + edit_rev_num + " name='btn_re_delete' class='btn btn-link'>Delete</button></td>";
        
        cur_tr.empty();


        cur_tr.append(edit_rev_num_str, edit_star_str, edit_rev_content_str, edit_mem_id_str, edit_rev_regdate_str, btn_str); // 원래상태로 복구.

      });


      // 댓글 삭제하기
      $("div#replyList").on("click", "button[name='btn_re_delete']",function() {

        if(!confirm("상품후기 삭제를 하시겠습니까?")) return;

        $.ajax({
          type: 'delete',
          url: '/review/delete/' + $(this).data("rev_num"),
          headers: {
            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "DELETE"
          },
          data: 'text',
          success: function(result) {
            if(result == "success") {
              alert("상품후기삭제 성공");

              url = "/review/list/" + pro_num + "/" + reviewPage + ".json";

              getPage(url);
            }
          }
        });
      }); // 댓글삭제하기


    }); // Jquery ready


    //댓글목록과 페이징작업.  ajax관련 내용.  https://www.w3schools.com/jquery/jquery_ref_ajax.asp

    let pro_num = ${productVO.pro_num}; // 상품코드
    let reviewPage = 1;
    let url = "/review/list/" + pro_num + "/" + reviewPage + ".json";

    getPage(url);

    function getPage(url) {
      $.getJSON(url, function(data) {

        // data.list,   data.pageMaker
        
        //상품후기목록 출력하는 함수
        printReplyData(data.list, $("#replyList"), $("#replyViewTemplate"));
        // 페이징기능 출력하는 함수
        printReplyPaging(data.pageMaker, $("#replyPaging")); 
      });
    }

      // 댓글목록 출력기능.  replyArr : 댓글목록데이타(json), target : 댓글삽입위치, template: 핸들바 문법이 삽입된 댓글디자인
      function printReplyData(replyArr, target, template){
        let templateObj = Handlebars.compile(template.html());
        let replyHtml = templateObj(replyArr); // 테이블과 댓글데이타가 바인딩된 결과
        target.empty();
        target.append(replyHtml);

      }
      // 페이징 출력기능
      function printReplyPaging(pageMaker, target) {
        
        let pageInfoStr = '<nav aria-label="Page navigation example">';
           pageInfoStr += '<ul class="pagination">';
        
        if(pageMaker.prev) {
          pageInfoStr += '<li class="page-item">';
          pageInfoStr += '<a class="page-link" href="' + (pageMaker.startPage - 1 ) + '" aria-label="Previous">';
          pageInfoStr += '<span aria-hidden="true">&laquo;</span>';
          pageInfoStr += '</a>';  
          pageInfoStr += '</li>';  
        }

        for(let i=pageMaker.startPage; i<= pageMaker.endPage; i++) {
          let currPageClass = (pageMaker.cri.pageNum == i) ? 'active' : '';
          pageInfoStr += '<li class="page-item ' + currPageClass + '"><a class="page-link" href="' + i + '">' + i + '</a></li>';
        }

        if(pageMaker.next) {
          pageInfoStr += '<li class="page-item">';
          pageInfoStr += '<a class="page-link" href="' + (pageMaker.endPage + 1) + '" aria-label="Next">';
          pageInfoStr += '<span aria-hidden="true">&raquo;</span>';
          pageInfoStr += '</a>';
          pageInfoStr += '</li>';
        }

        target.html(pageInfoStr);
      }


  </script>
  
  
    
  </body>
</html>