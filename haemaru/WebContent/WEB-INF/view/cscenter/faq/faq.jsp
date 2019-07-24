<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FAQ</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub5-2.css">
    <link rel="stylesheet" href="/css/footer.css">
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
                    <h2>고객센터</h2>
                    <p>Customer Center</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="/cscenter/notice/notice.do">공지사항</a></li>
                    <li class="on"><a href="/cscenter/faq/faq.do">FAQ</a></li>
                    <li><a href="/cscenter/qna/qna.do">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>F A Q</h3>
                <p>해마루 이차진료 동물병원에서 여러분이 자주 궁금해 하시는 사항들을 안내 드립니다.</p>
                <div class="faq-area">
                    <form class="faq-search-btn" method="GET" action="text.php">
                        <input type="text" id="faq_search_input" placeholder="검색어를 입력하세요.">
                        <input type="submit" value="검색"  id="btn_submit_faq">
                    </form>
                    <div class="faq-box-group">
                        <ul class="faq-box">
                            <li>
                                <a href="#"><p><span>Q</span>심장사상충 약을 먹여도 되나요?</p></a>
                                <div class="faq-sub">
                                    <p>거의 대부분의 경우 심장사상충 약은 문제가 되지 않으므로 
                                        <br/>담당 주치의 선생님께서 별도로 말씀하지않으신 경우에는 심장사상충 약을 먹이거나 발라주셔도 괜찮습니다.
                                        <br/>간혹 아이 상태가 심각하게 좋지 않거나, 특정한 약물의 경우 심장사상충 예방약과 상호작용이 있을 수는 있으니 
                                        <br/>걱정되시는 경우에는 담당 주치의 선생님께 문의하시기 바랍니다.
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a href="#"><p><span>Q</span>다리에 감은 하얀 테이프는 언제 제거하나요?</p></a>
                                <div class="faq-sub">
                                    <p>거혈관 주사를 맞은 부위에 지혈 목적으로 감아둔 테이프입니다. 
                                        <br/>1시간 정도 지나면 제거해 주세요. 오래 두시면 피부 자극에 의해 염증이 발생할 수 있습니다.
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a href="#"><p><span>Q</span>진료 후 퇴원 후 잘 움직이지 않고 잠만 자요. 괜찮은 건가요?</p></a>
                                <div class="faq-sub">
                                    <p>병원에서 정성껏 돌보기 위해 노력하지만 낯선 환경이기 때문에 편안한 집에 돌아가면 평소보다 더 많이 자는 경우가 많습니다. 
                                        <br/>잠만 자려고 한다면 하루 정도 푹 쉴 수 있도록 해 주세요. 단 음식을 거부하고, 다른 아픈 증상 및 일어나지 못할 정도록 
                                        <br/>기력이 쳐지거나 의식이 둔한 것 같다면 병원으로 연락 주시기 바랍니다
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a href="#"><p><span>Q</span>처방식을 너무 안 먹는데, 다른 맛있는 것을 섞어 먹여도 되나요?</p></a>
                                <div class="faq-sub">
                                    <p> 처방식은 환자의 건강 상태에 따라 단백질, 탄수화물, 지방과 같은 주요 영양소의 비율을 조절하고 
                                        <br/>필요한 영양분을 추가하거나 제한한 특수 사료입니다. 다른 음식과 섞어서 주실 경우 영양소의 비율과 특수 성분의 제한이 변하기 때문에
                                        <br/>처방식의 특성을 잃게 됩니다. 처방식 건사료를 작 먹지 않는 경우 동일한 처방식 캔을 추가로 급여하시거나 
                                        <br/>단기적으로 기호성이 있는 음식을 소량 섞어서 주시다가 처방식만 급여하도록 합니다. 
                                        <br/>좋은 약이 몸에 쓴 것처럼 대부분의 처방식이 기호성은 일반 사료나 음식에 비해 떨어지기 때문에 
                                        <br/>원래 음식에 처방식을 조금씩 썩어서 점점 7~10일에 걸쳐 배율을 점점 늘려 최종적으로는 처방식만 먹도록 유도하시는 것이 좋습니다.
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a href="#"><p><span>Q</span>진료  수술 전 밥을 먹어야 하나요?</p></a>
                                <div class="faq-sub">
                                    <p>혈액검사나 복부초음파 검사가 예정된 환자일 경우 아침을 먹이지 않고 방문하는 것이 좋습니다. 
                                        <br/>검사 결과에 영향을 줄 수 있고 이동 거리가 긴 경우 멀미나 구토의 원인이 될 수 있습니다. 
                                        <br/>특히 수술이나 마취가 예정된 환자는 전날 저녁을 가볍게 먹이시고 내원 전 6~12시간의 절식이 필요합니다. 
                                        <br/>단, 4개월 미만의 강아지나 당뇨, 부신피질기능항진증, 신장기능 이상 등으로 평소 물을 자주 마시고 소변을 보는 환자들의 경우
                                        <br/>물은 먹이는 것이 좋습니다.(주치의 선생님께 음식을 먹고 내원했다는 것을 알려주세요)
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a href="#"><p><span>Q</span>약 복용 후 바로 토했는데 약을 다시 먹어야 하나요?</p></a>
                                <div class="faq-sub">
                                    <p>먹자 마자 약을 토했고 약이 구토물에서 보이는 경우 다시 먹이시는 것이 좋습니다. 
                                        <br/>하지만 30분이상 지나서 토하는 경우에는 다시 먹이시지 않는 것이 좋습니다. 
                                        <br/>특히 항암제의 경우에는 수의사 선생님께 문의해 지시를 따르시기 바랍니다.
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a href="#"><p><span>Q</span>아이가 너무 떨어요 불안해서 그럴까요?</p></a>
                                <div class="faq-sub">
                                    <p>스트레스나 불안 등에 의해 떨 수도 있기 때문에 하루 정도 안정을 취하도록 하는 것이 좋습니다. 
                                        <br/>하지만 열이 통증에 의해 떨 수 도 있습니다. 체온계가 있다면 열이 있는지 여부를 확인하는 것이 좋습니다. 
                                        <br/>개와 고양이의 정상 체온은 38~39°C입니다. 41°C 이상으로 열이 지속되면 병원에 데리고 오셔야 하며 미열이 지속되는 경우에도 
                                        <br/>진료를 받는 것이 좋습니다. 통증이 있는 경우 만지면 아파하거나 신음소리를 내고 몸에 힘을 많이 주고 있게 됩니다. 
                                        <br/>계속 아파한다면 진통제 처방과 관련해 주치의 선생님 상담을 받으시길 바랍니다.
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a href="#"><p><span>Q</span>채혈한 곳이 파랗게 변했어요.</p></a>
                                <div class="faq-sub">
                                    <p>채혈 또는 카테터를 제거한 후에는 충분히 압박해서 지혈을 하지만 채혈 시 환자가 갑자기 움직여 주변으로 출혈이 발생하거나 
                                        <br/>활동이 많은 경우 멍이 들기도 합니다. 대부분 수일에 걸쳐 멍이 점점 옅어져 없어지게 됩니다. 
                                        <br/>만졌을 때 아파하거나 열감이 없다면 괜찮지만 아파하거나 열이 있는 듯하면 주치의에게 문의하시기 바랍니다. 
                                        <br/>하지만 채혈하거나 천자 검사를 하지 않은 곳이 멍이 발생하면 혈액 지혈과 관련된 이상이 발생되었을 가능성이 있으니 
                                        <br/>반드시 주치의에게 문의하셔야 합니다.
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <ul class="faq-number clear">
                            <li><a href="#"></a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>