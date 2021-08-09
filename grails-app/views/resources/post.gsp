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
<g:render template="/template/navbar"/>
	<div class="container">
	<div class="row">
		<div class="boxy col-lg-7">
				<div class="boxy2">
					<div>
						<asset:image src="${resource.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
  						<div>
  							<span style="font-weight:bolder; font-size: 15px;">${resource.user.firstName} ${resource.user.lastName}</span>
  							<span class="un">@${resource.user.username} 5min</span>
  							<span style="float: right;"><a href="www.google.com">${resource.topic.name}</a></span>
  						</div>
  						
  							<span>${resource.dateCreated}</span>
  							<div class="container justify-content-center">
							    <div class="stars">
							        <g:form controller="resourceRating" action="rating" params="[resourceID:resource.id]" >
										<input class="star star-5" id="star-5" type="radio" name="r" value="5"/>
										<label class="star star-5" for="star-5"></label>
										<input class="star star-4" id="star-4" type="radio" name="r" value="4"/>
										<label class="star star-4" for="star-4"></label>
										<input class="star star-3" id="star-3" type="radio" name="r" value="3"/>
										<label class="star star-3" for="star-3"></label>
										<input class="star star-2" id="star-2" type="radio" name="r" value="2"/>
										<label class="star star-2" for="star-2"></label>
										<input class="star star-1" id="star-1" type="radio" name="r" value="1"/>
										<label class="star star-1" for="star-1"></label><br>
										<g:submitButton name="submit" value="Submit"></g:submitButton>
									</g:form>
							    </div>
							</div>
  						
  						<div>
  							<p>${resource.description}</p>
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
					<g:each in="${topic}">
					<div>
						<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
  						<div style="font-size:15px;">
  							<span>${it.name}</span>
  							<br>
  							<span class="un">@${it.user.username}</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  							<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  							<span>${assessment.Resource.countByTopic(it)}</span>
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