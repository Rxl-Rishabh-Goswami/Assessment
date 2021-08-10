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
				<div class="boxy1">Trending Topic
				</div>
				<div class="boxy2">
					<g:each in="${topic}">
						<g:if test="${user.admin || (it.user==user)}">
							<div class="nonEdit" style="font-size: 15px">

								<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
								<div style="font-size:15px;">
									<g:if test="${user.subscriptions.topic.contains(it)}">
										<g:link controller="topic" action="index" params="[topicID:it.id]">
											<span style="font-weight: bolder;">${it.name}</span>&nbsp;&nbsp;</g:link>
										<span style="float: right">
											<g:if test="${!(it.user == user)}">
												<g:link controller="subscription" action="removeSubscription" params="[subID:it.id]">Unsubscribe</g:link>
											</g:if>
										</span>
									</g:if>
									<g:else>
										<span style="font-weight: bolder;">${it.name}</span>&nbsp;&nbsp;<span><g:link controller="subscription" action="addSubscription" params="[subID:it.id]">Subscribe</g:link></span>
									</g:else>
								&nbsp;&nbsp; <button class="openEdit btn btn-outline-warning my-2 my-sm-0">Edit</button><br>
									<span class="un">@${it.user.username}</span><br>
									<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
									<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>${assessment.Resource.countByTopic(it)}</span>
								</div>

							</div><br><hr>
							<div class="editTopicByOwner" style="font-size: 15px">
								<div>
									<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
									<input type="text" name="newTopicName" value=${it.name}>
									<button class="btn btn-outline-success my-2 my-sm-0">Save</button>
									<button class="btn btn-outline-danger my-2 my-sm-0 closeEdit">Cancel</button>
									<br>
									<span class="un">@${it.user.username}</span><br>
									<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
									<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>${assessment.Resource.countByTopic(it)}</span>
								</div>
								<div>

									<select onchange="this.form.submit()" id="${it.id}" name="Seriousness">
										<option value="1">Private</option>
										<option value="0">Public</option>
									</select>
									<select onchange="this.form.submit()" id="${it.id}" name="Privacy">
										<option value="0">Serious</option>
										<option value="1">Very Serious</option>
										<option value="2">Casual</option>
									</select>
									<g:link controller="topic" action="delete2" class="fa fa-trash fa-lg" params="[topicID: it.id]"></g:link>&nbsp;
									<a data-toggle="modal" data-target="#editTopic" class="fa fa-file-text fa-lg" ></a>&nbsp;
									<a data-toggle="modal" data-target="#sendInvite" class="fa fa-envelope fa-lg"></a>&nbsp;
								</div>
							</div><br><hr>
						</g:if>
						<g:else>
							<div style="font-size: 15px">
								<asset:image src="${it.user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
								<div style="font-size:15px;">
									<g:if test="${user.subscriptions.topic.contains(it)}">
										<g:link controller="topic" action="index" params="[topicID:it.id]">
											<span style="font-weight: bolder;">${it.name}</span>&nbsp;&nbsp;<span><g:link controller="subscription" action="removeSubscription" params="[subID:it.id]">Unsubscribe</g:link></span><br>
										</g:link>
									</g:if>
									<g:else>
										<g:link controller="topic" action="index" params="[topicID:it.id]"><span style="font-weight: bolder;">${it.name}</span></g:link>&nbsp;&nbsp;
										<span><g:link controller="subscription" action="addSubscription" params="[subID:it.id]">Subscribe</g:link></span><br>
									</g:else>
									<span class="un">@${it.user.username}</span><br>
									<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
									<span>${assessment.Subscription.countByTopic(it)}</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>${assessment.Resource.countByTopic(it)}</span>
								</div>

							</div><br><hr>
						</g:else>
					</g:each>

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
  							</span>
  						</div>

					</div><br><br><br><br><br><br><hr>
					</g:each>

				</div>
				</div>
			</div>
		</div>


<g:render template="/template/createTopic"/>


<g:render template="/template/shareDocument"/>


<g:render template="/template/sendInvite"/>


<g:render template="/template/shareLink"/>


<g:render template="/template/editTopic"/>










<script>
	$('.editTopicByOwner').hide();
	$('.openEdit').click(function(){
		$('.nonEdit').hide();
		$('.editTopicByOwner').show();
	});
	$('.closeEdit').click(function(){
		$('.nonEdit').show();
		$('.editTopicByOwner').hide();
	});
</script>

</body>
</html>