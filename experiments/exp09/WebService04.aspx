<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" type ="text/css" href="../../css/home.css" />
</head>
<body>
    <div class="container">
        <h3 style="display:table;">Creating the search Page</h3>
        <br />
        <h3>Upcoming Movies 2014</h3>
        <div class="upcoming-movies"></div>
        <h5>In this experiment, we will get the upcoming movies from the rotten tomatoes api, and display them as a slideshow.</h5>
        <h5>For displaying the thumbnils as a slideshow, the following code is used</h5>
        <pre> setInterval(function () {
                        for (var i = 0; i < data.total; i++) {
                            var img_tester = $("#" + i).css("display");
                            if (img_tester == "table") {
                                var selected_image = i;
                                $("#" + i).css("display", "none")
                                $("#" + ((i + 1) % data.total)).css("display", "table");
                                break;
                            }
                        }
                    }, 3000);
</pre>
        <h5>Here, we use the setInterval method of jquery, to call the anonymous function, that just checks which image is currently displayed.</h5>
        <h5>Once we have the image, we just make it display property as none, and set the next's image display property to table, to give the fade-in, fade-out effect.</h5>
        <a href="../../fileview/Default.aspx?~/experiments/exp09/WebService04.aspx">ASPX Source</a>
    </div>

    <form id="form1" runat="server">
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>   
    <script>

        $(function () {
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json?apikey=y89qq3t53gmyxjrna294v2jg",
                dataType: "jsonp",
                jsonpCallback: 'callback1',
                success: function (data) {
                    var upcoming_movies = $(".upcoming-movies");
                    upcoming_movies.css("display", "table");
                    upcoming_movies.empty();
                    for (var i = 0; i < data.total; i++) {
                        upcoming_movies.append($("<img>").attr("src", data.movies[i].posters.original)
                                                         .attr("id", i)
                                                         .css("display", "none")
                                                         .css("width", "200px")
                                                         .css("height", "200px"));
                    }
                    var first_movie = $("#0").css("display", "table");

                    setInterval(function () {
                        for (var i = 0; i < data.total; i++) {
                            var img_tester = $("#" + i).css("display");
                            if (img_tester == "table") {
                                var selected_image = i;
                                $("#" + i).css("display", "none")
                                $("#" + ((i + 1) % data.total)).css("display", "table");
                                break;
                            }
                        }
                    }, 3000);
                }
            });
        });
         </script>
</body>
</html>
