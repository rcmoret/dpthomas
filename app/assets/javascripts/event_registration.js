$(document).ready(function() {
    if (!$('#event_has_registration').is(':checked')) {
        $('#registration_fees').hide();
    }
    $('#event_has_registration').click(function() {
        $('#registration_fees').slideToggle();
    });
});
