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
		<div class="boxy col-lg-12">
			<div class="boxy1">
				Users
				<span style="float:right; font-size:12px;">
					<select>
						<option>All Users</option>
					</select>
					<input type="text" placeholder="Search..">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</span>
			</div>
			<div class="boxy2">
				<table class="table table-striped">
					<thead>
					<tr>
						<th>Topic ID</th>
						<th>Created By</th>
						<th>Topic name</th>
						<th>Date Created</th>
						<th>Subscriptions</th>
						<th>Number of Posts</th>
						<th>Delete</th>
					</tr>
					<tbody>
					<g:each in="${allTopic}">
						<tr>
							<td>${it.id}</td>
							<td>${it.user.username}</td>
							<td>${it.name}</td>
							<td>${it.dateCreated}</td>
							<td>${assessment.Subscription.countByTopic(it)}</td>
							<td>${assessment.Resource.countByTopic(it)}</td>
							<td><g:link controller='topic' action='delete' params="[topicID:it.id]">Delete</g:link>
						</tr>
					</g:each>
					</tbody>

				</thead>
				</table>
			</div>
		</div>

	</div>
</div>

</body>
</html>