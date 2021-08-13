$(document).ready(demo)
function demo(){
    console.log("Entered")
    $("#btn").click(function(){
        console.log("clicked")
        $.ajax({
            url:dataUrl,
            success: function (result) {



            }
        })
    })}