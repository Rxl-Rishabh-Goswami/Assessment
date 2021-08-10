<html>
<head>
    <title></title>
</head>
<body>
<div class="modal" id="shareLink" tabindex="-1" role="dialog" aria-labelledby="shareLink" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header boxy1">
                <h5 class="modal-title" style="font-weight: bolder">Share Link</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form controller="resources" action="createLink">
                    <div class="form-group">
                    <label>Link</label><br>
                    <g:textField required="true" class="form-control" name="link"/><br>
                    </div>
                    <div class="form-group">
                    <label>Description</label><br>
                    <g:textArea required="true" class="form-control" name="linkDescription"></g:textArea>
                    </div>
                    <div class="form-group">
                    <label>Topic</label><br>
                    <g:select class="form-control" name="topicLink" from="${user.subscriptions.topic.name}"/>
                    </div>
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