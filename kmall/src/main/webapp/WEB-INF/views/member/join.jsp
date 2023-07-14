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
  
      <script>
        function sendit() {
    
            //아이디, 비밀번호 영문대소문구분, 숫자사용, 길이 6~12 제한.
            let reg_name = /^[가-힣]{2,6}/;
            let reg_id = /^[a-zA-Z0-9]{6,12}$/;
            let reg_pw = /^[a-zA-Z0-9]{6,12}$/;
    
            // let reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            let reg_phone = /^((010)-[0-9]{4}-[0-9]{4})$/;
    
            //태그를 참조하는 구문.
            let mem_name = document.getElementById("mem_name");
            let mem_id = document.getElementById("mem_id");
            let mem_password = document.getElementById("mem_password");
            let mem_repassword = document.getElementById("mem_repassword");
            let mem_phone = document.getElementById("mem_phone");
            let mem_zipcode = document.getElementById("sample2_postcode");
            let mem_addr = document.getElementById("sample2_address");
            let mem_deaddr = document.getElementById("sample2_detailAddress");
    
    
            if(check_validate(mem_name, "이름을 입력하세요.") == false) return false;
            if(reg_validate(reg_name, mem_name, "이름의 형식이 잘못되었습니다.") == false) return false;
    
            if(check_validate(mem_id, "아이디를 입력하세요.") == false) return false;
            if(reg_validate(reg_id, mem_id, "아이디는 알파벳 대소문자, 숫자로 6~12문자로 입력바랍니다.") == false) return false;
    
            if(check_validate(mem_password, "비밀번호를 입력하세요.") == false) return false;
            if(reg_validate(reg_pw, mem_password, "비밀번호는 알파벳 대소문자, 숫자로 6~12문자로 입력바랍니다.") == false) return false;
    
            if(check_validate(mem_repassword, "비밀번호를 입력하세요.") == false) return false;
            if(mem_password.value != mem_repassword.value) {
                alert("비밀번호가 다릅니다.")
                mem_repassword.focus();
                return false;
            }
    
            if(check_validate(mem_phone, "연락처를 입력하세요.") == false) return false;
            if(reg_validate(reg_phone, mem_phone, "연락처의 형식이 잘못되었습니다.") == false) return false;
    
            if(check_validate(mem_zipcode, "우편번호를 입력하세요.") == false) return false;
            if(check_validate(mem_addr, "기본주소를 입력하세요.") == false) return false;
            if(check_validate(mem_deaddr, "나머지주소를 입력하세요.") == false) return false;
    
            alert("회원가입을 축하합니다!")
    
            return true;
    
        }
    
            // 필드의 공백체크 함수
            /*
            target_id : 입력양식 필드태그를 참조하는 변수
            msg : 입력필드 양식에 맞는 메세지
            */
            function check_validate(target_id, msg){
            if(target_id.value == "") {
                alert(msg);
                target_id.focus();
                return false;
            }
            // return true;
            }
    
            // 정규식 검사 함수
            /*
            reg_ex : 입력양식의 값을 검사하는 정규식 변수
            target_id : 입력양식 필드태그를 참조하는 변수
            msg : 입력필드 양식에 맞는 메세지
            */
            function reg_validate(reg_ex, target_id, msg) {
            if(reg_ex.test(target_id.value) == false) {
                alert(msg);
                target_id.focus();
                return false;
            }
            return true;
            }
        
    </script>

    <style>
    input.join{
    	width : 275px;
    }
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
      
      
        <style type="text/css">
    
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
 
    table{
    height: 300px;
    width: 800px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
 
    td{
    border-bottom: 1px dotted black;
    }
 
    h1{
    text-align: center;
    font-weight: bold;
    color:#000;
    margin:10px auto;
    }
 
    .col1 {
    background-color: #e8e8e8;
    padding: 10px;
    text-align: center;
    font-weight: bold;
    width:150px;
    }
 
    .col2 {
    text-align: left;
    padding: 10px;
    }

    .but{
    height: 35px;
    width: 150px;
    background-color: #e8e8e8;
    border: 2px solid white;
    }
    
    .check_but{
    height: 30px;
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

<section>
	
		<form method="post" id="joinForm" action="/member/join" onsubmit="return sendit();">
        <div class="container">
    <div class="insert">
    <h1>회원가입 </h1>
        <table>
    <tr>
        <td class="col1">이름</td>
        <td class="col2"><input type="text" name="mem_name" id="mem_name" class="join" placeholder="한글 2-6자로 입력하세요."></td>
    </tr>
    <tr>
        <td class="col1">아이디</td>
        <td class="col2">
            <input type="text" name="mem_id" id="mem_id" maxlength="10" class="join" placeholder="알파벳 , 숫자 6-12자로 입력하세요.">
            <button type="button" id="btn_IdCheck" class="check_but">중복체크</button>
        </td>
    </tr>
    <tr>
        <td class="col1">비밀번호</td>
        <td class="col2">
            <input type="password" name="mem_password" id="mem_password" class="join" placeholder="알파벳 , 숫자 6-12자로 입력하세요.">
        </td>
    </tr>
    <tr>
        <td class="col1">비밀번호 확인</td>
        <td class="col2"><input type="password" name="mem_repassword" id="mem_repassword" class="join" placeholder="알파벳 , 숫자 6-12자로 입력하세요."></td>
    </tr>
    <tr>
        <td class="col1">연락처</td>
        <td class="col2"><input type="text" class="join" name="mem_phone" id="mem_phone" placeholder="-를 포함하여 입력하세요"></td>
    </tr>
    <tr>
        <td class="col1">이메일</td>
        <td class="col2">
			<input type="email" class="join" name="mem_email" id="mem_email" placeholder="you@example.com">
        	<button type="button" class="check_but" id="btn_authcode">인증코드요청</button>
        </td>
    </tr>
    <tr>
        <td class="col1">인증코드</td>
        <td class="col2">
			<input type="email" class="join" name="email_auth_code" id="email_auth_code">
            <button type="button" class="check_but" id="btn_confirmAuthcode">인증확인</button>
        </td>
    </tr>
    <tr>
    	<td class="col1">우편번호</td>
    	<td class="col2">
    	<input type="text" class="join" name="mem_zipcode" id="sample2_postcode" placeholder="우편번호를 입력하세요.">
    	<button type="button" onclick="sample2_execDaumPostcode()" class="check_but">우편번호 찾기</button>
    	</td>
    </tr>
    <tr>
    	<td class="col1">주소</td>
    	<td class="col2">
    	<input type="text" class="join" name="mem_addr" id="sample2_address" placeholder="서울특별시 강남구">
    	<input type="text" class="join" name="mem_deaddr" id="sample2_detailAddress" placeholder="상세주소를 입력하세요.">
        <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
    	</td>
    </tr>
    
    

    </table>
    
  </div>
 
  <div class="create">
      	<button type="button" class="but" id="btn_back" >뒤로 가기</button>
    	<button type="button" class="but" id="btn_join" >가입 완료</button>
  </div>
  </div>
  </form>
			
    </section>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }  
</script>


<script>

    $(document).ready(function(){

      let idCheck = false;
      let isAuthcode = false;

      $("#btn_IdCheck").click(function() {

        if($("#mem_id").val() == "") {
          alert("아이디를 입력하세요.");
          $("#mem_id").focus();
          return;
        }

        $.ajax({
          url: '/member/idCheck',
          type: 'get',
          dataType: 'text',
          data: {mem_id : $("#mem_id").val()},
          success: function(result) {

            if(result == "yes") {
              alert("사용 가능한 아이디 입니다.");
              idCheck = true;
            }else {
              alert("이미 존재하는 아이디 입니다.");
              $("#mem_id").val("");
              $("#mem_id").focus();
            }        
            
          }
        });
      });

      $("#btn_authcode").click(function(){
        if($("#mem_email").val() == "") {
          alert("메일주소를 입력하세요.");
          $("#mem_email").focus();
          return;
        }

        $.ajax({
          url: '/email/send',
          type: 'get',
          dataType: 'text',
          data: {receiverMail : $("#mem_email").val() },
          success : function(result) {
            if(result == "success") {
              alert("인증메일이 발송되었습니다. 메일 확인해주세요.");
            }
          }
        });
      });

      $("#btn_confirmAuthcode").click(function() {
        if($("#email_auth_code").val() == "") {
          alert("인증코드를 입력하세요.");
          $("#email_auth_code").focus();
          return;
        }

        $.ajax({
          url: '/email/confirmAuthcode',
          type: 'get',
          dataType: 'text',
          data: {authCode : $("#email_auth_code").val() },
          success : function(result) {
            if(result == "success") {
              alert("인증코드가 확인 되었습니다.");
              isAuthcode = true;
            }else if(result == "fail") {
              alert("인증코드가 다릅니다. 인증코드 요청을 다시 해주세요.");   
            }
          }
        });
      });


      $("#btn_join").click(function() {
        let joinForm = $("#joinForm");

        joinForm.submit();
      });
      
      $("#btn_back").click(function(){
    	  location.href = "/member/login";
      });

    });
    
</script>
  </body>
</html>
