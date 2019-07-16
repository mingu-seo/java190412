$(function(){
    AOS.init();
    var sub4_1_list = 0;
    $('.tab-list li').click(function(e){
        e.preventDefault();
        sub4_1_list = $(this).index();
        
        $('.tab-list li').removeClass('on')
        $('.tab-list li').eq(sub4_1_list).addClass('on')
        $('.tab-group > div').stop().fadeOut();
        $('.tab-group > div').eq(sub4_1_list).stop().fadeIn();

    });
});