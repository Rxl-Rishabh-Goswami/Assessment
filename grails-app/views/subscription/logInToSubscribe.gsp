<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Link Sharing</title>
    <g:if env="development"><asset:stylesheet src="index.css"/></g:if>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <g:link class="navbar-brand heading" style="font-size:30px;" controller="login" action="index"><b>Link Sharing</b></g:link>
    <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</nav>
<g:if test="${flash.wrongPassword}">
    <div class="alert alert-danger" role="alert">${flash.wrongPassword}</div>
</g:if>
<h3>${flash.message}</h3>
<div class="container" style="padding: 100px">
    <div class="boxy1" style="text-align: center">Log In To Subscribe</div>
    <div class="boxy2" style="text-align: center" style="font-size: larger">
        <h3>Hey ${user.firstName} Enter Your Password To Subscribe To Topic ${topic.name}</h3>
        <g:form controller="subscription" action="subscribeUsingMail">
            <g:hiddenField name="username" value="${user.username}"/>
            <g:hiddenField name="topicName" value="${topic.name}"/>
            <label>Password :</label>
            <g:passwordField name="password"></g:passwordField><br>
            <g:submitButton value="Submit" name="submit" class="btn btn-outline-success my-2 my-sm-0" ></g:submitButton>
        </g:form>
    </div>
</div>

</body>
</html>