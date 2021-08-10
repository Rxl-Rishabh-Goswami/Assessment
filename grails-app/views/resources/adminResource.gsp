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
    <g:javascript>
        $(document).ready(function(){
            $("#myTable").dataTable();
        });

    </g:javascript>
</head>
<body>
<g:render template="/template/navbar"/>
<div class="container">
    <div class="row">
        <div class="boxy col-lg-12">
            <div class="boxy1">
                Resources
            </div>
            <div class="boxy2">
                <table id="myTable" class="table table-striped">
                    <thead>
                    <tr>
                        <th>Resource ID</th>
                        <th>Created By</th>
                        <th>Resource Description</th>
                        <th>Date Created</th>
                        <th>Topic Name</th>
                        <th>Resource Type</th>
                        <th>Delete</th>
                    </tr>
                    <tbody>
                    <g:each in="${allResource}">
                        <tr>
                            <td>${it.id}</td>
                            <td>${it.user.username}</td>
                            <td>${it.description}</td>
                            <td>${it.dateCreated.dateString}</td>
                            <td>${it.topic.name}</td>
                            <g:if test="${it.hasProperty('filePath')}"><td>Document Resource</td></g:if>
                            <g:else><td>Link Resource</td></g:else>

                            <td><g:link controller='resources' action='deleteResource' params="[resourceID:it.id]">Delete</g:link>
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