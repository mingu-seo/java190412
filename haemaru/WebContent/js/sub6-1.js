$(function(){

// 나의정보수정 창
$('.myinfo-btn').click(function(e){
    e.preventDefault();
    $('#join-area').stop().fadeIn(500);
});
$('#btn_reset1, .myinfo-back-arrow, .myinfo-head img').click(function(e){
    e.preventDefault();
    $('#join-area').stop().fadeOut(500);
});


// 반려동물 수정 창
/*
$('.sub6-more').click(function(e){
    e.preventDefault();
    $('#mypet-area').stop().fadeIn(500);
});
*/
$('.mypet-back-arrow, #btn_reset2, .mypet-head img').click(function(e){
    e.preventDefault();
    $('#mypet-area').stop().fadeOut(500);
});

// 반려동물 추가 창
$('.pet-plus-more').click(function(e){
    e.preventDefault();
    $('#pet-plus').stop().fadeIn(500);
});
$('.petplus-back-arrow, #btn_reset3, .petplus-head img').click(function(e){
    e.preventDefault();
    $('#pet-plus').stop().fadeOut(500);

});


});