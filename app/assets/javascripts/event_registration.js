function totalParticipants() {
    var adults = $('#registration_adults').val();
    var children = $('#registration_children').val();
    if ((children + adults) === '') {
        return 0
    } else {
        return children + adults
    }
}

function calculateFee() {
    var adults = $('#registration_adults').val();
    var adultFee = $('#adult_fee').text();
    var children = $('#registration_children').val();
    var childFee = $('#child_fee').text();
    return (adults * adultFee) + (children * childFee)
}


$(document).ready(function() {
    if (!$('#event_has_registration').is(':checked')) {
        $('#registration_fees').hide();
    }
    $('#event_has_registration').click(function() {
        $('#registration_fees').slideToggle();
    });

    $('#registration select').change(function() {
        $('#registration_fee').text('($' + calculateFee() + ')');
    });
    $('form#new_registration').submit(function(ev) {
        // if (totalParticipants() === 0) {
        //     ev.preventDefault();
        //     alert('You need to be registering at least one participant');
        // }
    });
});
