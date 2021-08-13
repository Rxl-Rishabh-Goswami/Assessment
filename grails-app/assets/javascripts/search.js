var searchRequest = null;

$(function () {
    var minlength = 3;

    $("#searchInbox").keyup(function () {
        let that = this,
            value = $(this).val();
        setTimeout(function() {
            $.ajax({
                type: "GET",
                url: "http://localhost:9091/search/searchAjax",
                data: {
                    searchKey : value
                },
                success: function(result){
                    let h = ""
                    $.each(result,function(index,value) {
                        let temp = `<div class="boxy2">
                    <div>
                        <asset:image src="${value.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
                        <div>
                            <span style="font-weight:bolder; font-size: 15px;">${value.firstName} ${value.lastName}</span>
                            <span class="un">@${value.username} 5min</span>
                            <span style="float: right;"><g:link controller="topic" action="index"
                                                                params="[topicID: it.topic.id]">${value.name}</g:link></span>
                        </div>

                        <div>
                            <p>${value.description}</p>
                        </div>

                        <div>
                            <span style="float: left;">
                                <a href="#" class="fa fa-facebook fa-2x"></a>
                                <a href="#" class="fa fa-twitter fa-2x"></a>
                                <a href="#" class="fa fa-google fa-2x"></a>
                            </span>
                            <span style="float: right;">
                                <g:if test="${value.hasProperty('filePath')}"><g:link controller="resources"
                                                                                   action="downloadDocument"
                                                                                   id="${value.id}">Download</g:link>&nbsp;&nbsp;</g:if>
                                <g:if test="${value.hasProperty('linkurl')}">
                                    <g:link target="_blank" url="${value.linkurl}">View Full Site</g:link>&nbsp;&nbsp;
                                </g:if>
                                <g:link controller="resources" action="index"
                                        params="[resourceID: ${value.id}]">View Post</g:link>&nbsp;&nbsp;

                            </span>
                        </div>

                    </div><br><br><br><br><br><br><hr>
            </div>`
                        h+=temp

                    })
                    $(".searchBox").html(h)
                }
            });

        },2000)


    });
});