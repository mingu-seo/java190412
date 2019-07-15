$(function(){
    //슬라이더 움직일때 변수 세팅

    var list = 0; // 버튼 클릭시 인덱스 번호 알아내는 변수
    var len = $(".slider-btn li").length; //태그 갯수 총3개

    // javascript
    $(".slider-btn li").click(function(){
        list=$(this).index();
        $(".slider-btn li").removeClass("on");
        $(this).addClass("on");

        //화면전환 기능
        $(".slider > div").stop().fadeOut();
        $(".slider > div").eq(list).stop().fadeIn();
    });
    
    var slideatuo = setInterval(function(){

        if(list == len-1) {

            list = 0;
        }

        else {

            list++;
        }

        $(".slider-btn li").removeClass("on");
        $(".slider-btn li").eq(list).addClass("on");
        $(".slider > div").stop().fadeOut();
        $(".slider > div").eq(list).stop().fadeIn();

    },5000)

});