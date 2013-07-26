$(document).ready(function() {
    $('#reply_form').hide();
    $('a#discussion_reply').click(function() {
        $('#reply_form').slideToggle();
    });
});
