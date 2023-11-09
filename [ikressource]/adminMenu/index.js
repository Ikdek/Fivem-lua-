window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.showUI) {
        $('.OurDiv').show();
    } else {
        $('.OurDiv').hide();
    }
});
function noclip() {
    fetch(`https://${GetParentResourceName()}/getItemInfo`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({
        itemId: 'noclip'
    })
}).then(resp => resp.json()).then(resp => console.log(resp));
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