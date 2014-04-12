<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Local Storage</title>
    <link rel="stylesheet" type="text/css" href="../../css/localstorage.css" />
</head>
<body>
    <form id="form1" runat="server"></form>
    <div class="container">
        <h3>Local Storage Experiments</h3>
        <p>In this experiment, We will get the information of the movie name, which is stored in the local storage.</p>
        <h3 class="title"></h3>
        <div class="critic-score"></div><br />
        <div class="overview"></div><br />
        <h3>Movie Poster</h3>
        <img class="movie-thumbnail" src="http://content8.flixster.com/movie/11/16/67/11166714_pro.jpg" />                
        <p>Here is a snippet of the code on how we can achieve this.</p>
        <pre>
$(".movie-thumbnail").attr('src', response.movies[0].posters.profile);
$(".title").html(response.movies[0].title);
$(".overview").html(response.movies[0].critics_consensus);
$(".critic-score").html("critic score:"+response.movies[0].ratings.critics_score);
        </pre>
        <a href="../../fileview/Default.aspx?~/experiments/exp15/LocalStorage03.aspx">Source</a>
    </div>
    <script src ="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(function () {
            getMovieThumbnail(localStorage.getItem("movieName"), renderMovieImage);
        });
        function getMovieThumbnail(movieName,callback) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
                q: movieName,
                page_limit: 1
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?",
                data: params,
                dataType: "jsonp",
                success: callback
            });
        }

        function renderMovieImage(response) {
            $(".movie-thumbnail").attr('src', response.movies[0].posters.profile);
            $(".title").html(response.movies[0].title);
            $(".overview").html(response.movies[0].critics_consensus);
            $(".critic-score").html("critic score:"+response.movies[0].ratings.critics_score);
        }

    </script>
</body>
</html>
