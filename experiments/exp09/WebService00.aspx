<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" type ="text/css" href="../../css/home.css" />
    <link rel="stylesheet" type="text/css" href="../../css/webservices.css" />
    <style>

    </style>
</head>
<body>
    <div class="container">
        <h3>Movie Search Engine</h3>
        <p>In these set of experiments, we will get the information of movies using the rotten tomatoes api.</p>
        <p>Click on the botton, to get the information for Star Wars.</p>
        <div class="search-bar">
             <button class="search-btn btn btn-primary">Search</button>
        </div>
        <div style="clear:both;"></div><br /><br />
        <div class ="movie-holder">
            <div class="movie-presenter">
                <img class="movie-thumbnail" src="../../images/me1.jpg" />
                <h3 class="movie-title">Demo Title</h3>
           </div>
        </div>
        <div><br />
            <p>This is possible in the following ways:</p>
            <pre> $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[my_api_key]&q=" + "star wars" + "&page-limit=5",
                dataType: "jsonp",
                jsonpCallback: 'myCRAAAAAAZYcallbackNAME',
                success: function (data) {
                      
                        movie_title.html(data.movies[0].title);
                        movie_thumbnail.attr("src", data.movies[0].posters.thumbnail);
                        movie_presenter.append(movie_thumbnail, [movie_title]);
                        movie_holder.append(movie_presenter);
               
                }
            });</pre>
            <p>Here, we use the url provided by the api along with the key given. To that we add the movie to be search, in this case star wars</p>
            <p>Next we extract the information from the data object.</p>
            <p>In the data object, we have an array named movies</p>
            <p>From this movies array, we use the index 0 to get the first movie object</p>
            <p>Now, this movie object, has two fields which I use, the first one is title and the second one is inside posters object and is named thumbnail.</p>
            <p>We then change the attr property of the img tag that we hav grabbed using jquery and change it to point to the thumbnail that we have received.</p>
            <p>The same is done, with the hr tag that we have grabbed. Its html is set to the title of the movie using the html function.</p>
        </div>
        <div>
            <h3>Source</h3>
            <a href="../../fileview/Default.aspx?~/experiments/exp09/WebService00.aspx">ASPX Source</a>
        </div>
    </div>
    <div class="templates" style="display:none;">
       <h3 class="h3-template"></h3>
       <img class="img-template" src="#" />
       <div class="next-line" style="clear:both;"></div>
    </div>
    <form id="form1" runat="server">
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>
    <script>
     
        $(".search-btn").click(function () {
            
            var movie_holder = $(".movie-holder")
            var movie_presenter = $(".movie-presenter");
            var movie_title = $(".h3-template");
            var movie_thumbnail = $(".img-template");
            var next_line_div = $(".next-line");
            movie_presenter.empty();

            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=y89qq3t53gmyxjrna294v2jg&q=" + "star wars" + "&page-limit=5",
                dataType: "jsonp",
                jsonpCallback: 'myCRAAAAAAZYcallbackNAME',
                success: function (data) {
                    console.log(data);
                        movie_title = data.movies[0].title;
                        movie_thumbnail.attr("src", data.movies[0].posters.thumbnail);
                        movie_presenter.append(movie_thumbnail, [movie_title]);
                        movie_holder.append(movie_presenter);
               
                }
            });
        });
    </script>
</body>
</html>
