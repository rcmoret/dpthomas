function setHeight() {
    divWidth = $('#photo-gallery').width() * 0.725;
    $('#photo-gallery').css('height', divWidth + 'px');
}

function slider() {
    var imageCount = $('.photos img').length - 1;
    var index = 0
    setInterval( function() {
        image = $('.photos img')[index]
        $(image).removeClass('active')
        if (index === imageCount) {
            index = 0
        } else {
            index += 1
        }
        image = $('.photos img')[index]
        $(image).addClass('active')
    }, 3000)
}

$(document).ready(function() {
    setHeight();
    $('.photos img:first-of-type').addClass('active')
})

window.onload = function start() {
    slider();
}

window.onresize = function(ev) {
    setHeight()
}
