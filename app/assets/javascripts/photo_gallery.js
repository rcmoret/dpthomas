function setHeight() {
    divWidth = $('#photo-gallery').width() * 0.725;
    $('#photo-gallery').css('height', divWidth + 'px');
}

$(document).ready(function() {
    setHeight();
    $('.photos img:first-of-type').addClass('active')
})

window.onresize = function(ev) {
    setHeight()
}
