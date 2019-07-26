d<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.member.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");
MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
$(window).load(function() {
	oEditors = setEditor("memo"); // 에디터 셋팅
});

/* function goSave() {
	// 비밀번호 유효성체크
	if(!validPassword($("#password"))) return false;
	
	oEditors.getById["memo"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	$("#frm").submit();
} */
function goSave() {
	if ($("#email").val() == "") {
		alert("이메일 입력해주세요.");
		$("#email").focus();
		return false;
	}
	
	if ($("#fname").val() == "") {
		alert("성을 입력해주세요.");
		$("#fname").focus();
		return false;
	}
	if ($("#lname").val() == "") {
		alert("이름을 입력해주세요.");
		$("#lname").focus();
		return false;
	}
	if ($("#tel").val() == "") {
		alert("연락처를 입력해주세요.");
		$("#tel").focus();
		return false;
	}
	
	// 비밀번호 유효성체크
	if(!validPassword($("#password"))) return false;
	
	$.ajax ({
		type:'POST',
		url:"/manage/member/emailcheck",
		data:$("[name=frm]").serialize(), //serialize() 직렬로 정렬
		async:false,
		success:function(data) {
			var val = data.trim();
			if (val == "0") {
				$("#emailcheck").val("1");
			} else {
				alert("존재하는 이메일입니다.");
				$("#emailcheck").val("0");
				return false;
			}
		}
	});
	if ($("#emailcheck").val() == "0") {
		return false;
	}


	$("#frm").submit();  
}


</script>

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:999;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
                    //document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr_detail").focus();

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
					<h2>관리자관리 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>관리자 기본 정보</h3>
							<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
								<%
								String[] nameArr = vo.getName().split(",");
								String[] birthdayArr = vo.getBirthday().split(",");
								String[] telArr = vo.getTel().split(",");
								%>
									<tr>
										
										<th scope="row"><label for="">*이름</label></th>
										<td >
											성<input type="text" style="width:50px; height:20px;" id="fname" name="name" value="<%=nameArr[0]%>" title="관리자 이름을 입력해주세요." />	
											이름<input type="text" style="width:80px; height:20px;" id="lname" name="name" value="<%=nameArr[1] %>" title="관리자 이름을 입력해주세요." />										
										</td>
										
									</tr>
									<th scope="row"><label for="">생년월일</label></th>
										<td colspan="3">
											<input type="text" style="width:100px;height:20px;" id="year" name="birthday" value="<%=birthdayArr[0]%>" title="관리자 이름을 입력해주세요.">년</input>
											<input type="text" style="width:50px; height:20px;" id="month" name="birthday" value="<%=birthdayArr[1]%>" title="관리자 이름을 입력해주세요.">월</input>
											<input type="text" style="width:50px; height:20px;" id="day" name="birthday" value="<%=birthdayArr[2]%>" title="관리자 이름을 입력해주세요.">일</input>
										</td>
									
									<!-- <tr>
										<th scope="row"><label for="">*비밀번호</label></th>
										<td>
											<input type="password" style="width:150px; height:20px;"id="password" name="password" value="" title="관리자 이메일을 입력해주세요." />
										</td>
									</tr> -->
									
									<tr>
										<th scope="row"><label for="">*연락처</label></th>
										<td>
											<input type="text" style="width:60px;height:20px;" id="tel1" name="tel" value="<%=telArr[0]%>" > -</input>
											<input type="text" style="width:80px;height:20px;" id="tel2" name="tel" value="<%=telArr[1]%>" > -</input>
											<input type="text" style="width:80px;height:20px;" id="tel3" name="tel" value="<%=telArr[2]%>" ></input>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">주소/우편번호</label></th>
										<td>											
											<input type="text" style="width:200px; height:20px;" id="addr" name="addr" value="<%=vo.getAddr()%>" title="관리자 이름을 입력해주세요." />
											<input type="text" id="zipcode" name="zipcode" value=" <%=vo.getZipcode()%>" title="관리자 이름을 입력해주세요." />
											<input type="button" value="우편번호" id="" name="layer" onclick="sample2_execDaumPostcode()"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상세주소</label></th>
										<td>
											<input type="text" style="width:300px; height:20px;" id="addr_detail" name="addr_detail" value="<%=vo.getAddr_detail()%>" title="관리자 이름을 입력해주세요." />
										</td>
									</tr>
									
									
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="edit">
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="no" id="no" value="<%=param.getNo()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("memberMypage", param, 0)%>"><strong>뒤로</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="#" onclick="goSave();"><strong>수정하기</strong></a>
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
</html>