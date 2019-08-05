$(function(){
    
    // gnb & tab
    $(".gnb > li").mouseenter(function(){
        $(".header-sub").stop().fadeIn();     
    });
    $(".gnb > li").mouseleave(function(){
        $(".header-sub").stop().fadeOut();
    });
    //login start
    $('.loginBtn').click(function(e){
        e.preventDefault();
        $('#login, #login-wrap').stop().fadeIn(500);
    });
    $('.back-arrow, .login-close').click(function(e){
        e.preventDefault();
        $('#login,#login-wrap').stop().fadeOut(500);
    });

    //join start
    $('.login-sub-btn li:eq(1), .joinBtn').click(function(e){
        e.preventDefault();
        $('#join-area, #login-wrap').stop().fadeIn(500);
    });
    $('.join-back-arrow, #btn_reset').click(function(e){
        e.preventDefault();
        $('#join-area').stop().fadeOut(500);
    });
    //창 닫기 버튼
    $('.join-head img, .head-box img, .pass-head img, .pass-chk-head, #login-wrap ').click(function(e){
        e.preventDefault();
        $('#join-area, #login, #pass-lost, #pass-chk, #login-wrap').stop().fadeOut(500);
    });
    //비밀번호 찿기
    $('.login-sub-btn li:eq(0)').click(function(e){
        e.preventDefault();
        $('#pass-lost, #login-wrap').stop().fadeIn(500);
    });
    $('.pass-back-arrow').click(function(e){
        e.preventDefault();
        $('#pass-lost').stop().fadeOut(500);
    });
    //비밀번호 인증번호 확인창
    $('#pass-lost-submit').click(function(e){
        e.preventDefault();
        $('#pass-chk, #login-wrap').stop().fadeIn(500);
    });
    $('.pass-chk-back-arrow').click(function(e){
        e.preventDefault();
        $('#pass-chk').stop().fadeOut(500);
    });

    //con2 -tab menu
    var list = 0;
    var con2tab = setInterval(tab2, 10000);
    function con2tabslider(){ 
        $('.con2-tab-list > li').removeClass('on');
        $('.con2-tab-list > li').eq(list).addClass('on');
        $('.con2-tab-box-area').stop().fadeOut(600);
        $('.con2-tab-box-area').eq(list).fadeIn(600);}
    function tab2(){
        if(list == 3 ){list=0}
        else {list++;}
       con2tabslider();
    }
    $('.con2-tab-list > li').click(function(e){
        e.preventDefault();
        list = $(this).index();
        con2tabslider();
    })
    $('.con2-info6').mouseenter(function(){
        clearInterval(con2tab);
    })
    $('.con2-info6').mouseleave(function(){
        con2tab = setInterval(tab2, 10000);
    })
    //끝

    //예약 마지막 확인창
    $('.doc-btn').click(function(e){
        e.preventDefault();
        $('.reservation-ck-page').stop().fadeIn(500);
    });
    $('.headline > img').click(function(e){
        e.preventDefault();
        $('.reservation-ck-page').stop().fadeOut(500);
    });
//    $('.re-check-ck-in').click(function(e){
//        e.preventDefault();
//        $('.reservation-page').stop().fadeIn(500);
//    });
    $('.re-check-ck-out').click(function(e){
        e.preventDefault();
        $('.reservation-ck-page').stop().fadeOut(500);
    });

    //예약 확인창
    $('.headline > img').click(function(e){
        e.preventDefault();
        $('.reservation-page').stop().fadeOut(500);
    });
    $('.re-check-in').click(function(e){
        e.preventDefault();
        $('.reservation-page, .reservation-ck-page').stop().fadeOut(500);
    });
    
    // 입양후기등록 확인창
    $('.review-last-box').click(function(e){
        e.preventDefault();
        $('.abopt-page').stop().fadeIn(500);
    });
    $('.headline > img').click(function(e){
        e.preventDefault();
        $('.abopt-page').stop().fadeOut(500);
    });
    $('.abopt-check-in').click(function(e){
        e.preventDefault();
        $('.abopt-page').stop().fadeOut(500);
    });
    // faq 게시판
    $('.faq-box > li > a').click(function(e){
        e.preventDefault();
        var faqlist = $(this).hasClass('of');
        if(faqlist) {
            $(this).removeClass('of');
            $(this).siblings('.faq-sub').slideUp(500);
        }
        else {
            $('.faq-box > li > a').removeClass('of');
            $('.faq-sub').stop().slideUp(500);
            $(this).addClass('of');
            $(this).siblings('.faq-sub').stop().slideDown(500);
        }
    });
    //예약 취소 창
    $('.re-cancel2-check-in').click(function(e){
        e.preventDefault();
        $('.reservation-cancel-page').stop().fadeIn(500);
    });
    $('.headline > img').click(function(e){
        e.preventDefault();
        $('.reservation-cancel-page').stop().fadeOut(500);
    });
    $('.re-cancel-check-in').click(function(e){
        e.preventDefault();
        $('.reservation-cancel-page').stop().fadeOut(500);
    });
    $('.re-cancel2-check-out').click(function(e){
        e.preventDefault();
        $('.reservation-cancel2-page').stop().fadeOut(500);
    });
    //예약 취소 확인 창
    $('.cancel-btn > a').click(function(e){
        e.preventDefault();
        $('.reservation-cancel2-page').stop().fadeIn(500);
    });
    $('.headline > img').click(function(e){
        e.preventDefault();
        $('.reservation-cancel2-page').stop().fadeOut(500);
    });
    $('.re-cancel-check-in').click(function(e){
        e.preventDefault();
        $('.reservation-cancel2-page').stop().fadeOut(500);
    });
   
    
});