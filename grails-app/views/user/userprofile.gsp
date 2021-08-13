<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Link Sharing</title>
	<g:if env="development"><asset:stylesheet src="index.css"/></g:if>
	<g:if env="development"><asset:stylesheet src="background.css.css"/></g:if>
	<asset:javascript src="markAsRead.js"></asset:javascript>
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
			<div class="cool col-lg-5">
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
			<div class="col-lg-1"></div>
			<div class="cool col-lg-6">
				<div class="boxy1"> Posts
					%{--<span style="font-size:10px; float: right;">--}%
						%{--<input type="text" placeholder="Search..">--}%
						%{--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--}%
					%{--</span>--}%
				</div>
				<div class="postOnUserPage boxy2">
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
			<div class="cool col-lg-5">
			<div class="boxy1">Topics</div>
				<div class="topicsAtUserPage">
				<g:each in="${og.topics}">
				<div class="topicsAtUserPage boxy2">
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
					<p>
						<g:form style="display: inline-block" controller="topic"
								action="changeVisibility" params="[topicID: it.id]">
							<g:select onchange="submit(name)" name="Pri"
									  from="${[0: 'Public', 1: 'Private']}" value="${it.visibility}"
									  optionKey="key" optionValue="value"/>
						</g:form>

						<g:if test="${assessment.Subscription.findByUserAndTopic(user, it)}">
							<g:form style="display: inline-block" controller="subscription"
									action="changeSeriousness" params="[topicID: it.id]">
								<g:select onchange="submit(name)" name="Ser"
										  from="${[0: 'Serious', 1: 'Very Serious', 2: 'Casual']}"
										  value="${assessment.Subscription.findByUserAndTopic(user, it).seriousness}"
										  optionKey="key" optionValue="value"/>
							</g:form>
						</g:if>
						<button style="display: inline-block; float: right"
								onclick="deleteTopic('${it.id}')"
								class="btn btn-outline-dark fa fa-trash fa-lg"></button>&nbsp;
						<button style="display: inline-block; float: right" data-toggle="modal"
								data-target="#editTopic"
								class="btn btn-outline-dark fa fa-file-text fa-lg"></button>&nbsp;
					<g:render template="/template/editTopic"
							  model="[topicID: it.id, topicName: it.name]"/>
						<button style="display: inline-block; float: right" data-toggle="modal"
								data-target="#sendInviteByTopic"
								class="btn btn-outline-dark fa fa-envelope fa-lg"></button>&nbsp;
					<g:render template="/template/sendInviteByTopic" model="[topicName: it.name]"/>
					</p>
  					</div>

			</div><br><hr>
			</g:each>
		</div>

		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="cool col-lg-5">
				<div>
				<div class="boxy1">Subscriptions</div>
					<div class="boxy2 subscriptionsAtUserPage">
  				<g:each in="${og.subscriptions.topic}">
				<div style="font-size:15px;">
  				<span><g:link controller="topic" action="index" params="[topicID:it.id]">${it.name}</g:link></span>
					<span style="float: right">
						<g:if test="${assessment.Subscription.findByUserAndTopic(user,it)}">
							<g:if test="${it.user != user}">
								<button class="btn btn-danger"
										onclick="unsubscribe('${it.id}')">Unsubscribe</button>
							</g:if>
						</g:if>
						<g:else>
							<g:if test="${it.user != user}">
								<button class="btn btn-success"
										onclick="subscribe('${it.id}')">Subscribe</button>
							</g:if>
						</g:else>

					</span>
					<br>
  					<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  					<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					<span>${assessment.Resource.countByTopic(it)}</span>
					<g:if test="${assessment.Subscription.findByUserAndTopic(user,it)}">
  						<span style="float: right">
							<p>
								<g:form style="display: inline-block;" controller="subscription"
										action="changeSeriousness" params="[topicID: it.id]">
									<g:select onchange="submit(name)" name="Ser"
											  from="${[0: 'Serious', 1: 'Very Serious', 2: 'Casual']}"
											  value="${assessment.Subscription.findByUserAndTopic(user, it).seriousness}"
											  optionKey="key" optionValue="value"/>
								</g:form>

								<button style="display: inline-block; float: right" data-toggle="modal"
										data-target="#sendInviteByTopic"
										class="btn btn-outline-dark fa fa-envelope fa-lg"></button>&nbsp;
								<g:render template="/template/sendInviteByTopic"
										  model="[topicName: it.name]"/></p>
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






<div class="bg"></div>
<div class="bg bg2"></div>
<div class="bg bg3"></div>
</body>
</html>