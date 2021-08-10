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
						<asset:image src="${og.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
  						<div style="font-size:15px;">
  							<span style="font-weight: bolder;">${og.firstName} ${og.lastName}</span><br>
  							<span class="un">@${og.username}</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Topics</span><br>
  							<span>${assessment.Subscription.countByUser(og)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  							<span>${assessment.Topic.countByUser(og)}</span>
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
					<g:each in="${og.resources}">
					<div>
						<div>
  							<span style="font-weight:bolder; font-size: 15px;">${og.firstName} ${og.lastName}</span>
  							<span class="un">@${og.username} 5min</span>
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
								<g:if test="${it.hasProperty('filePath')}"><g:link controller="resources" action="downloadDocument" id="${it.id}">Download</g:link>&nbsp;&nbsp;</g:if>
								<g:if test="${it.hasProperty('linkurl')}">
									<g:link target="_blank" url="${it.linkurl}">View Full Site</g:link>&nbsp;&nbsp;
								</g:if>
								<g:link controller="resources" action="index" params="[resourceID:it.id]">View Post</g:link>&nbsp;&nbsp;
  						</div>

					</div><br><br><br><hr>
					</g:each>

				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="boxy col-lg-5">
			<div class="boxy1">Topics</div>
				<g:each in="${og.topics}">
				<div>
  				<div style="font-size:15px;">
  					<span ><g:link controller="topic" action="index" params="[topicID:it.id]">${it.name}</g:link></span>&nbsp;&nbsp;
				<g:if test="${assessment.Subscription.findByUserAndTopic(user,it)}">
					<g:if test="${it.user!=user}">
					<span  style="float: right">
						<g:link controller="subscription" action="removeSubscription" params="[subID:it.id]">Unsubscribe</g:link>
					</span>
					</g:if>
				</g:if>
					<g:else>
						<span style="float: right">
							<g:link controller="subscription" action="addSubscription" params="[subID:it.id]">Subscribe</g:link>
						</span>
					</g:else>
					<br>
  					<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  					<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					<span>${assessment.Resource.countByTopic(it)}</span>
					<g:if test="${assessment.Subscription.findByUserAndTopic(user,it)}">
  						<span style="float: right">
							<g:form controller="subscription" action="changeSeriousness" params="[topicID:it.id]">
								<g:select onchange="submit(name)" name="Ser" from="${[0: 'Serious', 1: 'Very Serious', 2: 'Casual']}" value="${assessment.Subscription.findByUserAndTopic(user,it).seriousness}" optionKey="key" optionValue="value"/>
							</g:form>
							<a data-toggle="modal" data-target="#sendInvite" class="fa fa-envelope"></a>
  						</span>
					</g:if>
  					</div>

			</div><br><hr>
			</g:each>
		</div>

		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="boxy col-lg-5">
				<div>
				<div class="boxy1">Subscriptions</div>
  				<g:each in="${og.subscriptions.topic}">
				<div style="font-size:15px;">
  				<span><g:link controller="topic" action="index" params="[topicID:it.id]">${it.name}</g:link></span>
					<span style="float: right">
						<g:if test="${assessment.Subscription.findByUserAndTopic(user,it)}">
							<g:if test="${it.user != user}">
							<g:link controller="subscription" action="removeSubscription" params="[subID:it.id]">Unsubscribe</g:link>
							</g:if>
						</g:if>
						<g:else>
							<g:link controller="subscription" action="addSubscription" params="[subID:it.id]">Subscribe</g:link>
						</g:else>

					</span>
					<br>
  					<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  					<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					<span>${assessment.Resource.countByTopic(it)}</span>
					<g:if test="${assessment.Subscription.findByUserAndTopic(user,it)}">
  						<span style="float: right">
							<g:form controller="subscription" action="changeSeriousness" params="[topicID:it.id]">
								<g:select onchange="submit(name)" name="Ser" from="${[0: 'Serious', 1: 'Very Serious', 2: 'Casual']}" value="${assessment.Subscription.findByUserAndTopic(user,it).seriousness}" optionKey="key" optionValue="value"/>
							</g:form>
							<a data-toggle="modal" data-target="#sendInvite" class="fa fa-envelope"></a>
  						</span>
					</g:if>
  					</div><br><hr>
				</g:each>

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