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

function orderSideDivs() {
    sideDivs = [$('.facebook'), $('#photo-gallery')]
    if(window.innerWidth <= '768') {
        $.each(sideDivs, function() {
            $(this).appendTo('#content .right')
        })
    } else {
        $.each(sideDivs, function() {
            $(this).appendTo('#content .left')
        })
    }
}

$(document).ready(function() {
    orderSideDivs();
    setHeight();
    $('.photos img:first-of-type').addClass('active')
})

window.onload = function start() {
    slider();
}

window.onresize = function(ev) {
    setHeight();
    orderSideDivs();
}
