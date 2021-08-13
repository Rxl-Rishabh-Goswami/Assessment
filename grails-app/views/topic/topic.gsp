<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Link Sharing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <g:if env="development"><asset:stylesheet src="index.css"/></g:if>
    <g:if env="development"><asset:stylesheet src="background.css"/></g:if>
    <asset:javascript src="markAsRead.js"></asset:javascript>


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
        <div class="cool col-lg-5">
            <div class="boxy1">Topic : <span>${topic.name}</span></div>

            <div>
                <asset:image src="${topic.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
                <div style="font-size:15px;">
                %{--<span style="font-weight: bolder;">${topic.name}</span>&nbsp;&nbsp;<span><a href="#">Unsubscribe</a></span><br>--}%
                    <g:if test="${assessment.Subscription.findByUserAndTopic(user, topic)}">
                        <g:link controller="topic" action="index" params="[topicID: topic.id]">
                            <span style="font-weight: bolder;">${topic.name}</span>&nbsp;&nbsp;</g:link>
                        <span>
                            <g:if test="${!(topic.user == user)}">
                                <button style="float: right" class="btn btn-danger"
                                        onclick="unsubscribe('${topic.id}')">Unsubscribe</button><br></g:if>
                        </span>
                    </g:if>
                    <g:else>
                        <g:link controller="topic" action="index" params="[topicID: topic.id]">
                            <span style="font-weight: bolder;">${topic.name}</span>&nbsp;&nbsp;
                        </g:link>
                        <span style="float: right">
                            <button class="btn btn-success" onclick="subscribe('${topic.id}')">Subscribe</button><br>
                        </span>
                    </g:else>


                    <span class="un">@${topic.user.username}</span><br>
                    <span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
                    <span>${assessment.Subscription.countByTopic(topic)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>${assessment.Resource.countByTopic(topic)}</span>

                    <div>
                    <p><g:if test="${topic.user == user}">
                        <g:form style="display: inline-block" controller="topic" action="changeVisibility" params="[topicID:topic.id]">
                        <g:select onchange="submit(name)" name="Pri" from="${[0: 'Public', 1: 'Private']}" value="${topic.visibility}" optionKey="key" optionValue="value"/>
                        </g:form>

                        </g:if>
                        <g:if test="${assessment.Subscription.findByUserAndTopic(user, topic)}">
                            <g:form style="display: inline-block" controller="subscription" action="changeSeriousness"
                                    params="[topicID: topic.id]">
                                <g:select onchange="submit(name)" name="Ser"
                                          from="${[0: 'Serious', 1: 'Very Serious', 2: 'Casual']}"
                                          value="${assessment.Subscription.findByUserAndTopic(user, topic).seriousness}"
                                          optionKey="key" optionValue="value"/>
                            </g:form>&nbsp;
                            <g:if test="${topic.user == user}">
                            %{--<button style="display: inline-block; float: right" controller="topic" action="delete2" class="btn btn-outline-dark fa fa-trash fa-lg"></button>&nbsp;&nbsp;&nbsp;--}%
                            %{--<button style="display: inline-block; float: right" controller="topic" action="delete2" class="btn btn-outline-dark fa fa-trash fa-lg"></button>&nbsp;&nbsp;&nbsp;--}%
                                <g:link type="button"
                                        params="[topicID: topic.id]"
                                        style="display: inline-block; float: right"
                                        class="btn btn-outline-dark fa fa-trash fa-lg"
                                        controller="topic" action="delete2"/>
                                <button style="display: inline-block; float: right" data-toggle="modal"
                                        data-target="#editTopic"
                                        class="btn btn-outline-dark fa fa-file-text fa-lg"></button>&nbsp;&nbsp;&nbsp;
                                <g:render template="/template/editTopic"
                                          model="[topicID: topic.id, topicName: topic.name]"/>
                            </g:if>
                            <button style="display: inline-block; float: right" data-toggle="modal"
                                    data-target="#sendInviteByTopic"
                                    class="btn btn-outline-dark fa fa-envelope fa-lg"></button>&nbsp;
                            <g:render template="/template/sendInviteByTopic" model="[topicName: topic.name]"/></p>
                        </g:if>
                    </div>
                </div>

            </div>
        </div>

        <div class="col-lg-1"></div>

        <div class="cool col-lg-6">
            <div class="boxy1">Posts :
                <span>${topic.name}</span>
            </div>

            <div class="boxy2">
                <g:each in="${topic.resources}">
                    <div>
                        <asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
                        <div>
                            <p>${it.description}</p>
                        </div>

                        <div>
                            <span style="float: left;">
                                <a href="#" class="fa fa-facebook fa-2x"></a>
                                <a href="#" class="fa fa-twitter fa-2x"></a>
                                <a href="#" class="fa fa-google fa-2x"></a>
                            </span>
                            <span style="float: right;">
                                <g:if test="${it.hasProperty('filePath')}"><g:link controller="resources"
                                                                                   action="downloadDocument"
                                                                                   id="${it.id}">Download</g:link>&nbsp;&nbsp;</g:if>
                                <g:if test="${it.hasProperty('linkurl')}">
                                    <g:link target="_blank" url="${it.linkurl}">View Full Site</g:link>&nbsp;&nbsp;
                                </g:if>
                                <g:link controller="resources" action="index"
                                        params="[resourceID: it.id]">View Post</g:link>&nbsp;&nbsp;

                            </span>
                        </div>

                    </div><br><br><br><br><br><br><hr>
                </g:each>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="cool col-lg-5">
            <div class="boxy1">User :
                <span>${topic.name}</span>

            </div>

            <div class="boxy2">
                <g:each in="${topic.subscriptions.user}">
                    <div>
                        <asset:image src="${it.photo}" class="img-circle img-thumbnail dp"
                                     alt="Profile Picture"/>                        <div style="font-size:15px;">
                        <span style="font-weight: bolder;">${it.firstName} ${it.lastName}</span><br>
                        <span class="un">@${it.username}</span><br>
                        <span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Topics</span><br>
                        <span>${assessment.Subscription.countByUser(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>${assessment.Resource.countByUser(it)}</span>

                    </div>

                    </div><br><br><br><br><hr>
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
</body>
</html>