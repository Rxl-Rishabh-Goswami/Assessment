<html>
<head>
    <title></title>
</head>
<body>
<div class="modal fade" id="sendInvite" tabindex="-1" role="dialog" aria-labelledby="sendInvite" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header boxy1">
                <h5 class="modal-title" style="font-weight: bolder">Send Invite</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form>
                    <label>Email</label><br>
                    <g:textField name="emailInvite"></g:textField><br>
                    <label>Topic</label><br>
                    <select name="emailTopic">
                        <option>Topic</option>
                    </select>
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