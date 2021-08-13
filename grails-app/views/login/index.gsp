<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Link Sharing</title>
    <g:if env="development"><asset:stylesheet src="index.css"/></g:if>
    <g:if env="development"><asset:stylesheet src="background.css.css"/></g:if>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <asset:javascript src="login.js"></asset:javascript>
    <asset:javascript src="markAsRead.js"></asset:javascript>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <g:link class="navbar-brand heading" style="font-size:30px;" controller="login"
            action="index"><b>Link Sharing</b></g:link>
    <g:form controller="search" action="searchPage" class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchKey">
        <g:submitButton class="btn btn-outline-success my-2 my-sm-0" name="submit" value="Submit"/>
    </g:form>
</nav>

<g:if test="${flash.error}">
    <div class="alert alert-danger" role="alert">${flash.error}</div>
</g:if>
<g:if test="${flash.forgetPasswordTokenExpired}">
    <div class="alert alert-danger" role="alert">${flash.forgetPasswordTokenExpired}</div>
</g:if>
<g:if test="${flash.message}">
    <div class="alert alert-success" role="alert">${flash.message}</div>
</g:if>
<g:if test="${flash.changePassword}">
    <div class="alert alert-success" role="alert">${flash.changePassword}</div>
</g:if>
<g:if test="${flash.errorChangePassword}">
    <div class="alert alert-danger" role="alert">${flash.errorChangePassword}</div>
</g:if>
<g:if test="${flash.logOut}">
    <div class="alert alert-warning" role="alert">${flash.logOut}</div>
</g:if>
<g:if test="${flash.emailChangePassword}">
    <div class="alert alert-success" role="alert">${flash.emailChangePassword}</div>
</g:if>
<g:if test="${flash.logoutMessage}">
    <div class="alert alert-danger" role="alert">${flash.logoutMessage}</div>
</g:if>
<g:if test="${flash.registerError}">
    <div class="alert alert-danger" role="alert">${flash.registerError}</div>
</g:if>
<g:if test="${flash.subscriptionDone}">
    <div class="alert alert-success" role="alert">${flash.subscriptionDone}</div>
</g:if>
<g:if test="${flash.alreadySubscribed}">
    <div class="alert alert-warning" role="alert">${flash.alreadySubscribed}</div>
</g:if>


<div class="container">
    <div class="row">
        <div class="cool col-lg-6">
            <div class="boxy1">Recent Shares</div>

            <div class="boxy2 recentPost">
                %{--<g:each in="${recent}">--}%
                %{--<div>--}%
                %{--<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>--}%
                %{--<div>--}%
                %{--<span>${it.user.firstName} ${it.user.lastName}</span>--}%
                %{--<span class="un">@${it.user.username} 5min</span>--}%
                %{--<span style="float: right;"><a href="www.google.com">${it.topic.name}</a></span>--}%
                %{--</div>--}%
                %{--<div>--}%
                %{--<p>${it.description}</p>--}%
                %{--</div>--}%
                %{--<div>--}%
                %{--<span style="float: left;">--}%
                %{--<a href="#" class="fa fa-facebook fa-2x"></a>--}%
                %{--<a href="#" class="fa fa-twitter fa-2x"></a>--}%
                %{--<a href="#" class="fa fa-google fa-2x"></a>--}%
                %{--</span>--}%
                %{--<span style="float: right;">--}%
                %{--<a href="www.google.com">View Post</a>--}%
                %{--</span>--}%
                %{--</div>--}%

                %{--</div><br><br><br><br><br><br><hr>--}%
                %{--</g:each>--}%

            </div>
        </div>

        <div class="col-lg-1"></div>

        <div class="cool col-lg-5 mr-auto">
            <div class="boxy1">Log in</div>

            <div class="boxy2">
                <g:form controller="Login" action="loginuser" method="POST">
                    <div class="form-group">
                        <label>Username</label>
                        <g:textField onBlur="this.value=removeSpaces(this.value)" class="form-control" name="username" placeholder="Enter Username/Email"
                                     required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Password</label>
                        <g:passwordField class="form-control" name="password" placeholder="Enter Password"
                                         required="true"/>
                    </div>
                    <g:submitButton class="btn btn-outline-success" value='Submit' name="submit"/>
                </g:form>
                <g:link controller="login" action="forgetPassword">Forgot Password?</g:link>
            </div><hr><br><br><br><br>

            <div class="boxy1">Register</div>

            <div class="boxy2">
                <g:uploadForm controller="Login" action="register" method="POST">
                    <div class="form-group">
                        <label>First Name</label>
                        <g:textField onBlur="this.value=removeSpaces(this.value)" class="form-control" name="firstName" placeholder="Enter First Name"
                                     required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Last Name</label>
                        <g:textField onBlur="this.value=removeSpaces(this.value)" class="form-control" name="lastName" placeholder="Enter Last Name"
                                     required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <g:field onBlur="this.value=removeSpaces(this.value)" type="email" class="form-control" name="email" placeholder="Enter Email ID"
                                 required="true"/>
                    </div>

                    <div class="form-group">
                        <label>User Name</label>
                        <g:textField onBlur="this.value=removeSpaces(this.value)" class="form-control" name="username" placeholder="Enter User Name"
                                     required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Password</label>
                        <g:passwordField class="form-control" name="password" placeholder="Enter Password"
                                         required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Confirm Password</label>
                        <g:passwordField class="form-control" name="confirm" placeholder="Enter Password Again"
                                         required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Profile Photo</label>
                        <input id="file" onchange="validateFileSize()" type="file" name="profilePhoto">
                    </div>

                    <g:submitButton class="btn btn-outline-success" name="submit" value="Submit"/>
                </g:uploadForm>
            </div>
        </div>
    </div>

    <div class="row">
        <div class=" cool col-lg-6">
            <div class="boxy1">
                <span>Top Posts</span>
            </div>

            <div class="boxy2 topPost">
                %{--<g:each in="${top}">--}%
                %{--<div>--}%
                %{--<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>--}%
                %{--<div>--}%
                %{--<span>${it.user.firstName} ${it.user.lastName}</span>--}%
                %{--<span class="un">@${it.user.username} 5min</span>--}%
                %{--<span style="float: right;"><a href="www.google.com">${it.topic.name}</a></span>--}%
                %{--</div>--}%
                %{--<div>--}%
                %{--<p>${it.description}</p>--}%
                %{--</div>--}%
                %{--<div>--}%
                %{--<span style="float: left;">--}%
                %{--<a href="#" class="fa fa-facebook fa-2x"></a>--}%
                %{--<a href="#" class="fa fa-twitter fa-2x"></a>--}%
                %{--<a href="#" class="fa fa-google fa-2x"></a>--}%
                %{--</span>--}%
                %{--<span style="float: right;">--}%
                %{--<a href="www.google.com">View Post</a>--}%
                %{--</span>--}%
                %{--</div>--}%

                %{--</div><br><br><br><br><br><br><hr>--}%
                %{--</g:each>--}%
            </div>
        </div>

    </div>
</div>

<div class="bg"></div>

<div class="bg bg2"></div>

<div class="bg bg3"></div>



<script>
    validateFileSize = () => {
        const fi = document.getElementById('file');
        // Check if any file is selected.
        for (let i = 0; i <= fi.files.length - 1; i++) {

            const fsize = fi.files.item(i).size;
            const file = Math.round((fsize / 1024));
            // The size of the file.
            if (file >= 128) {
                alert(
                    "File too Big, please select a file less than 128KB");
            } else {
                return true
            }
        }
    }
</script>

</body>
</html>