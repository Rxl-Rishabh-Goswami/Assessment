<html>
<head>
<title></title>
</head>
<body>
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
                <g:form controller="topic" action="createTopic">
                    <label>Name</label><br>
                    <g:textField name="topicName"></g:textField><br>

                    <label>Visbility</label><br>
                    <select name="topicVisibility">
                        <option name="0">Public</option>
                        <option name="1">Private</option>
                    </select>
                    <g:submitButton value="Submit" class="btn btn-primary" name="submit"/>
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
</body>
</html>