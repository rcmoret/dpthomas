$(document).ready(function() {
    $('#reply_form').hide();
    var picker = new Pikaday({ field: $('#event_date')[0] });
    $('a#discussion_reply').click(function() {
        $('#reply_form').slideToggle();
    });
});
