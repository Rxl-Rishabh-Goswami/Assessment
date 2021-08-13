<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Link Sharing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <g:if env="development"><asset:stylesheet src="index.css"/></g:if>
    <g:if env="development"><asset:stylesheet src="background.css"/></g:if>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <asset:javascript src="search.js"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
<g:render template="/template/navbar"/>
<g:if test="${flash.nullError}">
    <div class="alert alert-danger" role="alert">${flash.nullError}</div>
</g:if>
<div class="container">
    <div class="row">
        <div class="cool col-lg-5">
            <div class="boxy1">Trending Topic
            </div>

            <div class="boxy2">
                <g:if test="${topic}">
                    <g:each in="${topic}">
                        <g:if test="${user.admin || (it.user == user)}">
                            <div class="nonEdit" style="font-size: 15px">
                                <g:link controller="user" action="index" params="[userID: it.user.id]">
                                    <asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp"
                                                 alt="Profile Picture"/></g:link>
                                <div style="font-size:15px;">
                                %{--<g:if test="${user.subscriptions.topic.contains(it)}">--}%
                                    <g:if test="${assessment.Subscription.findByUserAndTopic(user, it)}">
                                        <g:link controller="topic" action="index" params="[topicID: it.id]">
                                            <span style="font-weight: bolder;">${it.name}</span>&nbsp;&nbsp;</g:link>
                                        <span>
                                            <g:if test="${!(it.user == user)}">
                                                <button class="btn btn-danger"
                                                        onclick="unsubscribe('${it.id}')">Unsubscribe</button></g:if>
                                        </span>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="topic" action="index" params="[topicID: it.id]">
                                            <span style="font-weight: bolder;">${it.name}</span>&nbsp;&nbsp;
                                        </g:link>
                                        <span style="float: right">
                                            <button class="btn btn-success"
                                                    onclick="subscribe('${it.id}')">Subscribe</button>
                                        </span>
                                    </g:else>
                                &nbsp;&nbsp; <button style="float: right"
                                                     class="openEdit btn btn-warning ">Edit</button>&nbsp;<br>
                                    <g:link controller="user" action="index" params="[userID: it.user.id]">
                                        <span class="un">@${it.user.username}</span><br>
                                    </g:link>
                                    <span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
                                    <span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>${assessment.Resource.countByTopic(it)}</span>
                                </div>

                            </div><br><hr>

                            <div class="editTopicByOwner" style="font-size: 15px">
                                <div>
                                    <g:link controller="user" action="index" params="[userID: it.user.id]">
                                        <asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp"
                                                     alt="Profile Picture"/></g:link>
                                    <p>
                                        <g:form style="display: inline-block" controller="topic" action="editTopic">
                                            <g:textField type="text" name="newName" value='${it.name}'/>
                                            <g:hiddenField name="topicID" value="${it.id}"/>
                                            <g:submitButton name="submit" value="Submit"
                                                            class="btn btn-outline-success my-2 my-sm-0"/>
                                        </g:form>&nbsp;&nbsp;<button style="display: inline-block" type="button"
                                                                     class="btn btn-outline-danger closeEdit"
                                                                     aria-label="Close">X</button>
                                    </p>

                                    <br>
                                    <g:link controller="user" action="index" params="[userID: it.user.id]">
                                        <span class="un">@${it.user.username}</span><br>
                                    </g:link>
                                    <span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
                                    <span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>${assessment.Resource.countByTopic(it)}</span>
                                </div><br>

                                <div>
                                    <p>
                                        <g:form style="display: inline-block" controller="topic"
                                                action="changeVisibility" params="[topicID: it.id]">
                                            <g:select onchange="submit(name)" name="Pri"
                                                      from="${[0: 'Public', 1: 'Private']}" value="${it.visibility}"
                                                      optionKey="key" optionValue="value"/>
                                        </g:form>

                                        <g:if test="${assessment.Subscription.findByUserAndTopic(user, it)}">
                                            <g:form style="display: inline-block" controller="subscription"
                                                    action="changeSeriousness" params="[topicID: it.id]">
                                                <g:select onchange="submit(name)" name="Ser"
                                                          from="${[0: 'Serious', 1: 'Very Serious', 2: 'Casual']}"
                                                          value="${assessment.Subscription.findByUserAndTopic(user, it).seriousness}"
                                                          optionKey="key" optionValue="value"/>
                                            </g:form>
                                        </g:if>
                                        <button style="display: inline-block; float: right"
                                                onclick="deleteTopic('${it.id}')"
                                                class="btn btn-outline-dark fa fa-trash fa-lg"></button>&nbsp;
                                    %{--<g:link controller="topic" action="delete2" class="fa fa-trash fa-lg" params="[topicID: it.id]"></g:link>&nbsp;--}%
                                        <button style="display: inline-block; float: right" data-toggle="modal"
                                                data-target="#editTopic"
                                                class="btn btn-outline-dark fa fa-file-text fa-lg"></button>&nbsp;
                                        <button style="display: inline-block; float: right" data-toggle="modal"
                                                data-target="#sendInviteByTopic"
                                                class="btn btn-outline-dark fa fa-envelope fa-lg"></button>&nbsp;
                                    <g:render template="/template/sendInviteByTopic" model="[topicName: it.name]"/>
                                    </p>
                                </div>
                            </div><br><hr>
                        </g:if>
                        <g:else>
                            <div style="font-size: 15px">
                                <g:link controller="user" action="index" params="[userID: it.user.id]">
                                    <asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp"
                                                 alt="Profile Picture"/></g:link>
                                <div style="font-size:15px;">
                                    <g:if test="${assessment.Subscription.findByUserAndTopic(user, it)}">
                                        <g:link controller="topic" action="index" params="[topicID: it.id]">
                                            <span style="font-weight: bolder;">${it.name}</span></g:link>&nbsp;&nbsp;
                                        <span style="float: right">
                                            <button class="btn btn-danger"
                                                    onclick="unsubscribe('${it.id}')">Unsubscribe</button>
                                        </span><br>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="topic" action="index" params="[topicID: it.id]"><span
                                                style="font-weight: bolder;">${it.name}</span></g:link>&nbsp;&nbsp;
                                        <span style="float: right">
                                            <button class="btn btn-success"
                                                    onclick="subscribe('${it.id}')">Subscribe</button>
                                        </span><br>
                                    </g:else>
                                    <g:link controller="user" action="index" params="[userID: it.user.id]">
                                        <span class="un">@${it.user.username}</span><br>
                                    </g:link>
                                    <span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
                                    <span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>${assessment.Resource.countByTopic(it)}</span>
                                </div>

                            </div><br><hr>
                        </g:else>
                    </g:each>
                </g:if>

            </div>
        </div>

        <div class="col-lg-1"></div>

        <div class="cool col-lg-6">
            <div class="boxy1">Search for
                <span>${searchKey}</span>
            </div>

            <div class="searchBox boxy2">
                <g:each in="${searchPost}">
                    <div>
                        <asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
                        <div>
                            <span style="font-weight:bolder; font-size: 15px;">${it.user.firstName} ${it.user.lastName}</span>
                            <span class="un">@${it.user.username} 5min</span>
                            <span style="float: right;"><g:link controller="topic" action="index"
                                                                params="[topicID: it.topic.id]">${it.topic.name}</g:link></span>
                        </div>

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
            <div class="boxy1">Recent Posts
            </div>

            <div class="boxy2">
                <g:each in="${recent}">
                    <div>
                        <asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
                        <div>
                            <span style="font-weight:bolder; font-size: 15px;">${it.user.firstName} ${it.user.lastName}</span>
                            <span class="un">@${it.user.username} 5min</span>
                            <span style="float: right;"><g:link controller="topic" action="index"
                                                                params="[topicID: it.topic.id]">${it.topic.name}</g:link></span>
                        </div>

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
</div>


<g:render template="/template/createTopic"/>


<g:render template="/template/shareDocument"/>


<g:render template="/template/sendInvite"/>


<g:render template="/template/shareLink"/>


<g:render template="/template/editTopic"/>

<div class="bg"></div>

<div class="bg bg2"></div>

<div class="bg bg3"></div>








<script>
    $('.editTopicByOwner').hide();
    $('.openEdit').click(function () {
        $('.nonEdit').hide();
        $('.editTopicByOwner').show();
    });
    $('.closeEdit').click(function () {
        $('.nonEdit').show();
        $('.editTopicByOwner').hide();
    });
</script>

</body>
</html>