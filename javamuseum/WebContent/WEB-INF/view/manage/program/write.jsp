<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.program.*"%>
<%@ page import="util.*"%>
<%@ page import="property.*"%>
<%
	ProgramVO param = (ProgramVO) request.getAttribute("param");
	ArrayList<ProgramVO> list = (ArrayList<ProgramVO>) request.getAttribute("list");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script>
jQuery(window).load(function(){
	oEditors = setEditor("contents"); // 에디터 셋팅
	initCal({id:"date" ,type:"day",today:"y"});
});


function goSave() {
/* 	if ($("#instructor").val() == "") {
		alert('강사명을 입력하세요.');
		$("#instructor").focus();
		return false;
	}
	if ($("#location").val() == "") {
		alert('강의장소를 입력하세요.');
		$("#location").focus();
		return false;
	}
	if ($("#mex_mem").val() == "") {
		alert('최대인원을 입력하세요.');
		$("#mex_mem").focus();
		return false;
	}
	if ($("#title").val() == "") {
		alert('프로그램명을 입력하세요.');
		$("#title").focus();
		return false;
	}

	if ($("#target").val() == "") {
		alert('대상을 입력하세요.');
		$("#target").focus();
		return false;
	} */
	var sHTML = oEditors.getById["contents"].getIR();
	if (sHTML == "" || sHTML == "<p><br></p>") {
		alert('내용을 입력하세요.');
		$("#contents").focus();
		return false;
	} else {
		oEditors.getById["contents"].exec("UPDATE_INFO_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
	}
	

   return true;
}

$(function(){
    var trIdx = 0;
    $(".addBtn").click(function(){
		
    	var trObj ="<tr class='addTr'>";
		trObj += "<td><input type='text' id='date"+trIdx+"'";
		trObj += "name='date"+ trIdx + "'"  ;
		trObj += "class='inputDate' value='<%=DateUtil.getToday()%>' title='등록일을 입력해주세요' /><span id='Caldate"+trIdx+"Icon' name='Caldate"+trIdx+"Icon'><img src='/manage/img/calendar_icon.png' id='Caldate"+trIdx+"IconImg' style='cursor:pointer;'/></span></td>";
		trObj += "<td><select name='time'><%=CodeUtil.getP_timeType(0)%></select></td>";
		trObj += "<td><input type=\"button\" value=\"삭제\" class=\"delBtn\"/></td>";
		trObj += "</tr>";
		
		
		$("#optionTable").append(trObj);
		var calId = "date"+trIdx; 
		initCal({id:calId ,type:"day",today:"y"});
		trIdx++;
		
		
		$(".delBtn").off("click");
		$(".delBtn").click(function() {
			var idx = $(".delBtn").index(this);
			$(".addTr").eq(idx).remove();
		});
	});
});


</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/manage/include/common.jsp"%>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/manage/include/top.jsp"%>
			<!-- E N D :: headerArea-->

			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>프로그램 관리- [등록]</h2>
					</div>
              <!-- //con_tit -->
               <div class="con">
                  <!-- 내용 : s -->
					<div id="bbs">
                     <div id="bread">
                        <form method="post" name="frm" id="frm"
                           action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do"
                           enctype="multipart/form-data" onsubmit="return goSave();">
                           <table width="100%" border="0" cellspacing="0" cellpadding="0"
                              summary="프로그램 관리 기본내용입니다.">
                              <colgroup>
                                 <col width="10%" />
                                 <col width="40%" />
                                 <col width="10%" />
                                 <col width="15%" />             
                                 <col width="10%" />
                                 <col width="15%" />
                              </colgroup>
                              <tbody>
								<tr>
									<th scope="row"><label for="">강사명</label></th>
									<td><input type="text" id="instructor"
								         name="instructor" class="w30" title="강사명을 입력해주세요" /></td>
									<th scope="row"><label for="">신청인원</label></th>
								    <td colspan="3">최대   <input type="text" id="max_mem" name="max_mem" class="w10" title="프로그램 교육비을 입력해주세요" /> 명</td>
								 </tr>
								   <tr>
								      <th scope="row"><label for="">강의 장소</label></th>
								      <td><input type="text" id="location"
								         name="location" class="w50" title="강의장소을 입력해주세요" /></td></td>
								
								      <th scope="row"><label for="">프로그램 비용</label></th>
								      <td colspan="3"><input type="text" id="price" name="price" class="w10" title="프로그램 교육비을 입력해주세요" /> 원</td>
								   </tr>
								  
								   <tr>
								 	  <th scope="row"><label for="">대상</label></th>
								      	<td><input type="text" id="target" name="target" class="w50" title="프로그램 대상을 입력해주세요" /></td>
								      	<th scope="row"><label for="">노출여부</label></th>
     										<td><select name="display">
								      <%=CodeUtil.getDisplayOp(0)%>
								     		 </select></td>
									   	<th scope="row"><label for="">카테고리</label></th>
								        <td><select name="category">
								       <%=CodeUtil.getCategoryOption(0)%>
									      </select></td>
								   </tr>
								   
								   <tr>
								      <th scope="row"><label for="">프로그램명</label></th>
								      <td colspan="1"><input type="text" id="title"
								         name="title" class="w50" title="제목을 입력해주세요" /></td>
								    	<th scope="row"><label for="">프로그램 간략한 시간</label></th>
								      <td colspan="3"><input type="text" id="p_time"
								         name="p_time" class="w50" title="프로그램 간략한 정보를 입력해주세요" /></td>
								   </tr>
								   
								   <tr>

								   </tr>

								<th scope="row"><label for="">*프로그램 기간</label>
									<input type="button" value="추가" class="addBtn"/>
								</th>
								<td>
									<table id="optionTable">
										<tr>
											<td>프로그램 날짜</td>
											<td>프로그램 시간</td>
										</tr>
									</table>
								</td>
								 <tr>
								      <th scope="row"><label for="">첨부파일</label></th>
								      <td colspan="5"><input type="file" id="imagename_tmp"
								         name="imagename_tmp" class="w50" title="첨부파일을 업로드 해주세요." />
								      </td>
								   </tr>
								   <tr>
								       <th scope="row"><label for="">내용</label></th>
								      <td colspan="5"><textarea id="contents" name="contents"
								            title="내용을 입력해주세요" style="width: 100%;"></textarea></td>
								</tr>
                                 
                              </tbody>
                           </table>
                           <input type="hidden" name="program_pk" id="program_pk" value="<%=param.getNo()%>"/>
                           <input type="hidden" name="cmd" value="write" />
                        </form>
						<div class="btn">
						<div class="btnLeft">
							<a class="btns"
								href="<%=param.getTargetURLParam("list", param, 0)%>"><strong>목록</strong></a>
							</div>
							<div class="btnRight">
								<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
							</div>
						</div>
                        <!--//btn-->


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