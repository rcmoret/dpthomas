function setHeight(divId) {
    divWidth = $(divId).width() * 0.8;
    $(divId).css('height', divWidth + 'px');
}

function slider(div_id) {
    var images = $('#' + div_id + ' img')
    var imageCount = images.length - 1;
    var index = 0
    setInterval( function() {
        image = images[index]
        if (index === imageCount) {
            index = 0
        } else {
            index += 1
        }
        $((images)[index]).addClass('active')
        $(image).removeClass('active')
    }, 3000)
}

function orderSideDivs() {
    sideDivs = [$('#photo-gallery')]
    if(window.innerWidth <= '768') {
        $.each(sideDivs, function() {
            $(this).appendTo('#content .right')
        })
    } else {
        if($('#title-bar h2').text() === 'Home Page') {
            $('#photo-gallery').appendTo('#content .right')
        } else {
            $.each(sideDivs, function() {
                $(this).appendTo('#content .left')
            })
        }
    }
}

$(document).ready(function() {
    setHeight('#photo-gallery');
    setHeight('#walk-run-gallery');
    $('#side-bar-photos img:first-of-type').addClass('active')
    $('#event-photos img:first-of-type').addClass('active')
})

window.onload = function start() {
    slider('side-bar-photos');
    slider('event-photos');
}

window.onresize = function(ev) {
    setHeight('#photo-gallery');
    setHeight('#walk-run-gallery');
    orderSideDivs();
}
