<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>외과</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub2-1.css">
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
                    <li class="on"><a href="/department/surgery.do">외과</a></li>
                    <li ><a href="/department/surgery.do">내과</a></li>
                    <li><a href="/department/radiology.do">영상의학과</a></li>
                    <li><a href="/department/emergency.do">응급중환자의료센터</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>외과</h3>
                <p>Surgery</p>
                <div class="medicine-box clear">
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                                <div class="medicine-hover">
                                    <div class="medicine-opa">
                                        <h4>일반 외과</h4>
                                        <h6>General Surgery</h6>
                                        <img src="/icon/medicine-class.png">
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>일반 외과</h3>
                            <h5>일반 외과에서는 소화기, 비뇨기, 간담도계, 내분비계, 생기계, 귀질환과 같은 Soft tissue에 대한 수술을 진행하고 있습니다. 특히 내과 및 중환자 수의사와 협업하여 노령견에 있어 수술적인 접근이 필요한 종양이나 비뇨기계, 담도폐쇄에 대해 많은 수술을 진행하고 있습니다. 이런 수술을 진행함에 있어 최신 기법을 도입하여 레이저, 스텐트, 복강경 등 다양한 시술이 가능할 수 있도록 노력하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>흉부 외과</h4>
                                    <h6>Thoracic surgery</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>흉부 외과</h3>
                            <h5>흉부 외과에서는 접근하기 어려운 흉강 내에 발생한 질환에 대한 정밀한 수술들이 이루어지고 있습니다. 흉강 내를 지나가는 식도 관련 질환, 외상 혹은 선천적 이상으로 인한 다양한 형태의 탈장들, 동맥관 개존증이나 우대동맥궁 잔존증과 같은 혈관 기형, 폐실질 질환에 대해 숙련된 노하우를 바탕으로 수술을 실시하고 있습니다..</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>정형 외과</h4>
                                    <h6>Orthopedics</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>정형 외과</h3>
                            <h5>정형외과에서는 골절과 관절 질환의 수술적 교정을 담당합니다. 골절의 유형과 환자의 상태에 따라 내고정 혹은 외골격 고정술을 실시하며, 특히 일반적인 수술로는 치료가 어려운 복잡 골절과 개방성 골절에 대해서는 외골격 고정술을 적용하여 연부 조직의 손상을 최소화 하여 수술 후 빠른 치유가 가능하도록 만전을 기하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>신경 외과</h4>
                                    <h6>Neurosurgery</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>신경 외과</h3>
                            <h5>신경 검사를 통해 병변 부위를 국소화한 후 MRI검사를 통해 확진과 기타 질환과의 감별을 합니다. 필요한 경우 응급 수술을 통해 척수 손상이 추가적으로 발생하기 전에 탈출 된 디스크 물질을 제거하여 환자가 빠르게 회복할 수 있도록 하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>치과</h4>
                                    <h6>Dentist</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>치과</h3>
                            <h5>치과에서는 만성 질환이 있거나 노령 등의 이유로 마취가 어려운 환자의 예방적 스케일링에서부터 치주 질환이 있는 환자의 전문적인 치주치료까지 환자의 치아상태에 따른 치과 관리를 종합적으로 실시하고 있습니다. 육안이나 일반 방사선 사진으로 확인하기 힘든 치근, 치주의 질환이 의심될 경우, 보다 정밀히 진단하기 위하여 구강 내 방사선(Intraoral radiograph) 촬영을 실시합니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>안과</h4>
                                    <h6>Ophthalmology</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>안과</h3>
                            <h5>안과에서는 신경 안과적 검사에서부터 안저 검사까지 총체적인 안검사를 통해 다양한 안과 질환을 진단합니다. 안약 투약으로 치료 가능한 단순한 각결막 질환에서부터 안검 이상 교정을 위한 안검 성형, 첩모제거와 같은 기본 안과 수술을 포함하여, 백내장, 녹내장 수술과 같은 미세수술까지도 전문적으로 진행하고 있습니다. 또한 망막 전위도 검사(ERG) 통하여 선천성 망막 질환의 조기 진단이나 후천성 망막질환의 확진이 가능하며, 이 검사를 통하여 백내장 수술 이전에도 망막의 기능 이상 여부를 확인할 수 있습니다.</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>