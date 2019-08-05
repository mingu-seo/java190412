<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>    
    
<%
QnaVO param = (QnaVO)request.getAttribute("param");
MemberVO member_vo = (MemberVO)session.getAttribute("memberInfo");

%>
<!DOCTYPE html>
<script>

function goSave() {
	var pass = $("#password").val();
	 console.log(pass);
	return false;
} 
	
</script>
<html>
<head>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

                	
			<form method="POST"name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/popup.do" onsubmit="return goSave();" >
                
            	    게시글의 비밀번호를 입력해주세요. 
                
            	<ul class="base_info clear">
                  	         
				
				<input type="text" id="password" name="password" style="width:150px;height:45px;border: 2px solid #eee;" maxlength="12" title="비밀번호를 입력해주세요" />
							
				</ul>
				<input type="hidden" name="cmd" value="popup" />		
                <div class="btn">
                <div class="btnRight">
				<!-- <a class="btns" href="javascript:$('#frm').submit();"><strong>확인</strong></a> --> 
			    <a class="btns" href="#" onclick="goSave();">저장</a>
			 </form>
		</div>
	</div>
</body>
</html>