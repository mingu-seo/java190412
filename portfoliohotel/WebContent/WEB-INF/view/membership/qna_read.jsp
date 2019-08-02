<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("param");
/* MemberVO member_vo = (MemberVO)session.getAttribute("memberInfo"); */
QnaVO data = (QnaVO) request.getAttribute("data");
%>
<!DOCTYPE html>

<html lang="ko">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/function.js"></script> 
<script type="text/javascript">
function goPassword(){
	$("#editBtn1").click(function(){
		$("#PwCheckBtn").show()
		$("#editBtn2").show()
		$("#editBtn1").hide()
		$("#password").focus();
	});	
}
function goEdit(){
	if($("#password").val()==""){
		alert("비밀번호를 입력해주세요")
		$("#password").focus();
		return false;
	} 
}
	<%-- if($("#password") == <%=data.getPassword()%>){
		console.log(성공)
	} else {
		console.log(실패)
	} --%>
	
	//참이면 돌아감.진행을 멈추고
	
	/*  $.ajax ({		//자바스크립트에서 {}는 객체
		type:'POST',
		url:"/manage/member/idcheck",
		data:$("[name=frm]").serialize(),	//$("[name=frm]") = $("#frm")	//serialize() 직렬화하여 출력하는 메서드
		async:false,		//캐시를 넣으면 안되는 상황이여서 async에 false를 넣은것
		success:function(data) {		//date에는 콜백함수로 내용이 담겨있음.
			var val = data.getPassword();	
			if (val == param.getPassword()) {	
				return true;
			} else {
				alert("비밀번호를 다시 확인해주세요");	//0이아니면 존재하는 것이므로 중복창 출력
				return false;		//값을 돌려주거나 돌아가는 것이 return의 역할
			}
		}
	});
} */

/* $(function(){
	function goEdit(){
		$("#editBtn").click(function(){
			$("#PwCheckBtn").show()
		});
	}
});
 */

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
}
	/* // 비밀번호 유효성체크
	if(!validPassword($("#password"))) return false;
	//참이면 돌아감.진행을 멈추고
	
	 $.ajax ({		//자바스크립트에서 {}는 객체
		type:'POST',
		url:"/manage/member/idcheck",
		data:$("[name=frm]").serialize(),	//$("[name=frm]") = $("#frm")	//serialize() 직렬화하여 출력하는 메서드
		async:false,		//캐시를 넣으면 안되는 상황이여서 async에 false를 넣은것
		success:function(data) {		//date에는 콜백함수로 내용이 담겨있음.
			var val = data.trim();
			if (val == "0") {	
				$("#idcheck").val("1");	//0이면 1로 바꿈
			} else {
				alert("존재하는 아이디입니다.");	//0이아니면 존재하는 것이므로 중복창 출력
				$("#idcheck").val("0");
				return false;		//값을 돌려주거나 돌아가는 것이 return의 역할
			}
		}
	});
	if ($("#idcheck").val() == "0") {
		return false;
	}  
	
	$.post("/manage/member/idcheck",$("[name=frm]").serialize(), function (data, status) {
		var val = data.trim();
		if (val == "0") {
			$("#idcheck").val("1");
			r = true;
		} else {
			alert("존재하는 아이디입니다.");
			r = false;
		}
		$("#idcheck").val(data.trim());
	}).fail(function() {   
		alert('아이디체크실패');
		r = false;
	});
	$("#frm").submit();
	 */
/* 	oEditors.getById["memo"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	$("#frm").submit(); */
/* } */




 	/* var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		oEditors = setEditor("contents"); // 에디터 셋팅
		initCal({id:"regdate",type:"day",today:"y",timeYN:"y"});
	}); */
	<%--  
	$(function() {
		$("#delBtn").click(function() {
			goDelete();
		});
	});
		
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "/manage/board/qna/process?no=<%=data.getNo()%>&cmd=delete";
			} else {
				return false;
			}
		}
	function goDelete_reply() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "/manage/board/qna/process?no=<%=data.getNo()%>&cmd=delete_reply";
			} else {
				return false;
			}
		} --%>
	
	
	
	
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/default.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/qna_q.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../js/gnb.js"></script>
    <title>Tree_qna</title>
</head>
<body>
    <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="../index.html"><img src="../img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">BOOK</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="../special_promotion.html">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="../room_offer.html">Room Package</a></li>
                                                <li><a href="../room_offer.html">Dining Package</a></li>
                                                <li><a href="../room_offer.html">Events & Gift</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="room-detail-subpage.html">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="room-detail-subpage.html">Namsan Pool Premier Suite</a></li>
                                                <li><a href="room-detail-subpage.html">Namsan Presidential Suite</a></li>
                                                <li><a href="room-detail-subpage.html">Spa Sanctuary Suite</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Dining</h2>
                                            <ul class="Dining">
                                                <li><a href="#">The Festa</a></li>
                                                <li><a href="#">Granum Dining Lounge</a></li>
                                                <li><a href="#">Moon Bar</a></li>
                                                <li><a href="#">The Oasis Outdoor Kitchen</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Meeting & Wedding</h2>
                                            <ul class="Meeting & Wedding">
                                                <li><a href="#">Meeting</li>
                                                <li><a href="#">Wedding</a></li>
                                                <li><a href="#">Family Party</a></li>
                                            </ul>
                                        </div>
                                    </div>
                            </div>
                    </li>
                    <li class="facilities">
                        <a href="#">Facilities</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box facil-left">
                                                <h2 class="no-line">Facilities</h2>
                                                <ul>
                                                    <li><a href="../facilities.html#f1">The Oasis</a></li>
                                                    <li><a href="../facilities.html#f2">Indoor Swimming Pool</a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                        <li><a href="../facilities.html#f3">Fitness Centre</a></li>
                                                        <li><a href="../facilities.html#f4">Sauna</a></li>
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop facil-right">
                                                
                                                <ul class="Dining">
                                                    <li><a href="#">Troon Golf Academy</a></li>
                                                    <li><a href="#">Foresta Beauty Salon</a></li>
                                                </ul>
                                            </div>
                                        </div>
                            </div>
                        
                    </li>
                    <li>
                        <a href="#">Support</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box">
                                                <h2 class="no-line">Support</h2>
                                                <a href="../notice.html" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        반얀트리 공지사항과<br/>
                                                        놓칠 수 없는 이벤트 정보를 알려드립니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/notice-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="../faq.html">
                                                <ul>
                                                    <li>FAQ</li>
                                                    <li class="support-text">
                                                        반얀트리에 대한<br/>
                                                        자주 묻는 질문입니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/faq-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="qna">
                                                <ul>
                                                    <li>Q&A</li>
                                                    <li class="support-text">
                                                        반얀트리에 관한질문 사항이나 궁금한 점을<br/> 
                                                        남겨 주시면 신속하게 답변을 드리겠습니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/qna-icon.png"></li>
                                                </ul>
                                                </a>
                                        </div>
                            </div>
                    </li>
                    <!-- <li><a href="#">SIGN IN</a></li> -->
                </ul>
                <a href="sign_in.html">SIGN IN</a>
            </div>
        </div>
    </div>
    
    
    <div id="container">
        
        <div class="banner">
            <div class="qna_q-section">
                    <h2>Support</h2>
                    <h3>Q&A</h3>
                    <h4>반얀트리 공지사항과<br/>
                            놓칠 수 없는 이벤트 정보를 알려드립니다.</h4>
                </div>
        </div>
        <div class="qna_q">
            <div class="support-list">
                <ul class="support-list-center">
                    <li><a href="notice.html">공지사항</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li class="on"><a href="qna">Q&A</a></li>
                </ul>
            </div>
            <div class="qna_q-table">
                <div class="qna_q-box">
                	<%-- <% 
                	String name1 = "";
                	String name2 = "";
                	String email1 = "";
                	String email2 = "";
                	String tel1 = "";
                	String tel2 = "";
                	String tel3 = "";
                	
                	if(member_vo != null) { 
                		String[] emailArr= member_vo.getEmail().split("@");
                		email1 = emailArr[0];
                		email2 = emailArr[1];
						String[] nameArr= member_vo.getName().split(",");
						name1 = nameArr[0];
						name2 = nameArr[1];
						String[] telArr= member_vo.getTel().split(",");
						tel1 = telArr[0];
						tel2 = telArr[1];
						tel3 = telArr[2];
                	}
                	%> --%>
                	<% 
						String[] emailArr= data.getEmail().split(",");
						String[] nameArr= data.getName().split(",");
						String[] telArr=data.getTel().split(",");
					%>
						<form method="POST"name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/processU" enctype="multipart/form-data" onsubmit="return goEdit();" >
                   
                    	<%-- <ul class="base_info clear">
                            <li>
                                <label for="">카테고리</label>
                                <input type="text" style="width:100px;height:30px;" id="category" name="category" value="<%=CodeUtil.getCategory_name(data.getCategory()) %>" title="성을 입력해주세요" placeholder="성" readonly></input>	
                               
                            </li>
                            <li>
                                <label for="">공개여부</label>
                                <input type="text" style="width:100px;height:30px;" id="open" name="open" value="<%=CodeUtil.getOpenName(data.getOpen()) %>" title="성을 입력해주세요" placeholder="성" readonly></input>
								
                            </li>
                        </ul> --%>
                        <ul class="base_info clear">
                            <li>
                                <label for="qna-title">이름</label>
                               		<input type="text" style="width:100px;height:45px;" id="familyname" name="name" value="<%=nameArr[0]%>" title="성을 입력해주세요" placeholder="성" readonly></input>	
									<input type="text" style="width:150px;height:45px;" id="firstname" name="name" value="<%=nameArr[1]%>" title="이름을 입력해주세요" placeholder="이름" readonly></input>
                                 
                            </li>
                            <li>
                                <label for="qna-title">연락처</label>
                                <input type="text" style="width:100px;height:45px;" id="tel1" name="tel"  title="연락처를 입력해주세요" value="<%=telArr[0]%>" readonly/>	
								<input type="text" style="width:100px;height:45px;" id="tel2" name="tel"  title="연락처를 입력해주세요" value="<%=telArr[1]%>" readonly/>	
								<input type="text" style="width:100px;height:45px;" id="tel3" name="tel"  title="연락처를 입력해주세요" value="<%=telArr[2]%>" readonly/>	
                            </li>
                        </ul>
                        <label for="">이메일</label>
                       		<input type="text" name="email" id="email" style="width:200px" value="<%=emailArr[0]%><%=emailArr[1]%>"> 
							
							
						<label for="">제목</label>
                       		<input type="text" id="title" name="title" style="width:894px;height:45px;border: 2px solid #eee;" title="제목을 입력해주세요" value="<%=data.getTitle()%>" readonly/>	
								
                        <label for="">내용</label>
                       		<!-- <textarea name="qna-cont" id="qna-cont"></textarea> -->
                        	<!-- <textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%; height:300px;"></textarea> -->
                        	<textarea name="contents" id="contents" 
                        			style="resize: none; width: 100%;height: 400px;padding: 10px 10px; border: 2px solid #eee;font-size: 14px;
    								color: #454545;font-family: 'Noto Sans KR', sans-serif;font-weight: 300;letter-spacing: 0.5px;" readonly><%=data.getContents()%></textarea>
                        <label for="">첨부파일</label>
                        	<!-- <input type="file" id="filename_tmp" name="filename_tmp" style="width:894px;height:45px;border: 2px solid #eee;" title="첨부파일을 업로드 해주세요." /> -->
                        	<% if (data.getFile() == null) { %>
									<input type="file" id="filename_tmp" name="filename_tmp" style="width:894px;height:45px;border: 2px solid #eee;" value="첨부파일이 없습니다." /> 
							<% } else { %>
												
									<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.QNA_UPLOAD_PATH, java.net.URLEncoder.encode(data.getFile_org(), "UTF-8"), data.getFile()) %>" target="_blank"><%= Function.checkNull(data.getFile_org()) %> </a><br />				
									</p>
											
							<% } %>			
                       <!--  <ul class="base_info clear">
                            <li>
                                <label for="qna-title">작성자 이름</label>
                                <input type="text" id="qna-title" name="qna-title">
                            </li>
                            <li>
                                <label for="qna-title">비밀번호</label>
                                <input type="text" id="qna-title" name="qna-title">
                            </li>
                        </ul>
                        <label for="qna-title">이메일</label>
                        <input type="text" id="email" name="email" placeholder="회원님의 질문을 이메일로 발송해드립니다.">-->
                        <!-- <input type="submit" value="질문하기" class="btns" href="javascript:$('#frm').submit();"> --> 
                        
                        <div class="pwCheck" id="PwCheckBtn" hidden>
                        	<label for="qna-title" >비밀번호 확인</label>
                        	<input type="password" name="password" id="password" style="    width: 300px; height: 45px; border: 2px solid #eee;"/>
                        </div>
                        <ul class="base_info clear">
                            <li>
                        	<div class="btnLeft" id="editBtn1">
                        		<input type="submit" class="editBtn" href="javascript:;"onclick="goPassword();" ></a>
                        	</div>
                        	<div class="btnLeft" id="editBtn2" style="display:none; ">
                        		<input type="submit" class="editBtn" href="javascript:$('#frm').submit();"></a>
                        	</div>
                       		</li>
                       	</ul>
						
                        <!--======== 필요값 히든처리================ -->
                        <input type="hidden" name="cmd" value="checkPW" />
						<input type="hidden" name="reply" value="0" />
						<input type="hidden" name="send_email" value="0" />
						<input type="hidden" name="no" value="<%=data.getNo() %>" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <!-- <div class="footer-logo"><img src="img/footer_logo.png"></div> -->
        
        <div class="footer-center">
            <div class="footer-top">
                <ul class="company-info clear">
                    <li><a href="#">호텔소개</a></li>
                    <li><a href="#">오시는 길</a></li>
                    <li><a href="#">문의</a></li>
                    <li><a href="#">인재채용</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                </ul>
                <ul class="sns clear">
                    <li><a href="#"><img src="../img/sns1.png"></a></li>
                    <li><a href="#"><img src="../img/sns2.png"></a></li>
                    <li><a href="#"><img src="../img/sns3.png"></a></li>
                    <li><a href="#"><img src="../img/sns4.png"></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                    서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                </h5>
                <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                <ul class="support-logo clear">
                    <li><img src="../img/footericon1.png"></li>
                    <li><img src="../img/footericon2.png"></li>
                    <li><img src="../img/footericon3.png"></li>
                    <li><img src="../img/footericon4.png"></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>