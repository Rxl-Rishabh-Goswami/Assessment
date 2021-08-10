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
function changeVisibility(topicID,Pri){
    let dataUrl="http://localhost:9091/topic/changeVisibility"
    $.ajax({
        "url":dataUrl,
        "type": "get",
        "data":{topicID:topicID,Pri:Pri},
        success: function() {
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


function editTopicName(topicName,name) {
    let dataUrl="http://localhost:9091/topic/editTopicName"
    $.ajax({
        "url":dataUrl,
        "type": "get",
        "data":{topicName:topicName,name:name},
        success: function() {
            setTimeout(function() {
                window.location.reload()
            },1000)
        }
    })
}

