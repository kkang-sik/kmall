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
    </style>
<script>

let msg = '${msg}';
if(msg == 'modify') {
	alert("수정되었습니다.");
}
</script>
  </head>
  <body>
    
<header>
  <%@ include file="/WEB-INF/views/include/header.jsp" %>
  <%@ include file="/WEB-INF/views/include/nav.jsp" %>
  
</header>
  

  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
<img class="bd-placeholder-img rounded-circle" width="140" height="140" src="/image/NAV1.jpg" alt="Placeholder: 140x140" role="img" aria-label="Placeholder: 140x140" />
        <h2>NEW</h2>
        <p>최근 올라온 상품으로 바로 이동합니다!</p>
        <p><a class="btn btn-secondary" href="http://localhost:8081/product/pro_list/8/NEW">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
 <img class="bd-placeholder-img rounded-circle" width="140" height="140" src="/image/NAV2.jpg" alt="Placeholder: 140x140" role="img" aria-label="Placeholder: 140x140" />

        <h2>EVENT</h2>
        <p>진행중인 EVENT를 확인하러 이동합니다!</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
<img class="bd-placeholder-img rounded-circle" width="140" height="140" src="/image/NAV3.jpg" alt="Placeholder: 140x140" role="img" aria-label="Placeholder: 140x140" />

        <h2>HOT</h2>
        <p>주문량이 많은 상품으로 바로 이동합니다!</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">안녕하세요!</h2>
        <p class="lead">KMALL에 오신것을 환영합니다.</p>
      </div>
      <div class="col-md-5">
<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="/image/home1.jpg" alt="Placeholder: 500x500">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">최선을 다하겠습니다!</h2>
        <p class="lead">항상 최선을 다하여 성장하는 인재가 되도록 노력하겠습니다.</p>
      </div>
      <div class="col-md-5 order-md-1">
<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="/image/home2.jpg" alt="Placeholder: 500x500">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">감사합니다!</h2>
        <p class="lead">저의 포트폴리오를 확인해주셔서 감사합니다.</p>
      </div>
      <div class="col-md-5">
<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="/image/home3.jpg" alt="Placeholder: 500x500">
      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


<%@ include file="/WEB-INF/views/include/footer.jsp" %>

  </body>
</html>
