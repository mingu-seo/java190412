$(function(){
    var scTop = 0;   // 스크롤바의 위치값을 알아내는 변수

    //스크롤바 위치에 따른 배경색 변경 함수
    function headerBg(){
        if(scTop > 0) {
            $("#header").addClass("on");
        }
        else {
            $("#header").removeClass("on");
        }
    }

    // header gnb 마우스올렸을때 서브내려오는 효과
    $(".pc-gnb > li").mouseenter(function(){
        // header gnb 마우스 올렸을때 header백그라운드컬러 변경
       
        $("#header").addClass("on");
        $(this).children("div").stop().fadeIn(500);
        
    });
    $(".pc-gnb > li").mouseleave(function(){
        $(this).children("div").stop().fadeOut(500);
        headerBg();
    });

    //스크롤 했을때 헤더 배경색상 변경 효과
    $(window).scroll(function(){
        scTop = $(this).scrollTop();
        headerBg();
    });
});