<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="util.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">


	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		oEditors = setEditor("contents"); // 에디터 셋팅
		initCal({id:"regdate",type:"day",today:"y",timeYN:"y"});
	});
	
	function goSave() {
		if ($("#title").val() == "") {
			alert('제목을 입력하세요.');
			$("#title").focus();
			return false;
		}
		if ($("#tel").val() == "") {
			alert('연락처를 입력하세요.');
			$("#tel").focus();
			return false;
		}
		if ($("#password").val() ==""){
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
		}
		if(!/^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{6,12}$/.test($("password").val())){
			alert("비밀번호는 6~12자리를 사용해야 합니다.");
			$("#password").focus();
			return false;
		}
		var sHTML = oEditors.getById["contents"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#contents").focus();
			return false;
		} else {
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		}
		return true;
		
		//패스워드 유효성 체크
		
		
	}
	
	$("#password").change(function(){
	    checkPassword($('#password').val());
	});
	function checkPassword(password){
	    
	    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
	        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
	        $('#password').val('').focus();
	        return false;
	    }    
	    var checkNumber = password.search(/[0-9]/g);
	    var checkEnglish = password.search(/[a-z]/ig);
	    if(checkNumber <0 || checkEnglish <0){
	        alert("숫자와 영문자를 혼용하여야 합니다.");
	        $('#password').val('').focus();
	        return false;
	    }
	    if(/(\w)\1\1\1/.test(password)){
	        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
	        $('#password').val('').focus();
	        return false;
	    }
	        
	    return true;
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
					<h2>QnA - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">

							<h3>QnA 글쓰기</h3>
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
									
									
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">공개여부</label></th>
										<td>
											<select name="open">
												<%=CodeUtil.getOpenOption(0) %>
											</select>
										</td>
										<th scope="row"><label for="">카테고리</label></th>
										<td colspan="3">
											<select name="category">
												<option value="1"> 예약 </option>
												<option value="2"> 멤버쉽 </option>
												<option value="3"> 기타 </option>
											</select>
										</td>
										
									</tr>
									<tr>
										<th scope="row"><label for="">이름</label></th>
										<td >
											<input type="text" style="width:50px;height:20px;"id="familyname" name="name" value="" title="성을 입력해주세요" placeholder="성"></input>	
											<input type="text" style="width:100px;height:20px;"id="fistname" name="name" value="" title="이름을 입력해주세요" placeholder="이름"></input>
												
											
										</td>
										
										<th scope="row"><label for="">연락처</label></th>
										<td colspan="4">
											<input type="text" style="width:50px;height:20px;id="tel1" name="tel"  title="연락처를 입력해주세요" />	
											<input type="text" style="width:50px;height:20px;id="tel2" name="tel"  title="연락처를 입력해주세요" />	
											<input type="text" style="width:50px;height:20px;id="tel3" name="tel"  title="연락처를 입력해주세요" />	
										</td>
										
									
									</tr>
									<tr>
										<th scope="row"><label for="">이메일</label></th>
										<td colspan="4">
											<input type="text" name="email" id="email" style="width:100px"> @ 
											<input type="text" name="email" id="email" style="width:100px;" disabled value="naver.com">
											<select style="width:100px;margin-right:10px" name="email" id="email"> 
												<option value="1">직접입력</option> 
												<option value="@naver.com" selected>naver.com</option> 
												<option value="@hanmail.net">hanmail.net</option> 
												<option value="@hotmail.com">hotmail.com</option> 
												<option value="@nate.com">nate.com</option> 
												<option value="@yahoo.co.kr">yahoo.co.kr</option> 
												<option value="@empas.com">empas.com</option> 
												<option value="@dreamwiz.com">dreamwiz.com</option> 
												<option value="@freechal.com">freechal.com</option> 
												<option value="@lycos.co.kr">lycos.co.kr</option> 
												<option value="@korea.com">korea.com</option> 
												<option value="@gmail.com">gmail.com</option> 
												<option value="@hanmir.com">hanmir.com</option> 
												<option value="@paran.com">paran.com</option> 
											</select> 


											
										</td>
										
									</tr>
									<tr>
										<th scope="row"><label for="">게시글 비밀번호</label></th>
										<td >
											<input type="password" id="password1" name="password" maxlength="12" class="w30" title="비밀번호를 입력해주세요" />	
											
										</td>
										<th scope="row"><label for="">게시글 비밀번호 확인</label></th>
										<td colspan="4" >
											<input type="password" id="password2" name="password" maxlength="12" class="w30" title="비밀번호를 입력해주세요" />	
											
										</td>
									
									</tr>
									
									
									
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="3">
											<input type="text" id="title" name="title" class="w50" title="제목을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="4">
											<textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%;"></textarea>	
										</td>
									</tr>
									<tr>		<!-- 서버에서 사용하는 파일이름 / 한글을 사용하지 않기위해 org에  / 파일기능 첨부는 post로  form 에는  enctype 사용해야함. -->
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="3">
											<input type="file" id="filename_tmp" name="filename_tmp" class="w50" title="첨부파일을 업로드 해주세요." />	
										</td>
									</tr>
									
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							<input type="hidden" name="reply" value="0" />
							<input type="hidden" name="send_email" value="0" />
							
							
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
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