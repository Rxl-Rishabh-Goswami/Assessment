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

<g:if test="${flash.userUpdated}">
	<div class="alert alert-success" role="alert">${flash.userUpdated}</div>
</g:if>
<g:if test="${flash.passwordUpdated}">
	<div class="alert alert-success" role="alert">${flash.passwordUpdated}</div>
</g:if>

<g:if test="${flash.userNotUpdated}">
	<div class="alert alert-danger" role="alert">${flash.userNotUpdated}</div>
</g:if>
<g:if test="${flash.passwordNotUpdated}">
	<div class="alert alert-danger" role="alert">${flash.passwordNotUpdated}</div>
</g:if>


	<div class="container">
		<div class="row">
			<div class="boxy col-lg-5">
				<div class="boxy1">User Profile</div>
				<div class="boxy2">
					<div>
						<asset:image src="${user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
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
				<div class="boxy1">Update Profile</div>
				<g:uploadForm controller="user" action="editProfile">
						<div class="form-group">
						<label>First Name</label>
						<g:textField class="form-control" name="firstName" placeholder="Enter First Name"/>
						</div>
						<div class="form-group">
						<label>Last Name</label>
						<g:textField class="form-control" name="lastName" placeholder="Enter Last Name"/>
						</div>
						<div class="form-group">
						<label>User Name</label>
						<g:textField class="form-control" name="username" placeholder="Enter User Name"/>
						</div>
						<div class="form-group">
						<label>Password</label>
						<g:passwordField class="form-control" name="password" placeholder="Enter Password"/>
						</div>
						<div class="form-group">
						<label>Confirm Password</label>
						<g:passwordField class="form-control" name="confirm" placeholder="Enter Password Again"/>
						</div>
						<div class="form-group">
						<label>Profile Picture</label><br>
						<input type="file" class="form-group" name="profilePhoto">
						</div>

						<g:submitButton name="Submit" value="Submit" class="btn btn-outline-success my-2 my-sm-0"></g:submitButton>
					</g:uploadForm>
			</div>
		</div>
			<div class="row">
				<div class="boxy col-lg-5">
				<div class="boxy1">Topics
					<span style="font-size:10px; float: right;">
						<input type="text" placeholder="Search..">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</span>
				</div>
				<div class="boxy2">
					<g:each in="${user.topics}">
					<div>
						<asset:image src="${user.photo}" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
  						<div style="font-size:15px;">
  							<input type="text" name="topicname" value="${it.name}">
  							<button class="btn btn-outline-success my-2 my-sm-0">Save</button>
  							<br>
  							<span class="un">@${user.username}</span><br>
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
								<a href="#" class="fa fa-envelope"></a>
								<a href="#" class="fa fa-file-text"></a>
								<a href="#" class="fa fa-trash"></a>
  							</div>

  						</div>

					</div><br><br><br><br><hr>
					</g:each>
				</div>
			</div>
				<div class="boxy col-lg-7">
				<div class="boxy1">Change Password</div>
					<g:form controller="user" action="updatePassword">
						<div class="form-group">
						<label>New Password :</label>
						<g:passwordField class="form-control" name="newpassword"></g:passwordField>
						</div>
						<div class="form-group">
						<label>Confirm Password :</label>
						<g:passwordField class="form-control" name="confirmpassword"></g:passwordField>
						</div>
						<g:submitButton value="Submit" name="submit" class="btn btn-outline-success my-2 my-sm-0" ></g:submitButton>
					</g:form>
			</div>
			</div>
			
		</div>


<g:render template="/template/createTopic"/>


<g:render template="/template/shareDocument"/>


<g:render template="/template/sendInvite"/>


<g:render template="/template/shareLink"/>
</body>
</html>