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
                    <input class="form-group" id="file" type="file" name="document" onchange="validateFileSize()">
                    </div>
                    <div class="form-group">
                    <label>Description</label>
                    <g:textArea required="true" class="form-control" name="documentDescription"></g:textArea>
                    </div>
                    <div class="form-group">
                    <label>Topic</label>
                    <g:select class="form-control" name="topicDocument" from="${user.subscriptions.topic.name}"/>
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





<script>
    validateFileSize = () => {
        const fi = document.getElementById('file');
        // Check if any file is selected.
            for (let i = 0; i <= fi.files.length - 1; i++) {

                const fsize = fi.files.item(i).size;
                const file = Math.round((fsize / 1024));
                // The size of the file.
                if (file >= 128) {
                    alert(
                        "File too Big, please select a file less than 128KB");
                }
                else {return true}
            }

    }
</script>




</body>
</html>/