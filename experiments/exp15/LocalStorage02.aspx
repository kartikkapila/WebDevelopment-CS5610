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
        <p>Search for a movie name. What we will do is, we will store the imdb id of this movie in localStorage,
            and display more information of this movie on the next page.
        </p>
        <p>Here we will only display the image of the movie searched. For more information about the movie, just visit the next
            page.
        </p>
        <input class="key" type="text" placeholder="Enter Movie Name"/><br /><br />
        <button class="submit-btn">Search</button><br /><br /><br />
        <img class="movie-thumbnail" src="http://content8.flixster.com/movie/11/16/67/11166714_pro.jpg" />
        <p>Here is a snippet of the code, which I use to display the image.</p>
        <pre>
function renderMovieImage(response) {
    $(".movie-thumbnail").attr('src', response.movies[0].posters.profile);
    localStorage.setItem("movieName", $(".key").val());
}</pre>
    <a href="../../fileview/Default.aspx?~/experiments/exp15/LocalStorage02.aspx">Source</a>
    </div>
    <script src ="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(".submit-btn").click(function (e) {
            var key = $(".key").val();
            if (key != "") {
                getMovieThumbnail(key,renderMovieImage);
            } else {
                alert('The input field was left blank');
            }
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
            localStorage.setItem("movieName", $(".key").val());
        }

    </script>
</body>
</html>
