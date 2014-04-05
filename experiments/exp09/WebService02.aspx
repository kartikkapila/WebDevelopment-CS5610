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
        <p>Enter a movie name and click on search.</p>
        <div class="search-bar">
             <input class ="search form-control" type="text" placeholder="Enter Movie Name"/>&nbsp
             <button class="search-btn btn btn-primary">Search</button>
        </div>
        <br />
        <div class="thumbnails-holder"></div>
        <h5>In this experiment, we will get movies which match the value entered in the input box.</h5>
        <h5>This is possible using the following code:</h5>
        <pre>for (var i = 0; i < 5; i++) {
                            var thumbnail = ($("img").attr("src", data.movies[i].posters.thumbnail)
                                                       .css("margin-right","15px"));
                            var src = thumbnail.attr('src');
                            if (src != "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif") {
                                thumbnails_holder.append(thumbnail);
                            }
                        
                        }</pre>
        <h5>Here, we use a for loop to display upto 5 images on the page.</h5>
        <h5>We also, have a check to make sure that we only display images which have a valid thumbail, and that part is taken care of by the if loop.</h5>
        <h3>Source</h3>
        <a href="../../fileview/Default.aspx?~/experiments/exp09/WebService02.aspx">ASPX Source</a>
      
        <form id="form1" runat="server">
        </form>
    </div>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>
    <script>
        $(".search-bar").click(function () {
            var search_bar = $(".search-bar");
            var search_variable = $(".search").val();
            var thumbnails_holder = $(".thumbnails-holder");
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=y89qq3t53gmyxjrna294v2jg&q=" + search_variable + "&page-limit=5",
                dataType: "jsonp",
                jsonpCallback: 'callback',
                success: function (data) {
                    for (var i = 0; i < 5; i++) {
                        var thumbnail = ($("<img>").attr("src", data.movies[i].posters.thumbnail)
                                                   .css("margin-right","15px"));
                        var src = thumbnail.attr('src');
                        if (src != "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif") {
                            thumbnails_holder.append(thumbnail);
                        }
                    }
                }
            });
        });



    </script>
</body>
</html>
