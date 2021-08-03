<!DOCTYPE html>
<html>
<head>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <g:link controller="login" action="dashboard" class="navbar-brand heading" style="font-size:30px;">Link Sharing</g:link>
    <g:if test="!${admin}">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" data-toggle="modal" data-target="#sendInvite"><i class="fa fa-envelope fa-2x"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#createTopic"><i class="fa fa-lightbulb-o fa-2x"></i>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-user fa-2x"></i>&nbsp;<span>${user.firstName}</span>

                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <g:if test="${user.admin}"><g:link class="dropdown-item" controller="user" action="adminUser">Users</g:link></g:if>

                    <g:link class="dropdown-item" controller="user" action="changeProfile">Profile</g:link>
                    <g:if test="${user.admin}"><g:link class="dropdown-item" controller="topic" action="index">Topics</g:link></g:if>
                    <g:if test="${user.admin}"><g:link class="dropdown-item" controller="resources" action="index">Posts</g:link></g:if>
                    <div class="dropdown-divider"></div>
                    <g:link class="dropdown-item" controller="login" action="logout">Log Out</g:link>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#shareDocument"><i class="fa fa-file-text fa-2x"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#shareLink"><i class="fa fa-link fa-2x"></i>
                </a>
            </li>
        </ul>
        <g:form controller="search" action="searchPage" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchKey">
            <g:submitButton class="btn btn-outline-success my-2 my-sm-0" name="submit" value="Submit"/>
        </g:form>
    </div>
</g:if>
</nav>

</body>
</html>