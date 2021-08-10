<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Link Sharing</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


	<asset:stylesheet src="index.css"/>
	<asset:javascript src="datatable.js"/>
	<asset:stylesheet src="dataTables.css"/>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<asset:javascript src="adminuser.js"/>

	%{--<script>--}%
		%{--let dataUrl="${createLink(controller:'user',action:'test')}"--}%
	%{--</script>--}%
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

					</span>
				</div>
				<div class="boxy2">
					<table id="myTable" class=" table table-striped">
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
<div id="div1"></div>



<g:javascript>
	// $(document).ready(demo);
	// function demo(){​​​​​​​​
    // $("#btn").click(function(){​​​​​​​​
    //     console.log("clicked");
	// 	setInterval(function(){​​​​​​​​
    //         $.ajax({​​​​​​​​
    //             url: dataUrl,
	// 					success: function abc(result){​​​​​​​​
    //                 console.log("Success called")
	// 			// $("#div1").html(result);
	// 			let h="";
	// 			$.each(result, function( index, value ) {​​​​​​​​
	// 				//alert( index + ": " + value );
	// 				let temp='<h1>'+value.firstname+' '+value.lastname+'</h1>';
	// 				h+=temp;
	// 				console.log(index, value);
	// 			}​​​​​​​​);
	// 			$("#div1").html(h);
	// 		}​​​​​​​​
	// 	}​​​​​​​​);
	// 	}​​​​​​​​,10000)
	// 	console.log("finished");
	// }​​​​​​​​);
	// }​​​​​​​​

// console.log("Hiii")

	// $(document).ready(demo);
	// function demo(){
	// 	console.log("Entered");
	// 	$("#btn").click(function(){
	// 		console.log("clicked");
	// 	})}

</g:javascript>




</body>
</html>