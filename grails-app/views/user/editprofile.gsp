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
	<div class="container">User user = User.findWhere(username:session.username)
		<div class="row">
			<div class="boxy col-lg-5">
				<div class="boxy1">User Profile</div>
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
				<div class="boxy1">Update Profile</div>
				<g:form controller="user" action="editProfile">
						<label>FirstUser user = User.findWhere(username:session.username) Name</label>
						<g:textField name="firstName" placeholder="Enter First Name"/><br>
						<label>Last Name</label>
						<g:textField name="lastName" placeholder="Enter Last Name"/><br>
						<label>User Name</label>
						<g:textField name="username" placeholder="Enter User Name"/><br>
						<label>Password</label>
						<g:passwordField name="password" placeholder="Enter Password"/><br>
						<label>Confirm Password</label>
						<g:passwordField name="confirm" placeholder="Enter Password Again"/><br>

						<g:submitButton name="Submit" value="Submit" class="btn btn-outline-success my-2 my-sm-0"></g:submitButton>
					</g:form>
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
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
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

					</div>
				</div>
			</div>
				<div class="boxy col-lg-7">
				<div class="boxy1">Change Password</div>
					<g:form controller="user" action="updatePassword">
						<label>New Password :</label>
						<g:passwordField name="newpassword"></g:passwordField><br>
						<label>Confirm Password :</label>
						<g:passwordField name="confirmpassword"></g:passwordField><br>
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