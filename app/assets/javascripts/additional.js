$(document).ready(function() {
    $('#reply_form').hide();
    $('a#discussion_reply').click(function() {
        $('#reply_form').slideToggle();
    });
    $('#flash').hide(3000)
    windowWidth = window.innerWidth
    if (windowWidth < 786){
        $('#member-actions h3').click(function() {
            $('#action-items').slideToggle();
        });
    }
});
