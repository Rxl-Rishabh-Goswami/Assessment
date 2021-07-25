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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand heading" href="#" style="font-size:30px;"><b>Link Sharing</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" data-toggle="modal" data-target="#sendInvite"><i class="fa fa-envelope fa-2x"></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#createTopic"><i class="fa fa-lightbulb-o fa-2x"></i>
		</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-user fa-2x"></i>&nbsp;<span>${user.firstName}</span>

        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <g:link class="dropdown-item" controller="user" action="index">Profile</g:link>
          <g:link class="dropdown-item" controller="user" action="index">Users</g:link>
          <g:link class="dropdown-item" controller="topic" action="index">Topics</g:link>
          <g:link class="dropdown-item" controller="resources" action="index">Posts</g:link>
          <div class="dropdown-divider"></div>
			<g:link class="dropdown-item" controller="login" action="logout">Log Out</g:link>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#shareDocument"><i class="fa fa-file-text fa-2x"></i>
		</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#shareLink"><i class="fa fa-link fa-2x"></i>
		</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<div class="container">
		<div class="row">
			<div class="boxy col-lg-5">
				<div class="boxy1">User Profile</div>
				<div class="boxy2">
					<div>
  						<g:link action="index" controller="user"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture"></g:link>
  						<div style="font-size:15px;">
  							<span style="font-weight: bolder;">${user.firstName + " " + user.lastName}</span><br>
  							<span class="un">@${user.username}</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Topics</span><br>
  							<span>50</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  							<span>20</span>



  						</div>

					</div>
				</div>
			</div>
			<div class="boxy col-lg-7">
				<div class="boxy1"> Inbox</div>
				<div class="boxy2">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div>
  							<span style="font-weight:bolder; font-size: 15px;">Uday Pratap Singh</span>
  							<span class="un">@uday 5min</span>
  							<span style="float: right;"><a href="#">Grails</a></span>
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
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
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
		<div class="row">
			<div class="boxy col-lg-5">
				<div class="boxy1">Subscriptions
					 <span style="float:right;"><a href="#">View All</a></span>
				</div>
				<div class="boxy2">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div style="font-size:15px;">
  							<span style="font-weight: bolder;">Grails</span>&nbsp;&nbsp;<span><a href="#">Unsubscribe</a></span><br>
  							<span class="un">@uday</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  							<span>50</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  							<span>20</span>
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
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div style="font-size:15px;">
  							<span style="font-weight: bolder;">Grails</span>&nbsp;&nbsp;<span><a href="#">Unsubscribe</a></span><br>
  							<span class="un">@uday</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  							<span>50</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  							<span>20</span>
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
				</div>
			</div>
		</div>
		<div class="row">
			<div class="boxy col-lg-5">
				<div class="boxy1">Trending Topic
				</div>
				<div class="boxy2">
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  						<div style="font-size:15px;">
  							<span style="font-weight: bolder;">Grails</span>&nbsp;&nbsp;<span><a href="#">Subscribe</a></span><br>
  							<span class="un">@uday</span><br>
  							<span class="un">Subscriptions&nbsp;&nbsp;&nbsp;Post</span><br>
  							<span>50</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  							<span>20</span>
  						</div>

					</div><br><hr>
					<div>
  						<img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle img-thumbnail dp" alt="Profile Picture">
  							<input type="text" name="Topic Name" value="Grails"> 
  							<button class="btn btn-outline-success my-2 my-sm-0">Save</button>
  							<button class="btn btn-outline-danger my-2 my-sm-0">Cancel</button>
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
		</div>
		</div>






<div class="modal fade" id="shareLink" tabindex="-1" role="dialog" aria-labelledby="shareLink" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header boxy1">
				<h5 class="modal-title" style="font-weight: bolder">Share Link</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<g:form>
					<label>Link</label><br>
					<g:textField name="link"></g:textField><br>
					<label>Description</label><br>
					<g:textArea name="linkDescription"></g:textArea><br>
					<label>Topic</label><br>
					<g:textField name="linkTopic"></g:textField><br>
				</g:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="createTopic" tabindex="-1" role="dialog" aria-labelledby="createTopic" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header boxy1">
				<h5 class="modal-title" style="font-weight: bolder">Create Topic</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<g:form>
					<label>Name</label><br>
					<g:textField name="name"></g:textField><br>

					<label>Visbility</label><br>
					<select name="topicVisibility">
						<option>Public</option>
						<option>Private</option>
					</select>
				</g:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="shareDocument" tabindex="-1" role="dialog" aria-labelledby="shareDocument" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header boxy1">
				<h5 class="modal-title" style="font-weight: bolder">Share Document</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<g:form>
					<label>Document</label><br>
					<g:textField name="document"></g:textField><br>
					<label>Description</label><br>
					<g:textArea name="documentDescription"></g:textArea><br>
					<label>Topic</label><br>
					<g:textField name="documentTopic"></g:textField><br>
				</g:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="sendInvite" tabindex="-1" role="dialog" aria-labelledby="sendInvite" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header boxy1">
				<h5 class="modal-title" style="font-weight: bolder">Send Invite</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<g:form>
					<label>Email</label><br>
					<g:textField name="emailInvite"></g:textField><br>
					<label>Topic</label><br>
					<select name="emailTopic">
						<option>Topic</option>
					</select>
				</g:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>






</body>
</html>