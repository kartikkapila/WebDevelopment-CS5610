<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" type ="text/css" href="../../css/home.css" />
    <style>
        @media (min-width:610px)
        {
            .search
            {
                width:500px;
            }
        }
        @media (max-width:609px)
        {
            .search
            {
                width:auto;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h3 style="display:table;">Creating the search Page</h3>
        <div class="details-showers" style="width:500px;height:500px;display:none;float:right;"></div>
        <p style="display:table;">Enter a movie name and click on search.</p>
        <h5>In this experiment, once you search for a movie, hover over the thumbnail, to see more details about the movie.</h5>
        <div class="search-bar" style="display:table;">
             <input class ="search form-control" type="text" placeholder="Enter Movie Name" style="float:left;display:table;"/>&nbsp
             <button class="search-btn btn btn-primary" style="clear:right;">Search</button>
        </div>
        <br />
        <div class="thumbnails-holder">
        </div>
        <p>This is possible using the following function.</p>
        <pre>thumbnail.on(&apos;mouseenter&apos;, data, click_pressed)
         .on(&apos;mouseleave&apos;, data, function () {
                details_shower.empty();
         });</pre>
          <h5>Overe here, we use the event-delegation model. We set the on mouseenter event on all the thumbnail variables.</h5>
        <h5>So on mouseenter, the function click_pressed is called.</h5>
        <h5>In click_pressed function, we query the data object and extract the information about the movie title, running time and display it in a div, which was initially set to display:none</h5>
        <pre>function click_pressed(info) {
            var details_shower = $(&quot;.details-showers&quot;);
            details_shower.empty();
            details_shower.css(&quot;display&quot;, &quot;table&quot;);
            details_shower.append(
                $(&quot;&lt;img&gt;&quot;).attr(&quot;src&quot;, info.data.movies[info.target.id].posters.thumbnail)
                                            .css(&quot;display&quot;, &quot;table&quot;)
                                            .css(&quot;float&quot;, &quot;left&quot;)
                                            .css(&quot;margin-right&quot;, &quot;10px&quot;),
                $(&quot;&lt;h3&gt;&quot;).text(info.data.movies[info.target.id].title)
                         .css(&quot;margin-top&quot;,&quot;0px&quot;),
                $(&quot;&lt;h5&gt;&quot;).text(&quot;Running Time: &quot; + info.data.movies[info.target.id].runtime + &quot;mins&quot;),
                $(&quot;&lt;h5&gt;&quot;).text(info.data.movies[info.target.id].critics_consensus));

        }</pre>
         <a href="../../fileview/Default.aspx?~/experiments/exp09/WebService03.aspx">ASPX Source</a>
    </div>
    <form id="form1" runat="server">
    </form>


    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>
    <script>
        $(".search-bar").click(function () {
            var search_bar = $(".search-bar");
            var search_variable = $(".search").val();
            $(".search").val('');
            var details_shower = $(".details-showers");
            var thumbnails_holder = $(".thumbnails-holder");
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=y89qq3t53gmyxjrna294v2jg&q=" + search_variable + "&page-limit=5",
                dataType: "jsonp",
                jsonpCallback: 'myCRAAAAAAZYcallbackNAME',
                success: function (data) {
                    thumbnails_holder.empty();
                    console.log(data);
                    for (var i = 0; i < 5; i++) {
                        var thumbnail = ($("<img>").attr("src", data.movies[i].posters.thumbnail));
                        var src = thumbnail.attr('src');
                        if (src != "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif") {
                            thumbnail.css("margin-right", "15px");
                            thumbnail.attr("id", i);
                            thumbnail.on('mouseenter', data, click_pressed)
                                     .on('mouseleave', data, function () {
                                         details_shower.empty();
                                     });
                            thumbnails_holder.append(thumbnail);
                        }
                    }
                }
            });
        });

        function click_pressed(info) {
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
    </script>
</body>
</html>