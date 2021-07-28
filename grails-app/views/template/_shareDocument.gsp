<html>
<head>
    <title></title>
</head>
<body>
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
</body>
</html>