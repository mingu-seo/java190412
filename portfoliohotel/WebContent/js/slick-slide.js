$(function(){

    $('.panel').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll:1,
        centerMode:true,
        variableWidth: true,
        prevArrow:".slick-prev",
        nextArrow:".slick-next"
    });


    $('.panel').on('beforeChange', function(event, slick, currentSlide, nextSlide){
        $(".room_intro").stop().fadeOut();
        $(".room-intro-wrap .room_intro").eq(nextSlide).stop().fadeIn();
    });
    
    $('.sub_page_panel').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll:1,
        centerMode:true,
        variableWidth: true,
        prevArrow:".slick-prev",
        nextArrow:".slick-next"
    });



    $('.promotion_list').slick({
        infinite:true,
        slidersToShow:3,
        slidesToScroll:1,
        variableWidth: true,
        autoplay: true,
        autoplaySpeed: 5000
    });

});