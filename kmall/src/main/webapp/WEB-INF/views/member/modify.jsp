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
    
            // let reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            let reg_phone = /^((010)-[0-9]{4}-[0-9]{4})$/;
    
            //태그를 참조하는 구문.
            let mem_name = document.getElementById("mem_name");
            let mem_id = document.getElementById("mem_id");
            let mem_phone = document.getElementById("mem_phone");
            let mem_zipcode = document.getElementById("sample2_postcode");
            let mem_addr = document.getElementById("sample2_address");
            let mem_deaddr = document.getElementById("sample2_detailAddress");
    
    
            if(check_validate(mem_name, "이름을 입력하세요.") == false) return false;
            if(reg_validate(reg_name, mem_name, "이름의 형식이 잘못되었습니다.") == false) return false;
    
            if(check_validate(mem_id, "아이디를 입력하세요.") == false) return false;
            if(reg_validate(reg_id, mem_id, "아이디는 알파벳 대소문자, 숫자로 6~12문자로 입력바랍니다.") == false) return false;
    
            if(check_validate(mem_phone, "연락처를 입력하세요.") == false) return false;
            if(reg_validate(reg_phone, mem_phone, "연락처의 형식이 잘못되었습니다.") == false) return false;
    
            if(check_validate(mem_zipcode, "우편번호를 입력하세요.") == false) return false;
            if(check_validate(mem_addr, "기본주소를 입력하세요.") == false) return false;
            if(check_validate(mem_deaddr, "나머지주소를 입력하세요.") == false) return false;

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
    
    .check_but{
    height: 30px;
    width: 150px;
    background-color: #e8e8e8;
    border: 2px solid white;
    } 
    
    </style>
    
        <script>
    
    	let plz = '${plz}';
    	if(plz == 'failPW') {
    		alert("비밀번호를 확인하세요.");
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

	<section>
	
		<form method="post"  action="/member/modify" onsubmit="return sendit();" >
        <div class="container">
    <div class="update">
    	<h1>정보 수정 </h1>
        <table>

    <tr>
        <td class="col1">이름</td>
        <td class="col2"><input type="text" name="mem_name" id="mem_name" class="join" value="${memberVO.mem_name }" readonly></td>
    </tr>
    <tr>
        <td class="col1">아이디</td>
        <td class="col2">
            <input type="text" name="mem_id" id="mem_id" class="join" value="${memberVO.mem_id }" readonly>
        </td>
    </tr>
    <tr>
        <td class="col1">비밀번호</td>
        <td class="col2">
            <input type="password" name="mem_password" id="mem_password" class="join" placeholder="비밀번호를 입력하세요.">
        </td>
    </tr>
    <tr>
        <td class="col1">연락처</td>
        <td class="col2"><input type="text" class="join" name="mem_phone" id="mem_phone" value="${memberVO.mem_phone }"></td>
    </tr>
    <tr>
        <td class="col1">이메일</td>
        <td class="col2">
			<input type="email" class="join" name="mem_email" id="mem_email" placeholder="you@example.com" value="${memberVO.mem_email }">
        </td>
    </tr>
    <tr>
    	<td class="col1">우편번호</td>
    	<td class="col2">
    	<input type="text" class="join" name="mem_zipcode" id="sample2_postcode" value="${memberVO.mem_zipcode }">
    	<button type="button" onclick="sample2_execDaumPostcode()" class="check_but">우편번호 찾기</button>
    	</td>
    </tr>
    <tr>
    	<td class="col1">주소</td>
    	<td class="col2">
    	<input type="text" class="join" name="mem_addr" id="sample2_address" placeholder="서울특별시 강남구" value="${memberVO.mem_addr }">
    	<input type="text" class="join" name="mem_deaddr" id="sample2_detailAddress" placeholder="상세주소를 입력해주세요." value="${memberVO.mem_deaddr }">
        <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
    	</td>
    </tr>
    
    

    </table>
    
</div>

    <div class="create">
    	<button type="submit" class="but" id="" >수정 완료</button>
	    <button type="button" class="but" data-toggle="modal" data-target="#deleteModal">회원 탈퇴</button>
        <button type="button" class="but" data-toggle="modal" data-target="#pwchangeModal">비밀번호 변경</button>
    </div>
  </div>
  </form>
  
  
			
    </section>
    <hr class="featurette-divider">

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- Modal -->
<div class="modal fade" id="pwchangeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="mem_password">기존비밀번호</label>
              <input type="password" class="form-control" id="old_mem_password">
            </div>
            <div class="col-md-4 mb-3">
              <label for="mem_password">신규비밀번호</label>
              <input type="password" class="form-control" id="new_mem_password">
            </div>
            <div class="col-md-4 mb-3">
              <label for="mem_password">비밀번호확인</label>
              <input type="password" class="form-control" id="re_mem_password">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="btn_pwchange">변경하기</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="mem_password">비밀번호</label>
              <input type="password" class="form-control" id="mem_password">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="btn_delete">탈퇴하기</button>
        </div>
      </div>
    </div>
  </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->

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

    // 회원수정정보 전송
   /* $("#btn_modify").click(function() {
    	

        let modifyForm = $("#modifyForm");
        


        // 자바스크립트 유효성검사 코드작업

        modifyForm.submit();
    });
*/
    $("#btn_pwchange").click(function() {

        if($("#new_mem_password").val() != $("#re_mem_password").val()) {
            alert("신규비번이 일치하지 않습니다.");
            return;
        }

        $.ajax({
        url: '/member/pwchange',
        type: 'post',
        data: {old_mem_password : $("#old_mem_password").val(), new_mem_password : $("#new_mem_password").val()},
        dataType: 'text',
        success: function(result) {
            if(result == "success") {
                alert("비밀번호 변경이 되었습니다.");
                $("#old_mem_password").val('');
                $("#new_mem_password").val('');
                $("#re_mem_password").val('');

                $('#pwchangeModal').modal('hide')
            }else if(result == "failPW") {
                alert("기존비밀번호가 틀립니다. \n확인바랍니다.");
                $("#old_mem_password").val('');
                $("#old_mem_password").focus();
            }
        }
        });
    });

      //회원탈퇴하기
    $("#btn_delete").click(function() {
        $.ajax({
            url: '/member/delete',
            type: 'post',
            data: {mem_password : $("#mem_password").val()},
            dataType: 'text',
            success: function(result) {
            if(result == "success") {
                alert("회원탈퇴 처리가 되었습니다.");
                $('#deleteModal').modal('hide');

            location.href = "/";

            }else if(result == "failPW") {
                alert("기존비밀번호가 틀립니다. \n확인바랍니다.");
                $("#mem_password").val('');
                $("#mem_password").focus();
            }
            }
        });
    });

}); // jquery ready event end
    
</script>
  </body>
</html>
