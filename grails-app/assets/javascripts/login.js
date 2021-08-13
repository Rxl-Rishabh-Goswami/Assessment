

$(document).ready(demo);
function demo(){
    setInterval(function(){
      $.ajax({
          url: "http://localhost:9091/resources/recentPost",
          success: function(result){
              var h=""
              $.each(result,function(index,value){
                  var temp = `<div class="boxy2">
							<image src="assets`+value.photo+`" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
							<div>
								<span>`+value.firstName+`  `+value.lastName+`</span>
								<span class="un">@`+value.username+`</span>
								<span style="float: right;"><a href="www.google.com">`+value.name+`</a></span>
							</div>
							<div>
								<p>`+value.description+`</p>
							</div>
							<div>
								<span style="float: left;">
									<a href="#" class="fa fa-facebook fa-2x"></a>
									<a href="#" class="fa fa-twitter fa-2x"></a>
									<a href="#" class="fa fa-google fa-2x"></a>
								</span>
							</div>

						</div><br><br><br><br><br><br><hr> `

                  h+=temp
              })
              $(".recentPost").html(h)
          }
      })
    },1500)
}


$(document).ready(demo1);
function demo1() {
    setInterval(function () {
        $.ajax({
            url: "http://localhost:9091/resources/topPost",
            success: function (result) {
                var h = ""
                $.each(result, function (index, value) {
                    var temp = `<div class="boxy2">
							<image src="assets` + value.photo + `" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
							<div>
								<span>` + value.firstName + `  ` + value.lastName + `</span>
								<span class="un">@` + value.username + ` 5min</span>
								<span style="float: right;"><a href="www.google.com">` + value.name + `</a></span>
							</div>
							<div>
								<p>` + value.description + `</p>
							</div>
							<div>
								<span style="float: left;">
									<a href="#" class="fa fa-facebook fa-2x"></a>
									<a href="#" class="fa fa-twitter fa-2x"></a>
									<a href="#" class="fa fa-google fa-2x"></a>
								</span>
								<span style="float: right;">
									<a href="www.google.com">View Post</a>
								</span>
							</div>

						</div><br><br><br><br><br><br><hr>`

                    h += temp
                })
                $(".topPost").html(h)
            }
        })
    }, 1500)
}








//     $('#demo').pagination({
//         dataSource: 'http://localhost:9091/resources/recentPost?max&page',
//         locator: 'items',
//         totalNumber: 10,
//         pageSize: 5,
//         ajax: {
//             beforeSend: function() {
//                 dataContainer.html('Loading');
//             }
//         },
//         callback: function(data, pagination) {
//             // template method of yourself
//             var html = template(data);
//             dataContainer.html(html);
//         }
//     })
// }

































// `<div class="boxy2">
// 							<image src="/assets/images`+value.photo+`" class="img-circle img-thumbnail dp" alt="Profile Picture"/>
// 							<div>
// 								<span>`+value.firstName+`  `+value.lastName+`</span>
// 								<span class="un">@`+value.username+` 5min</span>
// 								<span style="float: right;"><a href="www.google.com">`+value.name+`</a></span>
// 							</div>
// 							<div>
// 								<p>`+value.description+`</p>
// 							</div>
// 							<div>
// 								<span style="float: left;">
// 									<a href="#" class="fa fa-facebook fa-2x"></a>
// 									<a href="#" class="fa fa-twitter fa-2x"></a>
// 									<a href="#" class="fa fa-google fa-2x"></a>
// 								</span>
// 								<span style="float: right;">
// 									<a href="www.google.com">View Post</a>
// 								</span>
// 							</div>
//
// 						</div><br><br><br><br><br><br><hr>`



// "<div>\n" +
// "\t\t\t\t\t\t\t<image src=\"/assets/images"+value.photo+"\" class=\"img-circle img-thumbnail dp\" alt=\"Profile Picture\"/>\n" +
// "\t\t\t\t\t\t\t<div>\n" +
// "\t\t\t\t\t\t\t\t<span>"+value.firstName+" "+value.lastName+"</span>\n" +
// "\t\t\t\t\t\t\t\t<span class=\"un\">@"+value.username+"5min</span>\n" +
// "\t\t\t\t\t\t\t\t<span style=\"float: right;\"><a href=\"www.google.com\">"+value.name+"</a></span>\n" +
// "\t\t\t\t\t\t\t</div>\n" +
// "\t\t\t\t\t\t\t<div>\n" +
// "\t\t\t\t\t\t\t\t<p>"+value.description+"</p>\n" +
// "\t\t\t\t\t\t\t</div>\n" +
// "\t\t\t\t\t\t\t<div>\n" +
// "\t\t\t\t\t\t\t\t<span style=\"float: left;\">\n" +
// "\t\t\t\t\t\t\t\t\t<a href=\"#\" class=\"fa fa-facebook fa-2x\"></a>\n" +
// "\t\t\t\t\t\t\t\t\t<a href=\"#\" class=\"fa fa-twitter fa-2x\"></a>\n" +
// "\t\t\t\t\t\t\t\t\t<a href=\"#\" class=\"fa fa-google fa-2x\"></a>\n" +
// "\t\t\t\t\t\t\t\t</span>\n" +
// "\t\t\t\t\t\t\t\t<span style=\"float: right;\">\n" +
// "\t\t\t\t\t\t\t\t\t<a href=\"www.google.com\">View Post</a>\n" +
// "\t\t\t\t\t\t\t\t</span>\n" +
// "\t\t\t\t\t\t\t</div>\n" +
// "\n" +
// "\t\t\t\t\t\t</div><br><br><br><br><br><br><hr>\n"