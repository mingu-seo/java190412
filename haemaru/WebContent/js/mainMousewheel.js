$(function(){
    var move = $(window).scrollTop();
    $('#container > div ').mousewheel(function(event,delta){
        if( delta < 0){ // 마우스 휠 내렸을때
            move = $(this).next().offset().top; 
            
        }
        else {
            move = $(this).prev().offset().top;
           
        }
        $('html,body').stop().animate({"scrollTop":move+'px'},600,"jswing");
  
    });
    move = 0;
    //fix menu 시작
    var list =0;
    $('.fix-menu li').click(function(){
        list = $(this).index();
       
        move = $('#container > div ').eq(list).offset().top;
        $('html,body').stop().animate({"scrollTop":move},800);
    });
    $(window).scroll(function(){
        var scpoint = $(this).scrollTop();
        
        var sec01 = $('#container > div:eq(0)').offset().top;
        var sec02 = $('#container > div:eq(1)').offset().top;
        var sec03 = $('#container > div:eq(2)').offset().top;
        var sec04 = $('#container > div:eq(3)').offset().top;
        var sec05 = $('#container > div:eq(4)').offset().top;
        
        $('.fix-menu li').removeClass('os');
        if(scpoint >= sec01 && scpoint < sec02 ){$('.fix-menu li:eq(0)').addClass('os'); $('.fix-menu-box').css({'opacity':0});}
        else if (scpoint >= sec02 && scpoint < sec03){  $('.fix-menu-box').css({'opacity':1});
                                                        $('.fix-menu li:eq(1)').addClass('os'); 

                                                    }
        else if (scpoint >= sec03 && scpoint < sec04){  $('.fix-menu-box').css({'opacity':1});                                                     
                                                        $('.fix-menu li:eq(2)').addClass('os');
                                                    }
             else if (scpoint >= sec04 && scpoint < sec05){  $('.fix-menu-box').css({'opacity':1});                                                     
                                                        $('.fix-menu li:eq(3)').addClass('os');
                                                    }                                       
        else if (scpoint >= sec05 ){$('.fix-menu-box').css({'opacity':1});$('.fix-menu li:eq(4)').addClass('os');}
    });
    // 끝
});