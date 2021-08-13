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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <g:link class="navbar-brand heading" style="font-size:30px;" controller="login" action="index"><b>Link Sharing</b></g:link>
    <g:form controller="search" action="searchPage" class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchKey">
        <g:submitButton class="btn btn-outline-success my-2 my-sm-0" name="submit" value="Submit"/>
    </g:form>
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="cool col-lg-7">
            <div class="boxy1"> Search for
                <span>${searchKey}</span>
            </div>
            <div class="boxy2">
                <g:each in="${searchPost}">
                    <div>
                        <asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
                        <div>
                            <span style="font-weight:bolder; font-size: 15px;">${it.user.firstName} ${it.user.lastName}</span>
                            <span class="un">@${it.user.username} 5min</span>
                            <span style="float: right;"><g:link controller="topic" action="index" params="[topicID:it.topic.id]">${it.topic.name}</g:link></span>
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
                                <g:if test="${it.hasProperty('filePath')}"><g:link controller="resources" action="downloadDocument" id="${it.id}">Download</g:link>&nbsp;&nbsp;</g:if>
                                <g:if test="${it.hasProperty('linkurl')}">
                                    <g:link target="_blank" url="${it.linkurl}">View Full Site</g:link>&nbsp;&nbsp;
                                </g:if>
                            </span>
                        </div>

                    </div><br><br><br><br><br><br><hr>
                </g:each>
            </div>
        </div>
    </div>

</div>


<div class="bg"></div>
<div class="bg bg2"></div>
<div class="bg bg3"></div>

</body>
</html>