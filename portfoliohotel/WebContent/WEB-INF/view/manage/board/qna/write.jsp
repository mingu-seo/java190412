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
<script>
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
		var sHTML = oEditors.getById["contents"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#contents").focus();
			return false;
		} else {
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
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
											<input type="text" id="name" name="name" class="w50" title="이름을 입력해주세요" />	
											
										</td>
										
										<th scope="row"><label for="">연락처</label></th>
										<td colspan="4">
											<input type="text" id="tel" name="tel" class="w50" title="연락처를 입력해주세요" />	
										</td>
										
									
									</tr>
									<tr>
										<th scope="row"><label for="">이메일</label></th>
										<td >
											<input type="text" id="email" name="email" class="w50" title="이메일을 입력해주세요" />	
											
										</td>
										<th scope="row"><label for="">게시글 비밀번호</label></th>
										<td colspan="3" >
											<input type="text" id="password" name="password" class="w20" title="비밀번호를 입력해주세요" />	
											
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