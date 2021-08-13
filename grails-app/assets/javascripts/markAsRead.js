function markAsRead(resourceID){
    let dataUrl= "http://localhost:9091/readingItem/isRead"
    $.ajax({
        "url":dataUrl,
        "type": "get",
        "data":{resourceID:resourceID},
        success: function() {
            setTimeout(function() {
                window.location.reload()
            },1000)
        }
    })
}
function unsubscribe(topicID) {
    let dataUrl = "http://localhost:9091/subscription/removeSubscription"
    $.ajax({
        "url":dataUrl,
        "type": "get",
        "data":{subID:topicID},
        success: function() {
            setTimeout(function() {
                window.location.reload()
            },1000)
        }
    })

}
function subscribe(topicID) {
    let dataUrl = "http://localhost:9091/subscription/addSubscription"
    $.ajax({
        "url":dataUrl,
        "type": "get",
        "data":{subID:topicID},
        success: function() {
            setTimeout(function() {
                window.location.reload()
            },1000)
        }
    })

}
function changePrivacy(topicID,Pri){
    console.log("Testttt")
    console.log(topicID)
    console.log(Pri)
    let dataUrl="http://localhost:9091/topic/changePrivacy"
    $.ajax({
        "url":dataUrl,
        "type": "get",
        "data":{topicID:topicID,Pri:Pri},
        success: function() {
            console.log("success")
            setTimeout(function() {
                window.location.reload()
            },1000)
        }
    })
}
function deleteTopic(topicID) {
    let dataUrl="http://localhost:9091/topic/delete2"
    $.ajax({
        "url":dataUrl,
        "type": "get",
        "data":{topicID:topicID},
        success: function() {
            setTimeout(function() {
                window.location.reload()
            },1000)
        }
    })
}


function editTopicName(topicID,newName) {
    let dataUrl="http://localhost:9091/topic/editTopic"
    $.ajax({
        "url":dataUrl,
        "type": "post",
        "data":{topicID:topicID,newName:newName},
        success: function() {
            setTimeout(function() {
                window.location.reload()
            },1000)
        }
    })
}



function removeSpaces(string) {
    return string.split(' ').join('');
}

// $("#update").click(function(e) {
//     e.preventDefault();
//     let newName = $("#newName").val();
//     let topicID = $("#topicID").val();
//     $.ajax({
//         type:'POST',
//         data:{topicID:topicID,newName:newName},
//         url:'http://localhost:9091/topic/editTopic',
//         success:function() {
//             console.log("HEYY")
//             setTimeout(function() {
//                 window.location.reload()
//             },1000)
//         }
//     });
// });



