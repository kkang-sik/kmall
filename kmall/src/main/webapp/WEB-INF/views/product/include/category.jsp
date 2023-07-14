<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>움직이는 메뉴바</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>

<style>
/* 스타일 코드는 동일하게 유지합니다. */
</style>

<body>
  <div class="sidebar">
    <ul>
      <li><a href="#" id="menu1">메뉴1</a>
        <ul class="submenu">
          <li><a href="#">하부 메뉴1-1</a></li>
          <li><a href="#">하부 메뉴1-2</a></li>
          <li><a href="#">하부 메뉴1-3</a></li>
        </ul>
      </li>
      <li><a href="#">메뉴2</a></li>
      <li><a href="#">메뉴3</a></li>
      <li><a href="#">메뉴4</a></li>
    </ul>
  </div>
  <div class="content">
    <!-- 내용을 여기에 추가하세요 -->
  </div>

  <script>
    // 메뉴1을 클릭하면 하부 메뉴 토글
    var menu1 = document.getElementById('menu1');
    var submenu1 = document.querySelector('.sidebar li:nth-child(1) .submenu');

    menu1.addEventListener('click', function(e) {
      e.preventDefault(); // 기본 동작 막기
      submenu1.style.display = (submenu1.style.display === 'none') ? 'block' : 'none';
    });
  </script>
</body>
</html>
