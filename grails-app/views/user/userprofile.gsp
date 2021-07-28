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
<g:render template="/template/navbar"/>
	<div class="container">
		<div class="row">
			<div class="boxy col-lg-5">
				<div class="boxy2">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div style="font-size:15px;">
  							<span style="font-weight: bolder;">${user.firstName} ${user.lastName}</span><br>
  							<span class="un">@${user.username}</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Topics</span><br>
  							<span>${assessment.Subscription.countByUser(user)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  							<span>${assessment.Topic.countByUser(user)}</span>
  						</div>

					</div>
				</div>
			</div>
			<div class="boxy col-lg-7">
				<div class="boxy1"> Posts
					<span style="font-size:10px; float: right;">
						<input type="text" placeholder="Search..">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</span>
				</div>
				<div class="boxy2">
					<div>
  						<div>
  							<span style="font-weight:bolder; font-size: 15px;">Uday Pratap Singh</span>
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
  								<a href="www.google.com">Download</a>&nbsp;&nbsp;
  								<a href="www.google.com">View Full Site</a>&nbsp;&nbsp;
  								<a href="www.google.com">Mark As Read</a>&nbsp;&nbsp;
  								<a href="www.google.com">View Post</a>
  							</span>
  						</div>

					</div><br><br><br><hr>
					<div>
  						<div>
  							<span style="font-weight:bolder; font-size: 15px;">Uday Pratap Singh</span>
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
  								<a href="www.google.com">Download</a>&nbsp;&nbsp;
  								<a href="www.google.com">View Full Site</a>&nbsp;&nbsp;
  								<a href="www.google.com">Mark As Read</a>&nbsp;&nbsp;
  								<a href="www.google.com">View Post</a>
  							</span>
  						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="boxy col-lg-5">
			<div class="boxy1">Topics</div>
			<div>
  				<div style="font-size:15px;">
  					<span style="font-weight: bolder;">Grails</span>&nbsp;&nbsp;<span><a href="#">Unsubscribe</a></span><br>
  					<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  					<span>50</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  					<span>20</span>
  						<div>
							<select name="Seriousness">
	  							<option value="Serious">Serious</option>
	  							<option value="Very_Serious">Very Serious</option>
	  							<option value="Critical">Critical</option>
							</select>
							<a href="#" class="fa fa-envelope"></a>
  						</div>
  					</div>

			</div><hr>
			<div>
  				<div style="font-size:15px;">
  					<span style="font-weight: bolder;">Grails</span><br>
  					<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  					<span>50</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  					<span>20</span>
  						<div>
							<a href="#">Subscribe</a>
  						</div>
  					</div>

			</div>
		</div>

		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="boxy col-lg-5">
				<div>
				<div class="boxy1">Subscriptions</div>
  				<div style="font-size:15px;">
  				<span><a href="#">Grails</a></span><br>
  					<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  					<span>50</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  					<span>20</span>
  						<div>
							<select name="Seriousness">
								<option value="Serious">Serious</option>
								<option value="Very_Serious">Very Serious</option>
								<option value="Critical">Critical</option>
							</select>
							<a href="#" class="fa fa-envelope"></a>
  						</div>
  					</div>

			</div><hr>
			</div>
		</div>
	</div>



<g:render template="/template/createTopic"/>


<g:render template="/template/shareDocument"/>


<g:render template="/template/sendInvite"/>


<g:render template="/template/shareLink"/>
</body>
</html>