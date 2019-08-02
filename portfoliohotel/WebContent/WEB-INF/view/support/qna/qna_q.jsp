<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
MemberVO member_vo = (MemberVO)session.getAttribute("memberInfo");
%>
<!DOCTYPE html>

<html lang="ko">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/function.js"></script> 
<script type="text/javascript">


 	/* var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		oEditors = setEditor("contents"); // 에디터 셋팅
		initCal({id:"regdate",type:"day",today:"y",timeYN:"y"});
	}); */
	
	function goSave() {
		if ($("#familyname").val() ==""){
			alert("성을 입력해 주세요");
			$("#familyname").focus();
			return false;
		}
		if ($("#firstname").val() ==""){
			alert("이름을 입력해 주세요");
			$("#firstname").focus();
			return false;
		}
		if ($("#tel1").val() ==""){
			alert("번호를 입력해 주세요");
			$("#tel1").focus();
			return false;
		}
		if ($("#tel2").val() ==""){
			alert("번호를 확인해 주세요");
			$("#tel2").focus();
			return false;
		}
		if ($("#tel3").val() ==""){
			alert("번호를 확인해 주세요");
			$("#tel3").focus();
			return false;
		}
		if ($("#email").val() ==""){
			alert("이메일을 입력해 주세요");
			$("#email").focus();
			return false;
		}
		if ($("#email2").val() ==""){
			alert("이메일 주소를 확인해 주세요");
			$("#email2").focus();
			return false;
		}
		if ($("#title").val() =="") {
			alert('제목을 입력하세요.');
			$("#title").focus();
			return false;
		}
		if ($("#contents").val() ==""){
			alert("내용 입력해 주세요");
			$("#contents").focus();
			return false;
		}  
		
		if ($("#password").val() ==""){
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
		}
		
		
		/* if(!/^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{6,12}$/.test($("password").val())){
			alert("비밀번호는 6~12자리를 사용해야 합니다.");
			$("#password").focus();
			return false;
		}   */
		/* var sHTML = oEditors.getById["contents"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#contents").focus();
			return false;
		} else {
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		} */
		return true;
		/* $("#frm").submit(); */
		//패스워드 유효성 체크
		
		
	}
	
	
	$(function() {
		
		if($("#hideEmailOpt").val() == "@") {
		$("#hideEmailOpt").hide();
		var pass = $("#1234").val();
		 console.log(pass);
		 $("#email2").attr("disabled",false);
		 $("#selectEmail").val("1").prop("selected", true);
		}
			
			
		$('#selectEmail').change(function(){ 
			   $("#selectEmail option:selected").each(function () { 
			      if($(this).val()== '1'){ //직접입력일 경우
			         $("#email2").val('@'); //값 초기화
			         $("#email2").attr("disabled",false); //활성화
			         }else{ //직접입력이 아닐경우
			            $("#email2").val($(this).text()); //선택값 입력
			            $("#email2").attr("disabled",true); //비활성화
			         } 
			    }); 
		});
	});
	
	
	
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/qna_q.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>Tree_qna</title>
</head>
<body>
    <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="/index.html"><img src="/img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">BOOK</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="/special_promotion.html">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="/room_offer.html">Room Package</a></li>
                                                <li><a href="/room_offer.html">Dining Package</a></li>
                                                <li><a href="/room_offer.html">Events & Gift</a></li>
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
                                                    <li><a href="/facilities.html#f1">The Oasis</a></li>
                                                    <li><a href="/facilities.html#f2">Indoor Swimming Pool</a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                        <li><a href="/facilities.html#f3">Fitness Centre</a></li>
                                                        <li><a href="/facilities.html#f4">Sauna</a></li>
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
                                                <a href="/notice.html" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        반얀트리 공지사항과<br/>
                                                        놓칠 수 없는 이벤트 정보를 알려드립니다.
                                                    </li>
                                                    <li class="support-icon"><img src="/img/notice-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="/faq.html">
                                                <ul>
                                                    <li>FAQ</li>
                                                    <li class="support-text">
                                                        반얀트리에 대한<br/>
                                                        자주 묻는 질문입니다.
                                                    </li>
                                                    <li class="support-icon"><img src="/img/faq-icon.png"></li>
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
                                                    <li class="support-icon"><img src="/img/qna-icon.png"></li>
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
                	<% 
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
                	%>
						<form method="POST"name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/processU" enctype="multipart/form-data" onsubmit="return goSave();" >
                   
                    	<ul class="base_info clear">
                            <li>
                                <label for="">카테고리</label>
                               	<select name="category" style="height:30px;">
									<option value="1"> 예약 </option>
									<option value="2"> 멤버쉽 </option>
									<option value="3"> 기타 </option>
								</select>
                            </li>
                            <li>
                                <label for="">공개여부</label>
                               	<select name="open" style="height:30px;">
									<%=CodeUtil.getOpenOption(0) %>
								</select>
                            </li>
                        </ul>
                        <ul class="base_info clear">
                            <li>
                                <label for="qna-title">이름</label>
                               		<input type="text" style="width:100px;height:45px;" id="familyname" name="name" value="<%=name1%>" title="성을 입력해주세요" placeholder="성"></input>	
									<input type="text" style="width:150px;height:45px;" id="firstname" name="name" value="<%=name2 %>" title="이름을 입력해주세요" placeholder="이름"></input>
                                 
                            </li>
                            <li>
                                <label for="qna-title">연락처</label>
                                <input type="text" style="width:100px;height:45px;" id="tel1" name="tel"  title="연락처를 입력해주세요" value="<%=tel1%>" maxlength=3/>	
								<input type="text" style="width:100px;height:45px;" id="tel2" name="tel"  title="연락처를 입력해주세요" value="<%=tel2%>" maxlength=4/>	
								<input type="text" style="width:100px;height:45px;" id="tel3" name="tel"  title="연락처를 입력해주세요" value="<%=tel3%>" maxlength=4/>	
                            </li>
                        </ul>
                        <label for="">이메일</label>
                       		<input type="text" name="email" id="email" style="width:200px" value="<%=email1%>"> @ 
							<input type="text" name="email" id="email2" style="width:100px;" disabled value="<%=email2%>">
							<select style="width:100px;height:30px;" name="email" id="selectEmail"> 
								
								<option value="@<%=email2%>" id="hideEmailOpt"><%=email2%></option>
								<option value="1" >직접입력</option> 
								<option value="@naver.com" <%="@naver.com".equals(email2) ? "selected":""%>>naver.com</option> 
								<option value="@daum.net" <%="@daum.net".equals(email2) ? "selected":""%>>hanmail.net</option>
								<option value="@hanmail.net" <%="@hanmail.net".equals(email2) ? "selected":""%>>hanmail.net</option>
								<option value="@gmail.com" <%="@gmail.com".equals(email2) ? "selected":""%>>gmail.com</option>  
								<option value="@hotmail.com" <%="@hotmail.com".equals(email2) ? "selected":""%>>hotmail.com</option> 
								<option value="@nate.com" <%="@nate.com".equals(email2) ? "selected":""%>>nate.com</option> 
								<option value="@dreamwiz.com" <%="@dreamwiz.com".equals(email2) ? "selected":""%>>dreamwiz.com</option> 
											
							</select> 
							
						<label for="">게시글 비밀번호</label>
							<input type="password" id="password" name="password" style="width:150px;height:45px;border: 2px solid #eee;" maxlength="12" title="비밀번호를 입력해주세요" />
							
						<label for="">제목</label>
                       		<input type="text" id="title" name="title" style="width:894px;height:45px;border: 2px solid #eee;" title="제목을 입력해주세요" />	
								
                        <label for="">내용</label>
                       		<!-- <textarea name="qna-cont" id="qna-cont"></textarea> -->
                        	<!-- <textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%; height:300px;"></textarea> -->
                        	<textarea name="contents" id="contents" 
                        			style="resize: none; width: 100%;height: 400px;padding: 10px 10px; border: 2px solid #eee;font-size: 14px;
    								color: #454545;font-family: 'Noto Sans KR', sans-serif;font-weight: 300;letter-spacing: 0.5px;"></textarea>
                        <label for="">첨부파일</label>
                        	<input type="file" id="filename_tmp" name="filename_tmp" style="width:894px;height:45px;border: 2px solid #eee;" title="첨부파일을 업로드 해주세요." />
                        		
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
                        
                       		<div>
								<input type="submit" class="btns" href="javascript:$('#frm').submit();"></a> 
								<!-- <a class="btns" href="#" onclick="goSave();"><strong>저장</strong></a> -->
							</div>
						
                        <!--======== 필요값 히든처리================ -->
                        <input type="hidden" name="cmd" value="write" />
						<input type="hidden" name="reply" value="0" />
						<input type="hidden" name="send_email" value="0" />
						
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
                    <li><a href="#"><img src="/img/sns1.png"></a></li>
                    <li><a href="#"><img src="/img/sns2.png"></a></li>
                    <li><a href="#"><img src="/img/sns3.png"></a></li>
                    <li><a href="#"><img src="/img/sns4.png"></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                    서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                </h5>
                <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                <ul class="support-logo clear">
                    <li><img src="/img/footericon1.png"></li>
                    <li><img src="/img/footericon2.png"></li>
                    <li><img src="/img/footericon3.png"></li>
                    <li><img src="/img/footericon4.png"></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>