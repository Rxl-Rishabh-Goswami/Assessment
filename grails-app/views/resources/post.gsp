<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Link Sharing</title>
    <g:if env="development"><asset:stylesheet src="index.css"/></g:if>
    <g:if env="development"><asset:stylesheet src="Rating.css"/></g:if>
    <g:if env="development"><asset:stylesheet src="background.css"/></g:if>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
<g:render template="/template/navbar"/>
<div class="container">
    <div class="row">
        <div class="cool col-lg-6">
            <div class="boxy2">
                <div>
                    <asset:image src="${resource.user.photo}" class="img-circle img-thumbnail dp"
                                 alt="Profile Picture"/>
                    <div>
                        <span style="font-weight:bolder; font-size: 15px;">${resource.user.firstName} ${resource.user.lastName}</span>
                        <span class="un">@${resource.user.username} 5min</span>
                        <span style="float: right;"><g:link controller="topic" action="index"
                                                            params="[topicID: resource.topic.id]">${resource.topic.name}</g:link></span>
                    </div>

                    <span style="font-weight: lighter">Date Created: ${resource.dateCreated.dateString}</span>

                    <p id="sc">${userRate}</p>

                    <div class="container justify-content-center">
                        <div class="stars">
                            <input onclick="Rating('${resource.id}', '${5}')" class="star star-5" id="star-5"
                                   type="radio" name="r" value="5"/>
                            <label class="star star-5" for="star-5"></label>
                            <input onclick="Rating('${resource.id}', '${4}')" class="star star-4" id="star-4"
                                   type="radio" name="r" value="4"/>
                            <label class="star star-4" for="star-4"></label>
                            <input onclick="Rating('${resource.id}', '${3}')" class="star star-3" id="star-3"
                                   type="radio" name="r" value="3"/>
                            <label class="star star-3" for="star-3"></label>
                            <input onclick="Rating('${resource.id}', '${2}')" class="star star-2" id="star-2"
                                   type="radio" name="r" value="2"/>
                            <label class="star star-2" for="star-2"></label>
                            <input onclick="Rating('${resource.id}', '${1}')" class="star star-1" id="star-1"
                                   type="radio" name="r" value="1"/>
                            <label class="star star-1" for="star-1"></label>&nbsp;&nbsp;
                        </div>
                    </div>

                    <div style="font-size: 15px">
                        <span class="un"
                              style="font-size: 12px">No. of Ratings: ${assessment.ResourceRating.countByResource(resource)}</span>

                        <h3 style="font-size: 18px">Description:</h3>

                        <p>${resource.description}</p>
                    </div><br>

                    <div>
                        <span style="float: left;">
                            <a href="#" class="fa fa-facebook fa-2x"></a>
                            <a href="#" class="fa fa-twitter fa-2x"></a>
                            <a href="#" class="fa fa-google fa-2x"></a>
                        </span>
                        <span style="float: right;">
                            <g:if test="${resource.hasProperty('filePath')}"><g:link controller="resources"
                                                                                     action="downloadDocument"
                                                                                     id="${resource.id}">Download</g:link>&nbsp;&nbsp;</g:if>
                            <g:else><g:link target="_blank"
                                            url="${resource.linkurl}">View Full Site</g:link></g:else>&nbsp;&nbsp;
                            <g:if test="${user.admin || (user == resource.user)}">
                                <g:link controller="resources" action="delete2"
                                        params="[resourceID: resource.id]">Delete</g:link>&nbsp;&nbsp;
                                <a href="#" id="openEditPost">Edit</a>&nbsp;&nbsp;
                            </g:if>
                        </span>
                    </div>

                </div><br><br><br><hr><br>

                <div id="editPost">
                    <h3 style="text-align: center;font-weight: bolder;">Edit Post From Topic ${resource.topic.name}</h3>
                    <g:uploadForm controller="resources" action="resourceEdit">
                        <g:hiddenField name="resourceID" value="${resource.id}"/>
                        <div class="form-group">
                            <label>Topic Name</label>
                            <g:textField class="form-control" name="topicName" value="${resource.topic.name}"
                                         readonly="true"></g:textField>
                        </div>

                        <div class="form-group">
                            <label>Change Description</label>
                            <g:textField class="form-control" name="newDescription"></g:textField>
                        </div>

                        <div class="form-group">
                            <g:if test="${resource.hasProperty('filePath')}">
                                <label>Upload a new document</label>
                                <input class="form-control" type="file" name="newFile">
                            </g:if>
                            <g:else>
                                <label>Add New URL</label>
                                <g:textField class="form-control" name="newUrl"></g:textField>
                            </g:else>
                        </div>
                        <g:submitButton class="btn btn-outline-success" name="submit" value="Submit"></g:submitButton>
                    </g:uploadForm>
                </div>
            </div>
        </div>

        <div class="col-lg-1"></div>

        <div class="cool col-lg-5">
            <div class="boxy1">Trending Topics
            </div>

            <div class="boxy2">
                <g:each in="${topic}">
                    <div>
                        <asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
                        <div style="font-size:15px;">
                            <span><g:link controller="topic" action="index"
                                          params="[topicID: it.id]">${it.name}</g:link></span>
                            <br>
                            <span class="un">@${it.user.username}</span><br>
                            <span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
                            <span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span>${assessment.Resource.countByTopic(it)}</span>

                        </div>

                    </div><br><hr>
                </g:each>
            </div>
        </div>
    </div>
</div>


<g:render template="/template/createTopic"/>


<g:render template="/template/shareDocument"/>


<g:render template="/template/sendInvite"/>


<g:render template="/template/shareLink"/>





<div class="bg"></div>

<div class="bg bg2"></div>

<div class="bg bg3"></div>




<g:javascript>
	function Rating(resourceID, r) {
        let url = "${createLink(controller: 'resourceRating', action: "rating")}"
        $.ajax({
            "url": url,
            "type": "get",
            "data": {resourceID: resourceID, r: r},
            success: function () {
                setTimeout(function (){window.location.reload()},2000);

            }
        });

    }
    let score = document.getElementById("sc").innerText;
    switch (score) {
        case '1':
            $("#star-1").prop("checked", true);
            break;
        case '2':
            $("#star-2").prop("checked", true);
            break;
        case '3':
            $("#star-3").prop("checked", true);
            break;
        case '4':
            $("#star-4").prop("checked", true);
            break;
        case '5':
            $("#star-5").prop("checked", true);
            break;
     // $('#myModal').modal('show')
    }

</g:javascript>





<g:javascript>
    $(document).ready(function () {
        $('#editPost').hide()
        $("#openEditPost").click(function () {
            $("#editPost").toggle();
        });
    });
</g:javascript>

</body>
</html>