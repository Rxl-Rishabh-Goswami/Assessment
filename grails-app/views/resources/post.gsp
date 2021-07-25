<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Link Sharing</title>
	<g:if env="development"><asset:stylesheet src="index.css"/></g:if>
	<g:if env="development"><asset:stylesheet src="Rating.css"/></g:if>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand heading" href="#" style="font-size:30px;"><b>Link Sharing</b></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<a class="nav-link" href="#"><i class="fa fa-envelope fa-2x"></i></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#"><i class="fa fa-lightbulb-o fa-2x"></i>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-user fa-2x"></i>&nbsp;<span>${user.firstName}</span>

				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<g:link class="dropdown-item" controller="user" action="index">Profile</g:link>
					<g:link class="dropdown-item" controller="user" action="index">Users</g:link>
					<g:link class="dropdown-item" controller="topic" action="index">Topics</g:link>
					<g:link class="dropdown-item" controller="resources" action="index">Posts</g:link>
					<div class="dropdown-divider"></div>
					<g:link class="dropdown-item" controller="login" action="logout">Log Out</g:link>
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#"><i class="fa fa-file-text fa-2x"></i>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#"><i class="fa fa-link fa-2x"></i>
				</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</nav>
	<div class="container">
	<div class="row">
		<div class="boxy col-lg-7">
				<div class="boxy2">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div>
  							<span style="font-weight:bolder; font-size: 15px;">Uday Pratap Singh</span>
  							<span class="un">@uday 5min</span>
  							<span style="float: right;"><a href="www.google.com">Grails</a></span>
  						</div>
  						
  							<span>Time&Date</span>
  							<div class="container justify-content-center">
							    <div class="stars">
							        <form action=""> <input class="star star-5" id="star-5" type="radio" name="star" /> <label class="star star-5" for="star-5"></label> <input class="star star-4" id="star-4" type="radio" name="star" /> <label class="star star-4" for="star-4"></label> <input class="star star-3" id="star-3" type="radio" name="star" /> <label class="star star-3" for="star-3"></label> <input class="star star-2" id="star-2" type="radio" name="star" /> <label class="star star-2" for="star-2"></label> <input class="star star-1" id="star-1" type="radio" name="star" /> <label class="star star-1" for="star-1"></label> </form>
							    </div>
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
  								<a href="www.google.com">Download</a>&nbsp;&nbsp;
  								<a href="#">Delete</a>&nbsp;&nbsp;
  								<a href="#">Edit</a>&nbsp;&nbsp;
  								<a href="www.google.com">View Post</a>
  							</span>
  						</div>

					</div>
				</div>
			</div>
			<div class="boxy col-lg-5">
				<div class="boxy1">Trending Topics
				</div>
				<div class="boxy2">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div style="font-size:15px;">
  							<span>Uday Pratap Singh</span>
  							<br>
  							<span class="un">@uday</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  							<span>50</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  							<span>20</span>
  							<div>
  								<select id="Privacy" name="Privacy">
  									<option value="volvo">Private</option>
  									<option value="saab">Public</option>
								</select>
								<select id="Seriousness" name="Seriousness">
	  								<option value="volvo">Serious</option>
	  								<option value="saab">Very Serious</option>
	  								<option value="saab">Critical</option>
								</select>
								<a href="#">Edit</a>
								<a href="#">Delete</a>
  							</div>

  						</div>

					</div><br><hr>
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div style="font-size:15px;">
  							<span><a href="#">Grails</a></span>&nbsp;&nbsp;
  							<span><a href="#">Subscribe</a></span><br>
  							<span class="un">@uday</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  							<span>50</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  							<span>20</span>
  						</div>

					</div>
				</div>
			</div>
	</div>
	</div>
</body>
</html>