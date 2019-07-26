<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypet.*" %>
<%
MypetVO data = (MypetVO)request.getAttribute("data");
%>
<div class="mypet-box">
		<div class="mypet-head">
			<p>반려동물 정보 수정</p>
			<img src="/icon/footer-icon.png">
		</div>
		<div class="mypet-page">
			<div class="mypet-back-arrow">
				<a href="#"><img src="/icon/backarrow.png">
					<P>뒤로가기</P></a>
			</div>
			<h1 class="mypet-logo">
				<a href="#"><img src="/icon/logo_lightgreen.png"></a>
			</h1>
			<form class="mypet-form" method="POST" action="/my/my-pet-edit">
				<div class="petname_box">
					<span><label for="pet_name" class="label">My pet 이름</label></span>
					<input type="text" maxlength="20" id="pet_name" name="name" class="cover-size" value="<%=data.getName()%>">
				</div>
				<div class="petage_box">
					<span><label for="pet_old" class="label">My pet 나이</label></span> <input
						type="text" maxlength="20" id="pet_old" name="age" value="<%=data.getAge()%>
						class="cover-size">
				</div>
				<div class="petgender_box">
					<span>My Pet 성별</span> 
					<input type="radio" id="radio01" name="gender" value="2" <%=data.getGender()==2 ? "checked":"" %>><label for="radio01" class="label">남아</label>
					<input type="radio" id="radio02" name="gender" value="1" <%=data.getGender()==1 ? "checked":"" %>><label for="radio02" class="label">여아</label>
				</div>
				<div class="petlist_box">
					<span><label for="pet_class" class="label">My Pet 품종</label></span>
					<input type="text" maxlength="5" id="pet_class" name="breed" value="<%=data.getBreed() %>"
						class="cover-size">
				</div>
				<div class="petdoc_box">
					<span><label for="pet_helth" class="label">최근 접종 현황</label></span>
					<input type="text" maxlength="5" id="pet_helth" name="vac" value="<%=data.getVac() %>"
						class="cover-size">
				</div>
				<div class="mypet-btn clear">
					<input type="reset" value="취소" id="btn_reset2"> 
					<input type="submit" value="수정" id="btn_submit2">
				</div>
			</form>
			<ul class="mypet-bot clear">
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">이메일무단수집거부</a></li>
			</ul>
		</div>
	</div>