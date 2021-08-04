<%@ page import="assessment.User" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="modal" id="shareDocument" tabindex="-1" role="dialog" aria-labelledby="shareDocument" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header boxy1">
                <h5 class="modal-title" style="font-weight: bolder">Share Document</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:uploadForm controller="resources" action="createDocument">
                    <div class="form-group">
                    <label>Document</label>
                    <input class="form-group" type="file" name="document">
                    </div>
                    <div class="form-group">
                    <label>Description</label>
                    <g:textArea class="form-control" name="documentDescription"></g:textArea>
                    </div>
                    <div class="form-group">
                    <label>Topic</label>
                    <g:select class="form-control" name="topicDocument" from="${assessment.Topic.getAll().name}"/>
                    </div>
                    <div class="modal-footer">
                        <g:submitButton name="submit" class="btn btn-primary" value="Submit"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </g:uploadForm>
            </div>
        </div>
    </div>
</div>
</body>
</html>