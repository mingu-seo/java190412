$(function(){
    // 달력 javascript
    $( "#start-date" ).datepicker({
        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        dateFormat: "yy-mm-dd",
        yearRange: "2019:2019",
        minDate: "0D" 
    });

    $("#end-date").datepicker({
        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        dateFormat: "yy-mm-dd",
        yearRange: "2019:2019",
        minDate: "0D" 
    }); 
});