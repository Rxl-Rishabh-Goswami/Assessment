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
<g:if test="${flash.loginMessage}">
	<div class="alert alert-success" role="alert">${flash.loginMessage}</div>
</g:if>
<g:if test="${flash.createTopic}">
	<div class="alert alert-success" role="alert">${flash.createTopic}</div>
</g:if>
<g:if test="${flash.inviteSent}">
	<div class="alert alert-success" role="alert">${flash.inviteSent}</div>
</g:if>
<g:if test="${flash.createLink}">
	<div class="alert alert-success" role="alert">${flash.createLink}</div>
</g:if>
<g:if test="${flash.createDocument}">
	<div class="alert alert-success" role="alert">${flash.createDocument}</div>
</g:if>

<div class="container">
		<div class="row">
			<div class="boxy col-lg-5">

				<div class="boxy2">
					<div>
						<g:link action="index" controller="user"><asset:image src="${user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/></g:link>
  						<div style="font-size:15px;">
  							<span style="font-weight: bolder;">${user.firstName + " " + user.lastName}</span><br>
  							<span class="un">@${user.username}</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Topics</span><br>
  							<span>${assessment.Subscription.countByUser(user)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  							<span>${assessment.Topic.countByUser(user)}</span>



  						</div>

					</div>
				</div>
			</div>
			<div class="boxy col-lg-7">
				<div class="boxy1"> Inbox</div>
				<div class="boxy2">
					<g:each in="${resource}">
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
								<g:if test="${it.hasProperty('filePath')}"><g:link>Download</g:link>&nbsp;&nbsp;</g:if>
								<g:if test="${it.hasProperty('linkurl')}">
									<g:link target="_blank" url="${it.linkurl}">View Full Site</g:link>&nbsp;&nbsp;
								</g:if>
								<g:else><g:link controller="resources" action="index" params="[resourceID:it.id]">View Post</g:link>&nbsp;&nbsp;</g:else>
								<g:link>Mark As Read</g:link>&nbsp;&nbsp;


  							</span>
  						</div>

					</div><br><br><br><br><br><br><hr>
					</g:each>

				</div>
			</div>
		</div>
		<div class="row">
			<div class="boxy col-lg-5">
				<div class="boxy1">Subscriptions
					 <span style="float:right;"><a href="#">View All</a></span>
				</div>
				<div class="boxy2">
					<g:each in="${topic}">
						<g:if test="${user.admin} || ${topic.user.username==user.username}">
							<div>
								<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
								<div style="font-size:15px;">
									<span style="font-weight: bolder;">${it.name}</span>&nbsp;&nbsp;<span><g:link controller="subscription" action="removeSubscription">Unsubscribe</g:link></span><br>
									<span class="un">@${it.user.username}</span><br>
									<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
									<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>${assessment.Resource.countByTopic(it)}</span>
									<div>
										<select  name="Privacy">
											<option value="Private">Private</option>
											<option value="Public">Public</option>
										</select>
										<select name="Seriousness">
											<option value="Serious">Serious</option>
											<option value="Very_Serious">Very Serious</option>
											<option value="Casual">Casual</option>
										</select>
										<a href="#" class="fa fa-envelope"></a>
										<a href="#" class="fa fa-file-text"></a>
										<a href="#" class="fa fa-trash"></a>
									</div>

								</div>

							</div><br><hr>

						</g:if>
						<g:else>
							<div>
								<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
								<div style="font-size:15px;">
									<span style="Wherefont-weight: bolder;">${topic.name}</span>&nbsp;&nbsp;<span><g:link controller="subscription" action="removeSubscription">Unsubscribe</g:link></span><br>
									<span class="un">@${topic.user.username}</span><br>
									<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
									<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>${assessment.Resource.countByTopic(it)}</span>
									<div>
										<select name="Seriousness">
											<option value="Serious">Serious</option>
											<option value="Very_Serious">Very Serious</option>
											<option value="Casual">Casual</option>
										</select>
										<a href="#" class="fa fa-envelope"></a>
									</div>

								</div>

							</div>
						</g:else>
					</g:each>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="boxy col-lg-5">
				<div class="boxy1">Trending Topic
				</div>
				<div class="boxy2">
					<g:each in="${topic}">
						<g:if test="${user.admin} || ${topic.user.username==user.username}">
							<div>
								<div style="font-size: 15px">
									<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
								<input type="text" name="Topic Name" value=${it.name}>
								<button class="btn btn-outline-success my-2 my-sm-0">Save</button>
								<button class="btn btn-outline-danger my-2 my-sm-0">Cancel</button>
								<br>
								<span class="un">@${it.user.username}</span><br>
								<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
								<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span>${assessment.Resource.countByTopic(it)}</span>
								</div>
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
									<a href="#" class="fa fa-envelope fa-2x"></a>
									<a href="#" class="fa fa-file-text fa-2x"></a>
									<a href="#" class="fa fa-trash fa-2x"></a>
								</div>
							</div><br><hr>
						</g:if>
						<g:else>
								<div style="font-size: 15px">
									<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
									<div style="font-size:15px;">
										<span style="font-weight: bolder;">${topic.name}</span>&nbsp;&nbsp;<span><g:link controller="subscription" action="addSubscription" >Subscribe</g:link></span><br>
										<span class="un">@${topic.user.username}</span><br>
										<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
										<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span>${assessment.Resource.countByTopic(it)}</span>
									</div>

								</div>
						</g:else>
					</g:each>

					</div>
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