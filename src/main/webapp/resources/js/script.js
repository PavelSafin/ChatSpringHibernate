$(document).ready(function(){
    // auto-refresh task

    setInterval('updateChatHistory("nope")', 5000);


    // Post Message click handler
    $('a#postMessage').click(onClickPostMessage);

});


function onClickPostMessage() {
    var text = $('textarea#chatMessage').val();
    if ($.trim(text)) {
        postChatMessage(text);
    }
}

function updateChatHistory(email){
    //get new content through ajax

    $.ajax({
        type : 'GET',
        url : '/loadChatHistoryAJAX.json',
        dataType : 'json',
        data : {
            sender : email
        },
        success : function(data){
            $('#chat').html(data.data);
        },
        error : function(e) {
        }
    });
}



function postChatMessage(message) {
    $.ajax({
        type : 'POST',
        url : '/postMessageAJAX.json',
        dataType : 'json',
        data : {
            text : message,
        },
        success : function(response){
            if (response.status == 'SUCCESS') {
                $('textarea#chatMessage').val('');

            }
        },
        error : function(e) {
        }
    }).fail(function(jqXHR) {
    });

}
