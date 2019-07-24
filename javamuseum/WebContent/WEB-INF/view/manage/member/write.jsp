<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.member.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
$(function() {
	
	$("#idCheckBtn").click(function(){
		if($("#id").val() == "") {
			alert("아이디를 입력하세요.");
		} else {
		$.ajax ({
			type:'POST',
			url:"/manage/member/idcheck",
			data:$("[name=frm]").serialize(),
			async:false,
			success:function(data) {
				var val = data.trim();
				if (val == "0") {
					alert("사용가능한 아이디입니다.");
					$("#idcheck").val("1");
					$("#id").attr("readonly", "readonly");
				} else {
					alert("존재하는 아이디입니다.");
					$("#id").val("");
					$("#idcheck").val("0");
					$("#id").focus();
					return false;
				}
			}
		});
		}
	});
	$("#id").keyup(function(){
		console.log($("#id").val())
		$.ajax ({
			type:'POST',
			url:"/manage/member/idcheck",
			data:$("[name=frm]").serialize(),
			async:false,
			success:function(data) {
				var val = data.trim();
				if (val == "0" && $("#id").val() != "") {
					$("#idText").show();
					$("#idText").text("사용가능");
					$("#idText").css("color", "#0000FF");
				} else if ($("#id").val() == "") {
					$("#idText").hider();
				} else {
					$("#idText").show();
					$("#idText").text("사용불가능");
					$("#idText").css("color", "red");
				}
			}
		});
	});
	
	$("input").keyup(function(){
            var pwd1=$("#password").val();
            var pwd2=$("#pwdconfirm").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                	$("#pwdconfirmText").text("비밀번호가 일치합니다");
					$("#pwdconfirmText").css("color", "#0000FF");
				} else {
					$("#pwdconfirmText").text("비밀번호가 일치하지 않습니다");
					$("#pwdconfirmText").css("color", "red");
                }    
            }
    });
    
	$("#password").keyup(function(){
		var jQuerypass = $("#password").val();
		var jQuerystr = /^[a-zA-Z0-9@]{6,12}$/;
		var jQuerystr2 = /(\w)\1\1\1/;
		var jQuerychk_num = jQuerypass.search(/[0-9]/g);
		var jQuerychk_eng = jQuerypass.search(/[a-z]/ig);
		var check = false;
		if (jQuerypass == "") {
			$("#pwdText").css("color", "red");
		}else if(!jQuerystr.test(jQuerypass) || jQuerypass.indexOf(' ') > -1){
			$("#pwdText").css("color", "red");
		}else if(jQuerystr2.test(jQuerypass)){
			$("#pwdText").css("color", "red");
		}else if(jQuerychk_num < 0 || jQuerychk_eng < 0) {
			$("#pwdText").css("color", "red");
		} else {
			$("#pwdText").css("color", "#0000FF");
		}
	});



});

function goSave() {
	if ($("#name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	if ($("#id").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#id").focus();
		return false;
	}
	if ($("#email").val() == "" || $("#email2").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#email").focus();
		return false;
	}
	if ($("#year").val() == "" || $("#month").val() == 0 || $("#day").val() == "") {
		alert("생년월일을 입력해주세요.");
		$("#year").focus();
		return false;
	}
	if ($("#fTel").val() == "" || $("#mTel").val() == "" || $("#eTel").val() == "") {
		alert("연락처를 입력해주세요.");
		$("#fTel").focus();
		return false;
	}
	
	$.ajax ({
		type:'POST',
		url:"/manage/member/idcheck",
		data:$("[name=frm]").serialize(),
		async:false,
		success:function(data) {
			var val = data.trim();
			if (val == "0") {
				$("#idcheck").val("1");
			} else {
				alert("존재하는 아이디입니다.");
				$("#idcheck").val("0");
				return false;
			}
		}
	});
	if ($("#idcheck").val() == "0") {
		return false;
	}
	
	if ($("#day").val() < 10 && $("#day").val().length == 1) {
		$("#day").val("0" + $("#day").val());
	}
	
	// 비밀번호 유효성체크
	if(!validPassword($("#password"))) return false;
	// 생년월일 유효성체크
	if(!isValidBirth($("#year").val(), $("#day").val())) return false;
	
	
	$("#email2").attr("disabled",false);
	$("#frm").submit();
}


</script>
</head>
<body> 
<%@ include file="/WEB-INF/view/manage/include/common.jsp" %>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/manage/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>회원관리 - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>회원 기본 정보</h3>
							<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="회원 관리 기본내용입니다.">
								<colgroup>
									<col width="25%" />
									<col width="75%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">*이름</label></th>
										<td>
											<input type="text" id="name" name="name" value="" title="회원 이름을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*성별</label></th>
										<td>
											<select name="gender">
												<%=CodeUtil.getGenderOption(0) %>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*생년월일</label></th>
										<td>
											<input type="text" id="year" name="year" maxlength="4" placeholder="년(4자리)" value="" onKeyup="onlyNumber(this)"/>
											
											<select style="width:100px;margin-right:10px" name="month" id="month"> 
												 <option value="0">월</option> 
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											 </select>&nbsp
											<input type="text" id="day" name="day" maxlength="2" placeholder="일" value="" onKeyup="onlyNumber(this)"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*이메일</label></th>
										<td>
											 <input type="text" name="email" id="email" style="width:100px" value="">
											 @ 
											 <input type="text" name="email2" id="email2" style="width:100px;" disabled value="naver.com"> 
											 <select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
												 <option value="1">직접입력</option> 
												 <option value="naver.com" selected>naver.com</option> 
												 <option value="hanmail.net">hanmail.net</option> 
												 <option value="hotmail.com">hotmail.com</option> 
												 <option value="nate.com">nate.com</option> 
												 <option value="yahoo.co.kr">yahoo.co.kr</option> 
												 <option value="gmail.com">gmail.com</option>
											 </select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*연락처</label></th>
										<td>
											<input type="text" id="fTel" name=fTel value="" maxlength="4" placeholder="처음(3~4자리)" onKeyup="onlyNumber(this)"/>
											<input type="text" id="mTel" name=mTel value="" maxlength="4" placeholder="중간(4자리)" onKeyup="onlyNumber(this)"/>
											<input type="text" id="eTel" name=eTel value="" maxlength="4" placeholder="끝(4자리)" onKeyup="onlyNumber(this)"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*주소</label></th>
										<td>
											<input type="text" id="zipcode" name="zipcode" placeholder="우편번호">
											<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="addr1"  name="addr1" placeholder="주소" style="width: 600px"><br>
											<input type="text" id="addr2" name="addr2" placeholder="상세주소를 입력하세요" style="width: 600px">
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*아이디</label></th>
										<td>
											<input type="text" id="id" name="id" value="" title="회원 아이디를 입력해주세요." />
											<input type="button" value="아이디 중복체크" id="idCheckBtn">
											<span id="idText"></span>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*비밀번호</label></th>
										<td>
											<input type="password" id="password" name="password" value="" title="회원 비밀번호를 입력해주세요." />
											<span id="pwdText">(영문, 숫자가 포함된 6~12자리)</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*비밀번호확인</label></th>
										<td>
											<input type="password" id="pwdconfirm" name="pwdconfirm" value=""/>
											<span id="pwdconfirmText"></span>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="idcheck" id="idcheck" value="0"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="#" onclick="goSave();"><strong>저장</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript"> 
//이메일 입력방식 선택
$('#selectEmail').change(function(){ 
	$("#selectEmail option:selected").each(function () { 
		if($(this).val()== '1'){ //직접입력일 경우
			$("#email2").val(''); //값 초기화
			$("#email2").attr("disabled",false); //활성화
			}else{ //직접입력이 아닐경우
				$("#email2").val($(this).text()); //선택값 입력
				$("#email2").attr("disabled",true); //비활성화
				} 
		}); 
	}); 
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
                
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
                    document.getElementById("addr1").value = addr + extraAddr;
                
                } else {
                    document.getElementById("addr1").value = addr + '';
                }
            }
        }).open();
    }
</script>


</html>