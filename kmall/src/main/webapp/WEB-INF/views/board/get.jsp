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
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
 
    h3{
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
  <%@ include file="/WEB-INF/views/product/include/categoryMenu.jsp" %>
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
            <!-- Modify or Delete 클릭시 사용 -->
            <form id="operForm" action="/board/modify" method="get">
              <input type="hidden" name="boa_bno" value='<c:out value="${board.boa_bno }" />' />
              <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />' />
              <input type="hidden" name="amount" value='<c:out value="${cri.amount }" />' />
              <input type="hidden" name="type" value='<c:out value="${cri.type }" />' />
              <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />' />
            </form>
            <!-- form start -->
            <form role="form" method="post" action="/board/insert">
              <div class="box-body">
              	<div class="form-group">
                  <input type="hidden" class="form-control" id="boa_bno" name="boa_bno" value='<c:out value="${board.boa_bno }" />' readonly>
                </div>
                <div class="form-group row">
                  <div class="col-md-6">
                  	<label for="boa_title">Title</label>
                  <input type="text" class="form-control" id="boa_title" name="boa_title" value='<c:out value="${board.boa_title }" />' readonly>
                  </div>
                  <div class="col-md-6">
                  	<label for="mem_id">Writer</label>
                  <input type="text" class="form-control" id="mem_id" name="mem_id" value='<c:out value="${board.mem_id }" />' readonly>
                  </div>                 
                </div>
                <div class="form-group">
                  <label for="boa_content">Content</label>
                  <textarea class="form-control" rows="3" id="boa_content" name="boa_content" readonly><c:out value="${board.boa_content }" /></textarea>
                </div>
                <div class="form-group row">
                  <div class="col-md-6">
                  	<label for="boa_regdate">Regdate</label>
                  <input type="text" class="form-control" id="boa_regdate" name="boa_regdate" value='<fmt:formatDate value="${board.boa_regdate }" pattern="yyyy-MM-dd HH:mm"/>' readonly>
                  </div>
                  <div class="col-md-6">
                  	<label for="boa_updatedate">Updatedate</label>
                  <input type="text" class="form-control" id="boa_updatedate" name="boa_updatedate" value='<fmt:formatDate value="${board.boa_updatedate }" pattern="yyyy-MM-dd HH:mm"/>' readonly>
                  </div>                 
                </div>                
              </div>
              <!-- /.box-body -->

              <div class="box-footer row">
              	<div class="col-md-12">
              	<c:if test="${board.mem_id eq sessionScope.loginStatus.mem_id}">
              		<button type="button" id="btn_modify" class="btn btn-primary">Modify</button>
                	<button type="button" id="btn_delete" class="btn btn-primary">Delete</button>
              	</c:if>
              	</div>
              </div>
              
            </form>
          </div>
        	
        	</div>
        	</div>
        	
        </div>
        <div class="container"  style="margin-top:50px">
        		    <div class="row">
		      <div class="col-md-12">
		        <!--<form role="form">-->
		          <div class="box-body">
		            <div class="form-group row">
		              <div class="col-md-8">
		                <input type="text" class="form-control" id="brv_content" placeholder="댓글을 입력하세요.">
		              </div>
		              <div class="col-md-4">
		                <button type="button" id="btn_review_write" class="btn btn-primary">등록</button>
		              </div>  
		            </div>
		          </div>
		        <!--</form>-->
		      </div>
		    </div>
        </div>
    </section>
    	<div class="container">
    		<div id="replyList"></div>
		    <!-- 페이징 출력되는 위치 -->
		    <div id="replyPaging"></div>
    	</div>
<!-- 1)Include Handlebars from a CDN -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<!-- 2)handlebars template. 댓글UI -->
<script id="replyViewTemplate" type="text/x-handlebars-template">
  <table class="table">
    <tbody><tr style="height:10px">
              <th style="width: 100px">작성자</th>
              <th style="width: 250px">내용</th>
              <th style="width: 100px">날짜</th>
              <th style="width: 150px">비고</th>
          </tr>
    {{#each .}}
    <tr>
      <td>{{mem_id}}</td>
      <td>{{brv_content}}</td>
      <td>{{convertDate brv_regdate}}</td>
      <td>
 		{{authority mem_id brv_num}}
      </td>
    </tr>
    {{/each}}
  </table>
</script>

<script>
	// 날짜데이터가 json으로 변환되어, 밀리세컨드 단위로 된것을 다시 날짜로 변환작업.
	Handlebars.registerHelper("convertDate", function(timeValue) {
	  const date = new Date(timeValue);
	
	  return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
	})
	
	
  Handlebars.registerHelper("authority", function(mem_id, boa_bno) {
    let str = "";
    let login_id = '${sessionScope.loginStatus.mem_id}';
    if(mem_id == login_id) {
      str += "<button type='button' class='btn btn-link' name='btn_re_edit' data-boa_bno='" + boa_bno + "'>수정</button>";
      str += "<button type='button' class='btn btn-link' name='btn_re_delete' data-boa_bno='" + boa_bno + "'>삭제</button>";
    }

    return new Handlebars.SafeString(str);
  })
</script>
    


    <!-- /END THE FEATURETTES -->

<!-- /.container -->
    <hr class="featurette-divider">
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

  </body>
  
  <script>
  $(document).ready(function() {

      let operForm = $("#operForm");

      //삭제 클릭시
      $("#btn_delete").on("click", function() {
        
        if(!confirm("삭제 하시겠습니까?")) return;
        
        operForm.attr("action", "/board/delete");
        operForm.submit();
      });

      //수정 클릭시
      $("#btn_modify").on("click", function(){
        operForm.attr("action", "/board/modify");
        operForm.submit();
      });

     // 동적으로 추가된 태그를 click 이벤트 설정시 하는 작업
      $("#replyPaging").on("click", "li a", function(e) {
          e.preventDefault(); // 링크기능 취소.

          // 선택한 댓글 페이지번호.
          reviewPage = $(this).attr("href");
          url = "/review/list/" + boa_bno + "/" + reviewPage + ".json";
          getPage(url); // 스프링에서 댓글번호에 해당하는 댓글데이타 가져오기.
      });

      // 댓글쓰기
      $("#btn_review_write").on("click", function() {
        let brv_content = $("#brv_content").val();

        if(brv_content == "") {
          alert("댓글을 입력하세요");
          return;
        }

        let boardReviewData = JSON.stringify({boa_bno: ${board.boa_bno}, brv_content: brv_content});

        $.ajax({
          type: 'post',
          url: '/boardreview/new',  // 매핑주소의 컨트롤러 클래스가 @RestController 이므로, 전송데이타를 JSON 형식으로 사용.
          headers: {
            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"
          },
          dataType: 'text', // 스프링 메서드의 리턴타입
          data: boardReviewData, // 서버로 보내는 JSON데이타.
          success: function(result) {
            if(result == "success") {
              alert("댓글이 등록되었습니다.");
              $("#brv_content").val("");

              reviewPage = 1;
              url = "/boardreview/list/" + boa_bno + "/" + reviewPage + ".json";

              getPage(url);
            }
          }
        });
      });


      // 댓글 수정폼
      $("div#replyList").on("click", "button[name='btn_re_edit']",function() {

        let cur_tr = $(this).parent().parent(); // 선택한 edit버튼의 현재 tr

        let brv_num = cur_tr.children().eq(0).text();

        let brv_content = cur_tr.children().eq(2).text();
        let mem_id = cur_tr.children().eq(3).text();
        let brv_regdate = cur_tr.children().eq(4).text();

        // Edit버튼이 선택된 tr의 td를 모두 삭제한다.
        cur_tr.empty();

        let brv_num_str = "<td><input type='text' id='edit_brv_num' value='" + brv_num + "' readonly></td>";
        let brv_content_str = "<td><input type='text' id='edit_brv_content' value='" + brv_content + "'></td>";
        let mem_id_str = "<td>" + mem_id + "</td>";
        let brv_regdate_str = "<td>" + brv_regdate + "</td>";

        let btn_str = "<td><button type='button' id='btn_re_cancel' class='btn btn-link'>취소</button>";
        btn_str += "<button type='button' id='btn_re_register' class='btn btn-link'>수정</button></td>";
     

        cur_tr.append(brv_num_str, brv_content_str, mem_id_str, brv_regdate_str, btn_str);

      });
      
      // 댓글 수정하기
      $("div#replyList").on("click", "#btn_re_register", function() {
        let edit_brv_num = $("#edit_brv_num").val();
        let edit_brv_content = $("#edit_brv_content").val();

        let boardReviewData = JSON.stringify({brv_num: edit_brv_num, brv_content: edit_brv_content});

        $.ajax({
          type: 'patch',
          url: '/boardreview/modify/',
          headers: {
            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "PATCH"
          },
          data: 'text',
          data: boardReviewData,
          success: function(result) {
            if(result == "success") {
              alert("댓글이 수정되었습니다.");

              url = "/boardreview/list/" + boa_bno + "/" + reviewPage + ".json";

              getPage(url);
            }
          }
        });
      }); // 댓글수정하기

      // 댓글 수정 취소하기
      $("div#replyList").on("click", "#btn_re_cancel",function() {
        

        let cur_tr = $(this).parent().parent();
        let edit_brv_num = cur_tr.children().eq(0).find("#edit_brv_num").val();
        let edit_star = cur_tr.children().eq(1).html();
        let edit_brv_content = cur_tr.children().eq(2).find("#edit_brv_content").val();
        let edit_mem_id = cur_tr.children().eq(3).text();
        let edit_brv_regdate = cur_tr.children().eq(4).text();

        let edit_brv_num_str = "<td>" + edit_brv_num + "</td>";
        let edit_star_str = "<td>" + edit_star + "</td>";
        let edit_brv_content_str = "<td>" + edit_brv_content + "</td>";
        let edit_mem_id_str = "<td>" + edit_mem_id + "</td>";
        let edit_brv_regdate_str = "<td>" + edit_brv_regdate + "</td>";

        let btn_str = "<td><button type='button' data-brv_num=" + edit_brv_num + " name='btn_re_edit' class='btn btn-link'>Edit</button>";
        btn_str += "<button type='button' data-brv_num=" + edit_brv_num + " name='btn_re_delete' class='btn btn-link'>Delete</button></td>";
        
        cur_tr.empty();


        cur_tr.append(edit_brv_num_str, edit_star_str, edit_brv_content_str, edit_mem_id_str, edit_brv_regdate_str, btn_str); // 원래상태로 복구.

      });


      // 댓글 삭제하기
      $("div#replyList").on("click", "button[name='btn_re_delete']",function() {

        if(!confirm("댓글을 삭제 하시겠습니까?")) return;

        $.ajax({
          type: 'delete',
          url: '/boardreview/delete/' + $(this).data("brv_num"),
          headers: {
            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "DELETE"
          },
          data: 'text',
          success: function(result) {
            if(result == "success") {
              alert("댓글이 삭제되었습니다.");

              url = "/boardreview/list/" + boa_bno + "/" + reviewPage + ".json";

              getPage(url);
            }
          }
        });
      }); // 댓글삭제하기


    }); // Jquery ready


    //댓글목록과 페이징작업.  ajax관련 내용.  https://www.w3schools.com/jquery/jquery_ref_ajax.asp

    let boa_bno = ${board.boa_bno};
    let reviewPage = 1;
    let url = "/boardreview/list/" + boa_bno + "/" + reviewPage + ".json";

    getPage(url);

    function getPage(url) {
      $.getJSON(url, function(data) {
        
        // 댓글목록을 출력하는 함수
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
</html>
