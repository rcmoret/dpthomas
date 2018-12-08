function setHeight(image) {
    var section = $('section#photo-gallery')
    var container = $(section).parent('div')
    var maxWidth = container.width() * 0.9
    var imgWidth = $(image).width()
    var imgHeight = $(image).height()
    var ratio = imgWidth >= maxWidth ? (maxWidth / imgWidth) : 1
    var newHeight = ratio * imgHeight
    $(image).height(newHeight + 'px')
}

function transition(currentImg, nextImg) {
    var section = $('section#photo-gallery')
    var container = $(section).parent('div')
    var maxWidth = container.width() * 0.9
    var imgWidth = $(nextImg).width()
    var imgHeight = $(nextImg).height()
    var width = imgWidth > maxWidth ? maxWidth : imgWidth
    var ratio = imgWidth >= maxWidth ? (maxWidth / imgWidth) : 1
    var newHeight = ratio * imgHeight
    $(currentImg).removeClass('active')
    $(nextImg).addClass('active')
    $(nextImg).height(newHeight + 'px')
}

function initSlider() {
    var images = $('#photo-gallery img')
    var imageCount = images.length;
    var index = 0
    setInterval(function() {
        image = images[index]
        if (index === (imageCount - 1)) {
            index = 0
        } else {
            index += 1
        }
        transition($(image), $(images)[index])
    }, 3000)
}

$(document).ready(function() {
  var firstImage = $('#photo-gallery img.active')[0]
  setHeight(firstImage)
})

window.onload = function start() {
  initSlider();
}
