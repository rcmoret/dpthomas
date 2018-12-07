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

$(document).ready(function() {
    setHeight('#photo-gallery');
})

window.onload = function start() {
    slider('side-bar-photos');
}

window.onresize = function(ev) {
    setHeight('#photo-gallery');
}
