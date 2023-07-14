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
    
     td{
    border-bottom: 1px dotted black;
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
	<h2>게시판</h2>
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
        <div class="container">
        <div class="row">
        	<div class="col-md-12">
        	
        		<div class="box">
            <div class="box-header with-border">
              <form id="searchForm" action="/board/list" method="get">
                <div class="form-group">
                  <select name="type">
                    <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----</option>
                    <option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }" />>제목</option>
                    <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>내용</option>
                    <option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }" />>작성자</option>
                    <option value="A" <c:out value="${pageMaker.cri.type eq 'A'? 'selected':'' }" />>카테고리별</option>
                    <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }" />>제목 or 내용</option>
                    <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }" />>제목 or 작성자</option>
                    <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }" />>제목 or 작성자 or 내용</option>
                  </select>
                  <input type="text" name="keyword" placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword }" />'>
                  <input type="hidden" name="pageNum" value="1">
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                  <button type="submit"  class="btn btn-success">Search</button>
			      <button type="button" class="btn btn-primary" style="float:right">글쓰기</button>
                </div>
              </form>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody><tr>
                  <th style="width: 100px">글번호</th>
                  <th style="width: 100px">분류</th>
                  <th style="width: 250px">제목</th>
                  <th style="width: 100px">작성자</th>
                  <th style="width: 150px">작성일</th>
                </tr>
                <c:forEach items="${boardList }" var="board">
                <tr>
                  <td><c:out value="${board.boa_bno }"></c:out></td>
                  <td><c:out value="${board.boa_category }"></c:out></td>
                  <td>
                    <a class="move" href="${board.boa_bno }"><c:out value="${board.boa_title }" ></c:out></a>
                  </td>
                  <td><c:out value="${board.mem_id }"></c:out></td>
                  <td><fmt:formatDate value="${board.boa_regdate }" pattern="yyyy-MM-dd HH:mm"/></td>
                </tr>
                </c:forEach>
              </tbody></table>
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
              <form id="actionForm" action="/board/list" method="get">
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
    </section>
    
    

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

<!-- /.container -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>

$(document).ready(function() {

    let actionForm = $("#actionForm"); // 페이징정보가 있는 form태그. Criteria클래스 필드정보

    // 리스트(목록)에서 제목 클릭
    $("a.move").on("click", function(e) {
      e.preventDefault(); // a태그의 하이퍼링크 기능이 취소.

      let boa_bno = $(this).attr("href");

      //location.href = "/board/get?boa_bno=" + boa_bno;

      actionForm.find("input[name='boa_bno']").remove();
      actionForm.append("<input type='hidden' name='boa_bno' value='" + boa_bno + "'>");
      actionForm.attr("action", "/board/get");

      actionForm.submit();

    });

    // 페이지 번호, 이전, 다음 클릭시 actionForm 태그가 전송으로 사용된다.(중요)
    //페이지번호, 이전, 다음 클릭    <ul class="pagination.  
    $("ul.pagination a").on("click", function(e) {
      e.preventDefault(); // a태그의 하이퍼링크 기능이 취소.

      // /board/list?pageNum=선택한페이지번호&amount=10

      // 현재 페이지번호 변경작업
      // form태그의 정보  
      // <input type="hidden" name="pageNum" value="1">
      // <input type="hidden" name="amount" value="10">
      actionForm.attr("action", "/board/list");
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));

      actionForm.submit();
    });
    
    $(".btn.btn-primary").on("click", function() {
    	
        location.href = "/board/insert/";
        
    });
    
  });
  

</script>

  </body>
</html>
