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





	<div class="container">
	<div class="row">
		<div class="boxy col-lg-5">
			<div class="boxy1">Topic : <span>${topic.name}</span></div>
			<div>
  				<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  				<div style="font-size:15px;">
  					<span style="font-weight: bolder;">${topic.name}</span>&nbsp;&nbsp;<span><a href="#">Unsubscribe</a></span><br>
  					<span class="un">@${topic.user.username}</span><br>
  					<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  					<span>${assessment.Subscription.countByTopic(topic)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					<span>${assessment.Resource.countByTopic(topic)}</span>
  						<div>
							<select id="Seriousness" name="Seriousness">
	  							<option value="volvo">Serious</option>
	  							<option value="saab">Very Serious</option>
	  							<option value="saab">Critical</option>
							</select>
							<a href="#" class="fa fa-envelope"></a>
  						</div>
  					</div>

			</div>
		</div>
		<div class="boxy col-lg-7">
				<div class="boxy1"> Posts :
					<span>${topic.name}</span>
					<span style="float:right;">
						<select>
							<option>${topic.name}</option>
						</select>
					</span>
				</div>
				<div class="boxy2">
					<g:each in="${topic.resources}">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
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

					</div><br><br><br><hr>
					</g:each>
				</div>
			</div>	

	</div>
	<div class="row">
		<div class="boxy col-lg-5">
				<div class="boxy1">User :
					<span>${topic.name}</span>

				</div>
				<div class="boxy2">
					<g:each in="${topic.user}">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div style="font-size:15px;">
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
</body>
</html>