<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>내과</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub2-2.css">
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
                    <li class="on"><a href="/department/internal.do">내과</a></li>
                    <li><a href="/department/radiology.do">영상의학과</a></li>
                    <li><a href="/department/emergency.do">응급중환자의료센터</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>내과</h3>
                <p>Medicine</p>
                <div class="medicine-box clear">
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                                <div class="medicine-hover">
                                    <div class="medicine-opa">
                                        <h4>내분비 내과</h4>
                                        <h6>Endocrinology Internal Medicine</h6>
                                        <img src="/icon/medicine-class.png">
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>내분비 내과</h3>
                            <h5>해마루 내분비 내과에서는 정확한 진단을 위해 수의분야에서 세계적으로 
                                    가장 권위 있는 IDEXX Laboratories에 호르몬 검사를 의뢰하고 있습니다. 
                                    또한 국내 최고의 환자 경험을 바탕으로 보호자와 환자에 맞는 
                                    최적의 맞춤형 치료를 제시하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>순환기 내과</h4>
                                    <h6>Cardiology Internal Medicine</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>순환기 내과</h3>
                            <h5>동맥관개존증, 폐동맥·대동맥판막 협착증, 방실기형, 혈관기형과 같은 
                                    선천적인심장질환과 만성 판막질환, 비대성·확장성 심근병증, 폐고혈압, 
                                    심장사상충증, 부정맥 등의 후천성 심장질환에 대한 진단을 위해 흉부방사선, 
                                    심장초음파 검사, 심장 바이오마커 검사, 심전도 검사, 기관지 내시경, 
                                    투시검사, CT촬영, 혈관 조영술 등의 최신 신단 기법을 활용하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>종양 내과</h4>
                                    <h6>Oncology</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>종양 내과</h3>
                            <h5>종양 제거 수술, 항암치료, 표적약물치료, 면역치료 뿐만 아니라 표준적인
                                    치료가 불가능한 말기 암 환자를 위한 다양한 대체 요법과 전문적인 
                                    통증관리를 포함한 호스피스 치료를 통해 종양으로 고통받는 환자와 
                                    보호자가 보다 나은 삶의 질을 유지할 수 있도록 노력하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>신경 내과</h4>
                                    <h6>Neurology</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>신경 내과</h3>
                            <h5>경련, 발작, 마비, 선회, 운동실조 등의신경증상을 보이는 환자들에 대해서
                                    전반적인 스크리닝 검사와 신경계 검사를 진행하여 문제가 있는 부위를 
                                    찾은 후 의심부위에 대한 CT / MRI 촬영 및 뇌척수액(CSF)에 대한 
                                    세포학 검사, 단백질 정량검사, 항체가 검사, 배양 검사 및 PCR검사를 
                                    실시하여 정확한 원인을 찾아 치료하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>소화기 내과</h4>
                                    <h6>Digestive Internal Medicine</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>소화기 내과</h3>
                            <h5>급·만성의 구토, 설사, 식욕부진, 복부팽만, 복통 등의 소화기 증상을 
                                    보이는 환자들에게 분변검사, 혈액·혈청화학검사, X-ray / 초음파 검사 
                                    등의 기본적인 검사를 실시하여 증상의 유발 원인을 정확하게 찾아서 
                                    치료합니다. 환자에 따라서 췌장염 / 염증성 창자병 등에 대한 특수화학검사 
                                    및 감염성 질환에 대한 면역화학 / real-time PCR 검사 등을 
                                    추가적으로 실시하게 됩니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>피부과</h4>
                                    <h6>Dermatology</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>피부과</h3>
                            <h5>해마루 피부과에서는 기본적인 피부 스크리닝 검사 외에도 감염성 원인에
                                    대한 배양검사 및 PCR 검사, 혈액·혈청화학검사, 호르몬 검사, 알러지 검사, 
                                    피부생검 및 조직검사 등을 실시 하여 만성 난치성 피부질환의 근본적인 
                                    원인을 정확히 진단한 후 보호자와 환자 특성에 맞는 다양한 치료옵션을 
                                    제공해 드리고 있습니다.</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>