$(function(){
    $(".faq-q").click(function(event){
        event.preventDefault();
        var viewoff = $(this).next(".faq-answer").hasClass("view")
        if(viewoff) {

            $(".faq-answer").removeClass("view");

        }
        else {
            $(".faq-answer").removeClass("view");
            $(this).next(".faq-answer").addClass("view");
        }
    });
});