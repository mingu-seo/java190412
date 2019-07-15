$(function(){

    var stafflist = 0;
    $('.tab-info').isotope({
        itemSelector: '.staff1',
        layoutMode: 'fitRows'
    });
    $('.tab-list li').click(function(e){
        e.preventDefault();
        stafflist = $(this).index();
        $('.tab-list li').removeClass('on');
        $('.tab-list li').eq(stafflist).addClass('on');
        var staffvalue = $(this).attr('data-staff');
        $('.tab-info').isotope({
            filter:staffvalue,
            transitionDuration:1200
        });
    });
});