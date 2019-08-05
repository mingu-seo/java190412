<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="user.exhibition.*" %>
<%
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
ArrayList<UExhibitionVO> list = (ArrayList)request.getAttribute("ingList");
UExhibitionVO param = (UExhibitionVO)request.getAttribute("param");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
    
<link rel="stylesheet" href="/css/sub-exhibition1.css">
<title>미술관소개</title>

<script src="https://kit.fontawesome.com/3db09483e7.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script>
	function isNull(obj){
		return (obj === undefined || obj === null) ? true : false;
	}

	function getTicket(i) {
		if(isNull(member)){
			alert("로그인을 해주세요.");
		};
		$.ajax({
			type : "GET",
			url : "/user/exhibition/ticket?no="+i,
			async : false,
			success : function (data) {
				$(".con3").html(data);
				$(".con3-bg").show();
			}
		});
	};
	
	function getDetail(i) {
		$.ajax({
			type : "GET",
			url : "/user/exhibition/detail?no="+i,
			async : false,
			success : function(data) {
				$(".con3").html(data);
				$(".con4-bg").show();
			}
		});
	};

	$(function(){
		
		$(".con2-bggroup > li > a").click(function(event){ // a링크 정지
			event.preventDefault(); // a링크 정지
			$(this).siblings(".con2-sub01").stop().fadeIn(); 
		});
		$(".sub01-close").click(function(event){ // a링크 정지
			event.preventDefault(); // a링크 정지
			$(this).parent(".con2-sub01").stop().fadeOut();
		});

		$(".con4 #submit-btn2").click(function(){
			$(".con4-bg").hide();
		});
		$(".con4-epilogue").click(function(event){
			event.preventDefault();
			var list=$(this).hasClass("on") //클릭한 자기자신에게 on이 붙어있는지 없는지 확인
               

			if(list) { //on이 붙어있을때 - true
				$(this).removeClass("on");
				$(this).siblings(".con4-ep-cont").stop().slideUp();
			} else { //on이 없을때 - false

				$(".con4-epilogue").removeClass("on")
				$(this).addClass("on");
				$(".con4-epilogue").siblings(".con4-ep-cont").stop().slideUp();
				$(this).siblings(".con4-ep-cont").stop().slideDown();
			}
		})
	})
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
    <div class="con">
    	<!-- con1 상단 리뉴얼 -->
        <div class="con1">
            <div class="con1-box">
                <h3>EXHIBITION</h3>
                <P>현재 전시</P>
            </div>
        </div>
        <!-- //con1 -->
        <!-- con2 현재 전시 첫줄 -->
        <div class="con2">
            <div class="con2-center">
                <div class="con2-text">
                    <h3>CURRENT EXHIBITION</h3>
                </div>
                <ul class="con2-bggroup clear">
                    <%for(int i = 0; i < 3; i++){ %>
                    <li>
                    	<input type="hidden" id="no<%=i%>" value="<%=list.get(i).getNo()%>"/>
                        <a href="#"><img src="/upload/exhibition/<%=list.get(i).getImagename()%>"/></a>
                        <div class="con2-sub01 clear">
                            <img src="/upload/exhibition/<%=list.get(i).getImagename()%>"/>
                            <div class="sub01-text">
                                <h4>로봇 일러스트레이션을 통해</h4>
                                <h4>기계적 판타지를 구현하는</h4>
                                <h3><%=list.get(i).getArtist()%> / Hajime Sorayama</h3>
                                <p><%=list.get(i).getPreview().replaceAll("\n","<br>")%></p>
                                <ul class="sub01-btn clear">
                                    <li class="li1" onclick="getTicket(<%=list.get(i).getNo() %>)"><a href="javascript:;">예매하기</a></li>
                                    <li class="li2" onclick="getDetail(<%=list.get(i).getNo() %>)"><a href="javascript:;">작품 상세 보기</a></li>
                                </ul>
                            </div>
                            <div class="sub01-close">
                                 <a href="#"><img src="/img/sub-exhibition-close.png"></a>
                            </div>
                        </div>
                    </li>
                    <%} %>
                </ul>
                <ul class="con2-bggroup clear">
                	<%for(int i = 3; i < 6; i++){ %>
					<li>
						<a href="#"><img src="/upload/exhibition/<%=list.get(i).getImagename()%>"/></a>
						<div class="con2-sub01 clear">
							<img src="/upload/exhibition/<%=list.get(i).getImagename()%>"/>
							<div class="sub01-text">
								<h4>서정적이고 환상적인 이야기를</h4>
								<h4>정재된 텍스처로 풀어내는</h4>
								<h3><%=list.get(i).getArtist()%> / Juliette Binet</h3>
								<p><%=list.get(i).getPreview().replaceAll("\n","<br>")%></p>
								<ul class="sub01-btn clear">
									<li class="li1" onclick="getTicket(<%=list.get(i).getNo() %>)"><a href="javascript:;">예매하기</a></li>
									<li class="li2" onclick="getDetail(<%=list.get(i).getNo() %>)"><a href="javascript:;">작품 상세 보기</a></li>
								</ul>
							</div>
							<div class="sub01-close">
								<a href="#"><img src="/img/sub-exhibition-close.png"></a>
							</div>
						</div>
					</li>
					<%} %>
				</ul>
                <ul class="con2-bggroup clear">
                	<%for(int i = 6; i < 9; i++){ %>
                    <li>
                        <a href="#"><img src="/upload/exhibition/<%=list.get(i).getImagename()%>"/></a>
                        <div class="con2-sub01 clear">
                            <img src="/upload/exhibition/<%=list.get(i).getImagename()%>"/>
                            <div class="sub01-text">
                                <h4>자연과 인물에 대한 따뜻한 시선을</h4>
                                <h4>다채로운 색으로 전달하는</h4>
                                <h3><%=list.get(i).getArtist()%> / Oamul Lu</h3>
                                <p><%=list.get(i).getPreview().replaceAll("\n","<br>")%></p>
                                <ul class="sub01-btn clear">
                                    <li class="li1" onclick="getTicket(<%=list.get(i).getNo()%>)"><a href="javascript:;">예매하기</a></li>
                                    <li class="li2" onclick="getDetail(<%=list.get(i).getNo() %>)"><a href="javascript:;">작품 상세 보기</a></li>
                                </ul>
                            </div>
                            <div class="sub01-close">
                                 <a href="#"><img src="/img/sub-exhibition-close.png"></a>
                            </div>
                        </div>
                    </li>
                    <%} %>
                </ul>
                
            </div>
        </div>
        <!-- //con2 종료 -->
		<div class="con3">
		
		</div>
        <!-- con3 예매 페이지 -->
		<div class="con4">
			
        </div>
        <!-- //con4 후기 종료 -->
    </div>
    <!-- //con -->
<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>