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
								<th>ID</th>
								<th>Username</th>
								<th>Email</th>
								<th>Firstname</th>
								<th>Lastname</th>
								<th>Active</th>
								<th>Manage</th>
							</tr>
							<tbody>
								<g:each in="${allUser}">
								<tr>
									<td>${it.id}</td>
									<td>${it.username}</td>
									<td>${it.email}</td>
									<td>${it.firstName}</td>
									<td>${it.lastName}</td>
									<g:if test="${it.active}">
										<td>Yes</td>
										<td><g:link controller="user" action="deactivate" params="[userID:it.id]">Deactivate</g:link></td>
									</g:if>
									<g:else>
										<td>No</td>
										<td><g:link controller="user" action="activate" params="[userID:it.id]">Activate</g:link></td>
									</g:else>
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