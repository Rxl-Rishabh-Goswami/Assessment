<html>
<head>
    <title></title>
</head>
<body>
<div class="modal" id="editTopic" tabindex="-1" role="dialog" aria-labelledby="editTopic" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header boxy1">
                <h5 class="modal-title" style="font-weight: bolder">Edit Topic</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form controller="topic" action="editTopic">
                    <div class="form-group">
                        <label>Name</label>
                        <g:textField required="true" name="newName" value="${topicName}" class="form-control"></g:textField>
                    </div>
                    %{--<div class="form-group">--}%
                        %{--<label>Visbility</label>--}%
                        %{--<select name="topicVisibility" class="form-control">--}%
                            %{--<option name="0">Public</option>--}%
                            %{--<option name="1">Private</option>--}%
                        %{--</select>--}%
                    %{--</div>--}%
                    <g:hiddenField name="topicID" value="${topicID}"></g:hiddenField>
                    <div class="modal-footer">
                        <g:submitButton name="submit" class="btn btn-primary" value="Submit"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </g:form>
            </div>

        </div>
    </div>
</div>
</body>
</html>