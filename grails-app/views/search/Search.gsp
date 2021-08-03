<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Link Sharing</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<g:if env="development"><asset:stylesheet src="index.css"/></g:if>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<g:render template="/template/navbar"/>
<g:if test="${flash.nullError}">
	<div class="alert alert-danger" role="alert">${flash.nullError}</div>
</g:if>
	<div class="container">
	<div class="row">
			<div class="boxy col-lg-5">
				<div class="boxy1">Subscriptions
				</div>
				<div class="boxy2">
					<g:each in="${subscribe}">
					<div>
						<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
  						<div style="font-size:15px;">
  							<input type="text" name="topicname" value="Grails">
  							<button class="btn btn-outline-success my-2 my-sm-0">Save</button>
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
								<a href="#" class="fa fa-envelope"></a>
								<a href="#" class="fa fa-file-text"></a>
								<a href="#" class="fa fa-trash"></a>
  							</div>

  						</div>

					</div><br><hr>
					</g:each>
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
			<div class="boxy col-lg-7">
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
  							<span style="float: right;"><a href="www.google.com">${it.topic.name}</a></span>
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
  								<a href="www.google.com">Download</a>&nbsp;&nbsp;
  								<a href="www.google.com">View Full Site</a>&nbsp;&nbsp;
  								<a href="www.google.com">Mark As Read</a>&nbsp;&nbsp;
  								<a href="www.google.com">View Post</a>
  							</span>
  						</div>

					</div><br><br><br><br><br><br><hr>
					</g:each>
				</div>
			</div>
		</div>
			<div class="row">
				<div class="boxy col-lg-5">
					<div class="boxy1">Recent Posts
				</div>
				<div class="boxy2">
					<g:each in="${recent}">
					<div>
						<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
  						<div>
  							<span style="font-weight:bolder; font-size: 15px;">${it.user.firstName} ${it.user.lastName}</span>
  							<span class="un">@${it.user.username} 5min</span>
  							<span style="float: right;"><a href="www.google.com">${it.topic.name}</a></span>
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
  								<a href="www.google.com">Download</a>&nbsp;&nbsp;
  								<a href="www.google.com">View Full Site</a>&nbsp;&nbsp;
  								<a href="www.google.com">Mark As Read</a>&nbsp;&nbsp;
  								<a href="www.google.com">View Post</a>
  							</span>
  						</div>

					</div><br><br><br><br><br><br><hr>
					</g:each>

				</div>
				</div>
			</div>
		</div>

</body>
</html>