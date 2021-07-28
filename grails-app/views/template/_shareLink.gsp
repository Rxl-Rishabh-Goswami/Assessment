<html>
<head>
    <title></title>
</head>
<body>
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
</body>
</html>