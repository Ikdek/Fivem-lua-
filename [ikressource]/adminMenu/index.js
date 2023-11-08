window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.showUI) {
        $('.OurDiv').show();
    } else {
        $('.OurDiv').hide();
    }
});
function noclip() {
    $.post("http://adminMenu/noclip", JSON.stringify({}));
    return
}

function heal() {
    $.post("http://adminMenu/heal", JSON.stringify({}));
    return
}

function feed() {
    $.post("http://adminMenu/feed", JSON.stringify({}));
    return
}

function god() {
    $.post("http://adminMenu/god", JSON.stringify({}));
    return
}

function weapon() {
    $.post("http://adminMenu/weapon", JSON.stringify({}));
    return
}