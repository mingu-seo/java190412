<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>영상의학과</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub2-4.css">
    <link rel="stylesheet" href="/css/footer.css">
    <link rel="stylesheet" href="/css/reset.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
</head>
<body>
 <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <div id="container">
        <!-- con1 : 배너 사진 부분-->
        <div class="con1"></div>
        <!-- con2 : 메인 부분 -->
        <div class="con2">
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>병원소개</h2>
                    <p>information</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="/department/surgery.do">외과</a></li>
                    <li><a href="/department/internal.do">내과</a></li>
                    <li><a href="/department/radiology.do">영상의학과</a></li>
                    <li  class="on"><a href="/department/emergency.do">응급중환자의료센터</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>응급중환자의료센터</h3>
                <p>Emergency Medical Center</p>
                <div class="medicine-box clear">
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                                <div class="medicine-hover">
                                    <div class="medicine-opa">
                                        <h4>중환자 집중치료</h4>
                                        <h6>Intensive Care </h6>
                                        <img src="/icon/medicine-class.png">
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>중환자 집중치료</h3>
                            <h5>중환자는 급격히 상태 악화가 발생할 수 있는 위중한 상태에 있기 때문에, 일반 외래 환자나 일반 입원 환자와 달리, 지속적으로 전문적이고 세심한 치료와 관찰이 필요합니다. 해마루 이차진료 동물병원에는 중환자 집중 치료를 위한 현대화된 중환자실이 운영 되고 있고 숙련된 중환자 전담 진료진이 365일 24시간 중환자 집중 치료를 제공합니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>응급의료센터</h4>
                                    <h6>Emergency Medical Center</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>응급의료센터</h3>
                            <h5>응급의학은 급성질환이나 손상에 따른 신체의 이상에 대한 응급 진료를 전문적으로 담당하여 환자의 생명을 구하고 환자 상태를 최단시간 내에 안정시켜 계속되는 원인 규명을 위한 감별 검사, 원인에 대한 치료/수술 등이 가능하도록 하는 특수한 의학 분야입니다. 수의학에서는 비교적 최근에 정립된 분야이며, 국내에서는 아직 응급의학을 전담하는 숙련된 진료진이 상주하는 동물병원이 극히 드문 실정입니다. 해마루 이차진료 동물병원의 응급의료센터는 이러한 국내 현실에서 독보적인 시스템과 전담 진료진을 갖추고 운영되고 있으며, 기대와 명성을 넘어서는 최상의 응급 진료를 제공하기 위해 끊임없이 노력하고 있습니다.</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>