<%@ Page Language="C#" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Review Search Engine</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/project.css" />
</head>
<body>
    <!--Navigation -->
    <div class="navbar navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse navbar-inverse" role="navigation">
                <ul class="nav navbar-nav">
                    <li><a class="home" href="#">Home</a></li>
                    <li><a class="profile" href="#">Profile</a></li>
                </ul>
            </div>
        </div>
    </div>
    <br /><br /><br />
    <div class="main container">
        <!-- Search Bar -->
        <div class="search-bar">
            <input class ="search-input form-control" type="text" placeholder="Search your favorite movie"/>
            <button class="search-btn btn btn-primary">Search</button>
            <button class="login-btn btn btn-danger">Login</button>
        </div><br /><br />
        <!-- Search Results Area -->
        <div class="search-results" style="display:none;">
            <div class="search-results-holder row">
                <div class="col-md-3">
                    <img class="movie-thumbnail" src="#" style="height:300px;"/>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-6" id="player" style="display:none;"></div>
            </div><br />
            <h3>Movies You May Like</h3>
            <hr/>
            <div class="similar-movies-holder"></div>
            <br />
             <div class="reviews-holder col-md-6" style="padding:0px;">
            </div>
        </div>
        <!-- Upcoming Movies -->
        <div class="new-movies col-md-4">
            <h3 class="new-movies-h3">Upcoming Movies</h3>
            <hr />
            <div class="upcoming-movies"></div>
            <div class="col-md-2 play-controls">
                <span class="glyphicon glyphicon-chevron-left previous-new-movies" style="font-size:20px;cursor:pointer;opacity:0.8;"></span>       
                <span class="glyphicon glyphicon-chevron-right next-new-movies" style="font-size:20px;cursor:pointer;opacity:0.8;"></span>
            </div>
        </div>
        <!-- Details Area -->
        <div class="details-area">
            <div class="blank"></div>
            <div class="close">&times</div> 
            <div class="details-holder">            
                <div class="detail"></div>
            </div>
        </div>
        <!-- Profile Page -->
        <div class="profile-page" style="display:none;">
            <h3 class="profile-page-h3">Profile</h3>
            <hr style="margin-bottom:0px;"/>
            <div class="btn-toolbar">
            <h4 class="edit" style="cursor:pointer;">edit</h4>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-3">
                    <img class ="profile-pic" src="../profile-pic-default.png" style="height:200px;" />
                </div>
                <div class="col-md-3"">
                    <br />
                    <h5 class="member-since" style="display:inline;">member since:</h5>
                    <h5 class="member-since-value" style="display:inline;">10days</h5>
                    <br /><br />
                    <h5 class="profile-views" style="display:inline;">profile views:</h5>
                    <h5 class="profile-views-value" style="display:inline;">110</h5>
                    <br /><br />
                    <h5 class="reputation" style="display:inline;">reputation:</h5>
                    <h5 class="reputation-value" style="display:inline;">master</h5>
                    <br /><br />
                    <h5 class="email" style="display:inline;">email:</h5>
                    <h5 class="email-value" style="display:inline;">xyz@hotmail.com</h5>
                    <br /><br />
                    <h5 class="real-name" style="display:inline;">real name:</h5>
                    <h5 class="real-name-value" style="display:inline;">kartik</h5>
                </div>
                <div class="col-md-5">
                    <br />
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada leo urna, eu sollicitudin orci pretium quis. Fusce pharetra, ante eu facilisis ornare, turpis lacus euismod dui, eu consectetur est nulla sit amet mauris. Nunc lacinia eros sed feugiat aliquam. Nullam tempor, ante nec ultricies convallis, nulla tortor consequat sem, ut euismod neque felis ac leo. Donec faucibus lectus felis, vitae sollicitudin nisi egestas vitae. Ut ac justo quam. Nunc facilisis leo sit amet neque laoreet, ut tincidunt diam semper. Etiam libero leo, faucibus nec libero nec, scelerisque vulputate nulla. Vivamus gravida libero feugiat ligula facilisis, et suscipit urna dapibus. Donec iaculis pulvinar turpis non aliquet. Nullam eu mauris sit amet mi porttitor feugiat a et nunc. Vivamus placerat neque augue, et tempus risus pretium eget. Donec scelerisque sagittis imperdiet. In sed enim nec tortor fringilla scelerisque vel nec quam. 
                </div>
            </div>
            <br />
            <hr style="margin-bottom:0px;"/>
            <div class="pagination-area">
                <ul class="nav nav-pills">
                  <li class="active likes"><a href="#">Likes</a></li>
                  <li class="reviews"><a href="#">Reviews</a></li>
                  <li class="messages"><a href="#">Messages</a></li>
                </ul>
            </div>
            <hr />
        </div>
    </div>
    <form id="form1" runat="server">
    </form>
    <!-- Templates -->
    <div class="templates" style="display:none;">
        <!-- similar movies templates -->
        <img class="similar-movie-img templates" src="#" style="height:300px;margin-right:20px;"/>
        <!-- reviews templates -->
        <div class="critic templates" style="display:inline;color:#428BCA;"></div>
        <div class="date templates" style="display:inline;margin-left:10px;"></div>
        <div class="quote templates"></div>
        <div class="publication templates"></div>
        <button class="like-btn btn-warning templates">like</button>
        <!-- details of the movie -->
    </div>
    <script src="../jquery/jquery-2.1.0.min.js"></script>
    <script src="../javascript/bootstrap.min.js"></script>
    <script>
        /*
         * Global Variables
         */
        var home = $(".home");
        var profile = $(".profile");
        var search_bar = $(".search-bar");
        var search_input = $(".search-input");
        var search_btn = $(".search-btn");
        var login_btn = $(".login-btn");

        var blank = $(".blank");
        var close = $(".close");
        var upcoming_movies = $(".upcoming-movies");
        var details_holder = $(".details-holder");
        var detail = $(".detail");
        var total_new_movies = 0;
        var previous_new_movies = $(".previous-new-movies");
        var next_new_movies = $(".next-new-movies");
        var new_movies = $(".new-movies");
        var profile_page = $(".profile-page");
        var search_results = $(".search-results");
        var movie_thumbnail = $(".movie-thumbnail");
        var details_area = $(".details-area");
        var videoId;
        var player;
        var reviews_btn = $(".reviews-btn");
        var reviews_holder = $(".reviews-holder");
        var similar_movies_holder = $(".similar-movies-holder");
        /*
         * Page Load Tasks
         */
        $(function () {
            search_input.focus();

            var param = {
                apikey:"y89qq3t53gmyxjrna294v2jg"
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json?",
                data:param,
                dataType: "jsonp",
                jsonpCallback: 'callback1',
                success: function (data) {
                    total_new_movies = data.movies.length;
                    upcoming_movies.css("display", "table");
                    upcoming_movies.empty();
                    for (var i = 0; i < total_new_movies; i++) {
                        upcoming_movies.append($("<img>").attr("src", data.movies[i].posters.original)
                                           .attr("id", i)
                                           .css("height", "400px")
                                           .css('display', 'none')
                                           .on('click', data, clicked));
                    }
                    display_data(0);
                }
            });
        });

        /*
         *Home
         */
        home.click(function (e) {
            search_bar.css('display', 'block');
            new_movies.css('display', 'block');
            profile_page.css('display', 'none');
            search_results.css('display', 'none');
        });

        /*
         * Profile
         */
        profile.click(function (e) {
            profile_page.css('display', 'inline');
            search_bar.css('display', 'none');
            search_results.css('display', 'none');
            new_movies.css('display', 'none');
        });


        /*
         * Search Control
         */
        search_input.keypress(function (e) {
            if (e.keyCode == 13) { // enter is pressed
                search_btn_clicked(e);
            }
        });

        search_btn.click(function (e) {
            search_btn_clicked(e);
        });

        function search_btn_clicked(e) {
            var search_value = search_input.val();
            if (search_value != "") {
                new_movies.css('display', 'none');
                var params = {
                    apikey: "y89qq3t53gmyxjrna294v2jg",
                    q:search_value
                };
                $.ajax({
                    url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?",
                    data:params,
                    dataType: "jsonp",
                    jsonpCallback: 'callback2',
                    success: function (response) {
                        if (response.total != 0) {
                            search_results.css('display', 'block');
                            movie_thumbnail.attr('src', response.movies[0].posters.original).on('click',clicked).attr('id',"tt"+response.movies[0].alternate_ids.imdb);
                            search_value = response.movies[0].title;
                            findSimilarMovies(response.movies[0].id);
                            displayReviews(response.movies[0]);
//                            youtube(search_value + " - trailer"); 
                        }
                    }
                });
            }
        }

        function findSimilarMovies(id) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
                limit: 5
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + id + "/similar.json?",
                data: params,
                dataType: "jsonp",
                jsonpCallbackL: 'callback4',
                success: function (response) {
                    similar_movies_holder.empty();
                    var similar_img = $(".similar-movie-img").clone().removeClass("templates");
                    for (var i = 0; i < response.movies.length;i++ ) {
                        similar_movies_holder.append(similar_img.clone().attr('src',response.movies[i].posters.original));
                    }
                }
            });
        }

        function youtube(movie_name) {
            $.ajax({
                url:"https://www.googleapis.com/youtube/v3/search?part=snippet&q="+movie_name+"&type=video&key=AIzaSyDHaNEKN20GYUi9OGdwjDDQT1FztnmTOEg",
                success: function (response) {
                    videoId = response.items[0].id.videoId;
                    findMovieById();
                }
            });
        }

        function findMovieById() {
            $("#player").css('display', 'inline-block');
            var tag = document.createElement('script');
            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
            if(player != null)
                player.loadVideoById(videoId);
        }
        // 3. This function creates an <iframe> (and YouTube player)
        //    after the API code downloads.
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
                height: '390',
                width: '640',
                videoId: ""+videoId,
                events: {
                    'onReady': onPlayerReady
                }
            });
        }

        // 4. The API will call this function when the video player is ready.
        function onPlayerReady(event) {
            event.target.playVideo();
        }        

        function displayReviews(response) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg"
            }
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + response.id + "/reviews.json?",
                data:params,
                dataType: "jsonp",
                jsonpCallback: 'callback3',
                success: function (data) {
                    reviews_holder.empty();
                    var critic = $(".critic").clone().removeClass("templates");
                    var date = $(".date").clone().removeClass("templates");
                    var quote = $(".quote").clone().removeClass("templates");
                    var publication = $(".publication").clone().removeClass("templates");
                    var like_btn = $(".like-btn").clone().removeClass("templates");
                    for (var i = 0; i < data.reviews.length; i++) {       
                        reviews_holder.append(
                            critic.clone().html(data.reviews[i].critic),
                            date.clone().html(data.reviews[i].date),
                            "<br />",
                            quote.clone().html(data.reviews[i].quote),
                            publication.clone().html(data.reviews[i].publication),
                            "Do you like this review? ", like_btn.clone(), "<br />", "<br />");
                   }
                }
            });
        }
        /*
         * Login Controls
         */
        login_btn.click(function (e) {
            details_area.css('display', 'block');
            blank.css('display','block').css('opacity', '0.5');
            close.css('display', 'block');
            details_holder.css('display', 'block');
            detail.css('display', 'block');
        });

        /*
         * Displaying Upcoming Movies Data
         */
        function display_data(flag) {
            /* flag = 0 : Display first item
             * flag = 1 : Display next item
             * flag = 2 : Display previous item
             */
            if (flag == 0) {
                $("#" + 0).fadeIn(500, "linear");
            } else if (flag == 1) {
                for (var j = 0; j < total_new_movies; j++) {
                    if ($("#" + j).css('display') == 'inline') {
                        $("#" + j).css('display','none');
                        $("#" + ((j + 1) % total_new_movies)).fadeIn(500,"linear");
                        return;
                    }
                }
            } else if (flag == 2) {
                if ($("#" + 0).css('display') == 'inline') {
                    $("#" + 0).css('display', 'none');
                    $("#" + (total_new_movies - 1)).fadeIn(500, "linear");
                } else {
                    for (var j = 1; j < total_new_movies; j++) {
                        if ($("#" + j).css('display') == 'inline') {
                            $("#" + j).css('display', 'none');
                            $("#" + (j - 1)).fadeIn(500, "linear");
                            return;
                        }
                    }
                }
            }
        }

        /*
         * Handling Image Details
         */
        function clicked(response) {
            console.log(response);
            blank.css('display', 'block').css('opacity','0.5');
            close.css('display', 'block');
            details_holder.css('display', 'block');
            detail.css('display', 'block');
            if (response.currentTarget.id != "") {
                var params = {
                    api_key: "56723ab4454644a4f493306c8d6c7240",
                    external_source:"imdb_id"
                };
                $.ajax({
                    url: "https://api.themoviedb.org/3/find/" + response.currentTarget.id,
                    data: params,
                    dataType: 'jsonp',
                    jsonCallBack: 'callback5',
                    success: function (data) {
                        getMovieInfo(data.movie_results[0].id);
                    }
                });
            }
        }

        function getMovieInfo(id) {
            var params = {
                api_key: "56723ab4454644a4f493306c8d6c7240"
            }
            $.ajax({
                url: "https://api.themoviedb.org/3/movie/" + id,
                data: params,
                dataType: 'jsonp',
                success: function (response) {
                    console.log(response);
                    console.log("budget: $" + response.budget);
                    console.log("title: " + response.original_title);
                    console.log("genres: " + response.genres[0].name);
                    console.log(response.overview);
                    console.log(response.popularity);
                    console.log("production house: " + response.production_companies[0].name);
                    console.log("release date: " + response.release_date);
                    console.log("runtime: " + response.runtime);
                    console.log(response.tagline);
                    console.log("rating: " + response.vote_average);
                    console.log("total votes: " + response.vote_count);
                }
            });
        }

        function closedetailspage() {
            blank.css('display','none').css('opacity', 0);
            close.css('display', 'none');
            details_holder.css('display', 'none');
            detail.css('display', 'none');
        }

        close.click(function () {
            closedetailspage();
        });

        $(window).keypress(function (e) {
            if (e.keyCode == 27 && blank.css('display') == 'block') {
                closedetailspage();
            }
        });

        /*
         * Play Controls 
         */
        previous_new_movies.on('mouseenter', function () {
            $(this).css('opacity', 1);
        });
        previous_new_movies.on('mouseleave', function () {
            $(this).css('opacity', 0.7);
        });
        previous_new_movies.click(function (e) {
                display_data(2);
        });

        next_new_movies.on('mouseenter', function () {
            $(this).css('opacity', 1);
        });
        next_new_movies.on('mouseleave', function () {
            $(this).css('opacity', 0.7);
        });
        next_new_movies.click(function (e) {
            display_data(1);
        });
    </script>
</body>
</html>