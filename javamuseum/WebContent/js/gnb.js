$(function(){
    //헤더 메뉴 구문
    $(".h-menu > li").mouseenter(function(){
        $(".sub-menu").stop().fadeIn();
        $(".h-bot").addClass("on");
        $(".h-menu > li > a").css({"color":"black"})
        $(".logo").addClass("on");
        $(".h-bot-line").show();
    })
    $(".h-menu > li").mouseleave(function(){
        $(".sub-menu").stop().fadeOut();
        $(".h-bot").removeClass("on");
        $(".h-menu > li > a").css({"color":"white"})
        $(".logo").removeClass("on");
        $(".h-bot-line").hide();
    })


    //스크롤했을때 TOP 버튼 등장 소멸

    $(window).scroll(function(){
       var sctop = $(this).scrollTop(); // 스크롤바의 현재 위치가 어디인지 알아내는 구문
        
        if(sctop > 1000) {

        $(".fixed-top").fadeIn();
    //         $(".h-menu > li > a").css({"color":"black"});
    //         $(".logo").addClass("on");
        }
        else {
        $(".fixed-top").fadeOut();
    //         $(".h-menu > li > a").css({"color":"white"});
    //         $(".logo").removeClass("on");
        };
    });
});