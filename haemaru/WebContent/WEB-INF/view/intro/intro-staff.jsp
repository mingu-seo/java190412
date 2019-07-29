<%@page import="util.CodeUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="manage.doctor.*"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<DoctorVO> list = (ArrayList) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>의료진소개</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/sub1-2.css">
<link rel="stylesheet" href="/css/footer.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/custom.js"></script>
<!-- 정렬 플러그 인 -->
<script type="text/javascript" src="/js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="/js/sub1-2.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/view/include/headHtml.jsp"%>
	<div id="container">
		<!-- con1 : 배너 사진 부분-->
		<div class="con1"></div>
		<!-- con2 : 메인 부분 -->
		<div class="con2">
			<!-- sub bar 부분 (고정) -->
			<div class="fixed-sub">
				<div class="title-area">
					<h2>병원소개</h2>
					<p>Information</p>
				</div>
				<ul class="sub-bar">
					<li><a href="/intro/intro-hi.do">인사말</a></li>
					<li class="on"><a href="/intro/intro-staff.do">의료진소개</a></li>
					<li><a href="/intro/intro-map.do">오시는길</a></li>
				</ul>
			</div>
			<!-- main 부분 (여기다가 하면 됨) -->
			<div class="main">
				<div class="top-arrow">
					<a href="#"> <img src="/icon/top-arrow.png">
						<p>위로가기</p>
					</a>
				</div>
				<h3>의료진소개</h3>
				<p>Staff</p>
				<!-- 탭 메뉴 리스트 부분 -->
				<ul class="tab-list clear">
					<li data-staff='*' class="on"><a href="#">원장</a></li>
					<li data-staff='.staff2'><a href="#">수의사</a></li>
					<li data-staff='.staff3'><a href="#">테크니션</a></li>
					<li data-staff='.staff4'><a href="#">리셉션리스트</a></li>
				</ul>
				<!-- 의사 부분 -->
				<div class="tab-info clear">
						<% for (int i = 0; i < list.size(); i++) {%>
						 <% if (list.get(i).getPosition() == 1) { %>
							<div class="staff1">
						<% } else if (list.get(i).getPosition() == 2) { %>
							<div class="staff1 staff2">
						<% } else if (list.get(i).getPosition() == 3) { %>
							<div class="staff1 staff3">
						<% } else { %>
							<div class="staff1 staff4">
						<% 
						}
						%>   
								<img src="/upload/doctor/<%=list.get(i).getDoc_image()%>">
								<h4><%=CodeUtil.getDoctorDepartmentName(list.get(i).getDepartment())%>/<%=CodeUtil.getDoctorPositionName(list.get(i).getPosition())%></h4>
								<h5><%=list.get(i).getName()%></h5>
								<a href="#">MORE</a>
							</div>
						<%
							}
						%>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>