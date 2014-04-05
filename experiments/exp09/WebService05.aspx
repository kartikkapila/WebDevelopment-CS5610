<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" type ="text/css" href="../../css/home.css" />
    <link rel="stylesheet" type="text/css" href="../../css/webservices.css" />
</head>
<body>
    <div class="container">
        <h3>Creating the search Page</h3>
        <div class="details-showers"></div>
        <p>Enter a movie name and click on search.</p>
        <div class="search-bar">
             <input class ="search form-control" type="text" placeholder="Enter Movie Name" required="required"/>&nbsp
             <button class="search-btn btn btn-primary">Search</button>
        </div>
        <br />
        <div class="thumbnails-holder"></div>
        <br />
        <h5>In this experiment, when we search for a movie, we can check the reviews which the movie has received, by just clicking on the thumbnail.</h5>
        <div class="movie-reviews"></div>
        <a href="../../fileview/Default.aspx?~/experiments/exp09/WebService05.aspx">ASPX Source</a>
    </div>
    <form id="form1" runat="server">
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>   
    <script>


        $(".search-bar").click(function () {
            var search_bar = $(".search-bar");
            var search_variable = $(".search").val();
            var details_shower = $(".details-showers");
            var thumbnails_holder = $(".thumbnails-holder");
            var movie_reviews = $(".movie-reviews");
            movie_reviews.empty();
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=y89qq3t53gmyxjrna294v2jg&q=" + search_variable + "&page-limit=5",
                dataType: "jsonp",
                jsonpCallback: 'callback2',
                success: function (data) {
                    thumbnails_holder.empty();
                    for (var i = 0; i < 5; i++) {
                        var thumbnail = ($("<img>").attr("src", data.movies[i].posters.thumbnail));
                        var src = thumbnail.attr('src');
                        if (src != "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif") {
                            thumbnail.css("margin-right", "15px");
                            thumbnail.attr("id", i);
                            thumbnail.on('click',data,clicked)
                                     .on('mouseenter', data, onhover)
                                     .on('mouseleave', data, function () {
                                         details_shower.empty().css("display","none");
                                     });
                            thumbnails_holder.append(thumbnail);
                        }
                    }
                }
            });
        });

        function onhover(info) {
            var details_shower = $(".details-showers");
            details_shower.empty();
            details_shower.css("display", "table");
            details_shower.append(
                $("<img>").attr("src", info.data.movies[info.target.id].posters.thumbnail)
                                            .css("display", "table")
                                            .css("float", "left")
                                            .css("margin-right", "10px"),
                $("<h3>").text(info.data.movies[info.target.id].title)
                         .css("margin-top","0px"),
                $("<h5>").text("Running Time: " + info.data.movies[info.target.id].runtime + "mins"),
                $("<h5>").text(info.data.movies[info.target.id].critics_consensus));
        }

        function clicked(info) {
            console.log(info);
            var movie_reviews = $(".movie-reviews");
            movie_reviews.empty();
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + info.data.movies[info.target.id].id + "/reviews.json?apikey=y89qq3t53gmyxjrna294v2jg",
                dataType: 'jsonp',
                jsonpCallback: 'callback3',
                success: function (data) {
                    if (data.total >= 5) {
                        for (var i = 0; i < 5; i++) {
                            if (data.reviews[i].critic != '' && data.reviews[i].quote != '') {
                                movie_reviews.append($("<pre>").append($("<h5>").text(data.reviews[i].quote),
                                                                       $("<h5>").text("-" + data.reviews[i].critic)));
                            }
                        }
                    } else {
                        for (var i = 0; i < data.total; i++) {
                            if (data.reviews[i].critic != '') {
                                movie_reviews.append($("<pre>").append($("<h5>").text(data.reviews[i].quote),
                                                                   $("<h5>").text("-" + data.reviews[i].critic)));
                            }
                        }
                    }
                }
            });
        }
    </script>
</body>
</html>
