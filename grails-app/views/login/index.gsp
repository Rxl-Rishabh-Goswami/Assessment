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
	<div class="container">
		<div class="row">
			<div class="boxy col-lg-7">
				<div class="boxy1">Recent Shares</div>
				<div class="boxy2">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div>
  							<span>Uday Pratap Singh</span>
  							<span class="un">@uday 5min</span>
  							<span style="float: right;"><a href="www.google.com">Grails</a></span>
  						</div>
  						<div>
  							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud</p>
  						</div>
  						<div>
  							<span style="float: left;">
  								<a href="#" class="fa fa-facebook fa-2x"></a>
								<a href="#" class="fa fa-twitter fa-2x"></a>
								<a href="#" class="fa fa-google fa-2x"></a>
  							</span>
  							<span style="float: right;">
  								<a href="www.google.com">View Post</a>
  							</span>
  						</div>

					</div><br><br><br><hr>
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div>
  							<span>Uday Pratap Singh</span>
  							<span class="un">@uday 5min</span>
  							<span style="float: right;"><a href="www.google.com">Grails</a></span>
  						</div>
  						<div>
  							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud</p>
  						</div>
  						<div>
  							<span style="float: left;">
  								<a href="#" class="fa fa-facebook fa-2x"></a>
								<a href="#" class="fa fa-twitter fa-2x"></a>
								<a href="#" class="fa fa-google fa-2x"></a>
  							</span>
  							<span style="float: right;">
  								<a href="www.google.com">View Post</a>
  							</span>
  						</div>

					</div>
				</div>
			</div>
			<div class="boxy col-lg-5 mr-auto">
				<div class="boxy1">Log in</div>
				<div class="boxy2">
					<g:form controller="Login" action="loginuser" method="POST" >
						<label>Username :</label>
						<g:textField name="username" placeholder="Enter Username/Email"/>
						<br>
						<label>Password :</label>
						<g:passwordField name="password" placeholder="Enter Password"/>
						<br>
						<g:submitButton value='Submit' name="submit"/>
					</g:form>
					<g:link controller="login" action="forgetPassword">Forget Password?</g:link>
				</div>
			</div>
		</div>
		<div class="row">
			<div class=" boxy col-lg-7">
				<div class="boxy1">
					<span>Top Posts</span>
					<span style="float: right;">
						<select name="date" style="font-size: small;">
							<option>Tomorrow</option>
							<option>Yesterday</option>
							<option>Day Before Yesterday</option>
							<option>Last Week</option>
						</select>
					</span>
				</div>
				<div class="boxy2">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div>
  							<span>Uday Pratap Singh</span>
  							<span class="un">@uday 5min</span>
  							<span style="float: right;"><a href="www.google.com">Grails</a></span>
  						</div>
  						<div>
  							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud</p>
  						</div>
  						<div>
  							<span style="float: left;">
  								<a href="#" class="fa fa-facebook fa-2x"></a>
								<a href="#" class="fa fa-twitter fa-2x"></a>
								<a href="#" class="fa fa-google fa-2x"></a>
  							</span>
  							<span style="float: right;">
  								<a href="www.google.com">View Post</a>
  							</span>
  						</div>

					</div>
				</div>
			</div>
			<div class="boxy col-lg-5">
				<div class="boxy1">Register</div>
				<div class="boxy2">
					<g:uploadForm controller="Login" action="register" method="POST" >
						<label>First Name</label>
						<g:textField name="firstName" placeholder="Enter First Name"/><br>
						<label>Last Name</label>
						<g:textField name="lastName" placeholder="Enter Last Name"/><br>
						<label>Email</label>
						<g:textField name="email" placeholder="Enter Email ID"/><br>
						<label>User Name</label>
						<g:textField name="username" placeholder="Enter User Name"/><br>
						<label>Password</label>
						<g:passwordField name="password" placeholder="Enter Password"/><br>
						<label>Confirm Password</label>
						<g:passwordField name="confirm" placeholder="Enter Password Again"/><br>
						<label>Profile Photo </label>
						<input type="file" name="profilePhoto"><br>

						<g:submitButton name="submit" value="Submit"/>
					</g:uploadForm>
				</div>
			</div>
		</div>
	</div>

</body>
</html>