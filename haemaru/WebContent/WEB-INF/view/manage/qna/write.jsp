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
		oEditors = setEditor("info"); // 에디터 셋팅
		initCal({id:"registdate",type:"day",today:"y",timeYN:"y"});
	});
	
	function goSave() {
		if ($("#name").val() == "") {
			alert('상품명을 입력하세요.');
			$("#name").focus();
			return false;
		}
		if ($("price").val() == "") {
			alert('가격을 입력하세요.');
			$("#price").focus();
			return false;
			}
			
			var con = true;
			$(".addTr").each(function(idx){
				if ($("input[name='title']").eq(idx).val() == ""){
					alert("옵션명을 입력해주세요");
					$("input[name='title']").eq(idx).focus();
					con = false;
					return false;
				}
				if ($("input[name='optPrice']").eq(idx).val() == ""){
					alert("옵션가격을 입력해주세요");
					$("input[name='optPrice']").eq(idx).focus();
					con = false;
					return false;
				}
			});
			if ( con == false ) return false;
		
		
		var sHTML = oEditors.getById["info"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#info").focus();
			return false;
		} else {
			oEditors.getById["info"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		}
		return true;
		
	}
	
	$(function(){
		var trIdx = 0;
		$(".addBtn").click(function(){
			var trObj = "<tr class='addTr'>";
			trObj += "<td><input type=\"text\" name=\"title\"/></td>";
			trObj += "<td><input type=\"text\" name=\"optPrice\"/></td>";
			trObj += '<td><input type="button" value="삭제" class="delBtn"/></td>';
			trObj += "</tr>";
			$("#optTable").append(trObj);
			trIdx++;
			
			$(".delBtn").off("click");
			$(".delBtn").click(function(){
				var idx = $(".delBtn").index(this);
				$(".addTr").eq(idx).remove();
				
			});
		});
	});
	
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
					<h2>상품 - [등록하기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="상품 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">카테고리</label></th>
										<td>
											<select name="category">
												<option value='1'>남성의류</option>
												<option value='2'>여성의류</option>
												<option value='3'>아동의류</option>
											</select>
										</td>
										<th scope="row"><label for="">등록일</label></th>
										<td>
											<input type="text" id="registdate" name="registdate" class="inputTitle" value="<%=DateUtil.getFullToday()%>" title="등록일을 입력해주세요" />&nbsp;
											<span id="CalregistdateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalregistdateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">이미지파일</label></th>
										<td><input type="file" id="imagename_tmp" name="imagename_tmp" class="w50" title="첨부파일을 업로드 해주세요." />	
										</td>
										<th scope="row"><label for="">가격</label></th>
										<td colspan="2">
											<input type="text" id="price" name="price" class="w50" title="첨부파일을 업로드 해주세요." />	
										</td>
										<tr>
									<th scope="row"><label for="">옵션</label><input type="button" value="추가" class="addBtn"></input></th>
									<td colspan="3">
									<table style="width:300px;" id="optTable">
									<tr>
									<th>옵션명</th>
									<th>추가금액</th>
									</tr>
									</table>
									<tr>
										<th scope="row"><label for="">*상품명</label></th>
										<td colspan="3">
											<input type="text" id="name" name="name" class="w50" title="제목을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea id="info" name="info" title="내용을 입력해주세요" style="width:100%;"></textarea>	
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