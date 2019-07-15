$(function(){
    //슬라이더
    var slidermove = 0;
    function sliderfade (){
        $('.banner-btn li').removeClass('on');
        $('.banner-btn li').eq(slidermove).addClass('on');
        $('.panel > div').stop().fadeOut(1200);
        $('.panel > div').eq(slidermove).stop().fadeIn(1200,function(){
            textshow();
          
        });
    };
    function textshow(){

        if(slidermove == 1) {

            $('.text-js-1').textyle({
                duration : 500,
                easing : 'swing'
            });
            $('.text-js-2').textyle({
                duration : 400,
                delay : 50,
                easing : 'swing',
                callback : function(){
                    $(this).css({
                        color : '#83c1aa',
                        transition : '1s',
                    // more css here
                    });
                    
                }
            });
           
        }
        else{}
    }
    $('.banner-btn li').click(function(){

        slidermove = $(this).index();
        sliderfade();
       
    });
    $('.next').click(function(){
        if(slidermove == 2) {   
                                slidermove = 0;
                                
                            }
        else{slidermove++;}
        sliderfade();
    })
    $('.prev').click(function(){
        if(slidermove == 0) {slidermove = 2;}
        else{slidermove--;}
        sliderfade();
    })
    $('.circle-text').textyle({
        duration : 400,
        delay : 100,
        easing : 'swing',
        callback : function(){
            $(this).css({
                color : '#fff',
                transition : '1s',
            // more css here
            });
        }
    });

    // 3번째 베너 동적 기능
    $('.view-3 li').mouseenter(function(){
        var view3move = $(this).index();
        if(view3move == 0){
            $(this).stop().animate({"width":"1000px"});
        }
        else if(view3move==1){
        }
        else if(view3move==2){
            $(this).stop().animate({"width":"1100px"});
            $(this).find(".view3-img-3").stop().animate({"margin-left":"100px"});
        }
        $(this).find(".section-text").stop().fadeIn(600);
    });
    $('.view-3 li').mouseleave(function(){
        var view3move = $(this).index();
        if(view3move == 0){
            $(this).stop().animate({"width":"900px"});
        }
        else if(view3move==1){
        }
        else if(view3move==2){
            $(this).stop().animate({"width":"1000px"});
            $(this).find(".view3-img-3").stop().animate({"margin-left":"0px"});
        }
        $(this).find(".section-text").stop().fadeOut(600);
    });
});