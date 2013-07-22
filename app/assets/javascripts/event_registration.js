function calculateFee(adults, adultFee, childFee) {
    var adults = $('#registration_adults').val()
    var adultFee = $('#adult_fee').text();
    var children = $('#registration_children').val()
    var childFee = $('#child_fee').text();
    registrationFee = (adults * adultFee) + (children * childFee)
    return "$" + registrationFee
}


$(document).ready(function() {
    if (!$('#event_has_registration').is(':checked')) {
        $('#registration_fees').hide();
    }
    $('#event_has_registration').click(function() {
        $('#registration_fees').slideToggle();
    });

    $('#registration select').change(function() {
        $('#total_fee').text(calculateFee());
    });
});
