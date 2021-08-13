// $(document).ready(demo);
// function demo(){​​​​​​​​
//     $("#btn").click(function(){​​​​​​​​
//         console.log("clicked");
//         setInterval(function(){​​​​​​​​
//             $.ajax({​​​​​​​​
//                 url: dataUrl,
//                     success: function(result){​​​​​​​​
//                     console.log("Success called")
//                 // $("#div1").html(result);
//                 var h="";
//                 $.each(result, function( index, value ) {​​​​​​​​
//                     //alert( index + ": " + value );
//                     var temp='<h1>'+value.firstName+' '+value.lastName+'</h1>';
//                     h+=temp;
//                     console.log(index, value);
//                 }​​​​​​​​);
//                 $("#div1").html(h);
//             }​​​​​​​​
//         }​​​​​​​​);
//         }​​​​​​​​,10000);
//         console.log("finished");
//     }​​​​​​​​);
// }​
//
//
//

// $(document).ready(demo)
// function demo(){
//     console.log("Entered")
//     $("#btn").click(function(){
//         console.log("clicked")
//         $.ajax({
//             url:dataUrl,
//             success: function (result) {
//                 console.log("success called")
//                 let h=""
//                 $.each(result,function (index,value) {
//                     let temp='<h1>'+value.firstName+' '+value.lastName+'</h1>'
//                     h+=temp
//                     console.log(index, value)
//                 })
//                 $("#div1").html(h)
//
//             }
//         })
//     })}



$(document).ready(function(){
    $("#myTable").dataTable();
});




