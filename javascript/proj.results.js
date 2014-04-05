proj.results = {
    init: function () {
        proj.results.dom.init();
        proj.results.controller.init();
    },
    show: function (movieName) {
        proj.results.services.getMoviebyName(movieName, proj.results.renderer.renderSearchedMovie);
        proj.results.services.getYouTubeId(movieName);
        proj.showPage("results");
    },
    shared_variables: {
        movieId: null,
        videoId: null,
    },
    dom: {
        search_input: null,
        search_results_holder: null,
        movie_thumbnail: null,
        similar_movies_holder: null,
        suggestion_box:null,
        movie_title: null,
        movie_genre: null,
        movie_overview: null,
        movie_tagline: null,
        write_a_review:null,
        reviews_holder: null,
        review_critic: null,
        review_date: null,
        review_quote: null,
        review_publisher: null,
    
        init: function () {
            proj.results.dom.movie_thumbnail = $(".movie-thumbnail");
            proj.results.dom.search_input = $(".search-input");
            proj.results.dom.search_results_holder = $(".search-results-holder");

            proj.results.dom.similar_movies_holder = $(".similar-movies-holder");
            proj.results.dom.suggestion_box = $(".suggestion-box");
            proj.results.dom.movie_info = $(".movie-info");
            proj.results.dom.movie_title = $(".movie-title").clone().removeClass("templates");
            proj.results.dom.movie_genre = $(".movie-genre").clone().removeClass("templates");
            proj.results.dom.movie_overview = $(".movie-overview").clone().removeClass("templates");
            proj.results.dom.movie_tagline = $(".movie-tagline").clone().removeClass("templates");
            proj.results.dom.write_a_review = $(".write-review-action").clone().removeClass("templates");


            proj.results.dom.reviews_holder = $(".reviews-holder");
            proj.results.dom.review_critic = $(".review-critic").clone().removeClass("templates");
            proj.results.dom.review_date = $(".review-date").clone().removeClass("templates");
            proj.results.dom.review_quote = $(".review-quote").clone().removeClass("templates");
            proj.results.dom.review_publisher = $(".review-publisher").clone().removeClass("templates");
        }
    },
    controller: {
        init: function () {
            proj.results.dom.write_a_review.click(function (event) {
                if (proj.state.currentUser.username == null) {
                    proj.showPage("login");
                } else {
                    proj.review.showPage(proj.results.dom.write_a_review.attr('id'),"review");
                }
            });
        },

        findMovieOnYouTubeById: function () {
            $("#player").css('display', 'inline-block');
            var tag = document.createElement('script');
            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
            window.onYouTubeIframeAPIReady = function () {
                youtubePlayer = new YT.Player('player', {
                    height: '390',
                    width: '640',
                    videoId: "" + proj.results.shared_variables.videoId,
                    events: {
                        'onReady': onPlayerReady
                    }
                });
            }
            window.onPlayerReady = function (event) {
                event.target.playVideo();
            }
            if (typeof (window.youtubePlayer) != 'undefined')
                window.youtubePlayer.loadVideoById(proj.results.shared_variables.videoId);
        },

    },
    services: {
        getMoviebyName: function (movieName, callback) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
                q: movieName
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?",
                data: params,
                dataType: "jsonp",
                success: callback
            });
        },

        getMovieById: function (id, callback) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
            }
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + id + ".json?",
                data: params,
                dataType: "jsonp",
                success: callback
            });
        },

        getSimilarMoviesbyId: function (id, callback) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
                limit: 5
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + id + "/similar.json?",
                data: params,
                dataType: "jsonp",
                success: callback
            });
        },

        getYouTubeId: function (movieName) {
            $.ajax({
                url: "https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + movieName + "Trailer" + "&type=video&key=AIzaSyDHaNEKN20GYUi9OGdwjDDQT1FztnmTOEg",
                success: function (response) {
                    proj.results.shared_variables.videoId = response.items[0].id.videoId;
                    proj.results.controller.findMovieOnYouTubeById();
                }
            });
        },

        searchMovieInfo: function (imdbId,callback) {
            var params = {
                api_key: "56723ab4454644a4f493306c8d6c7240"
            }
            $.ajax({
                url: "https://api.themoviedb.org/3/movie/" + imdbId,
                data: params,
                dataType: 'jsonp',
                success: callback
            });
        },
        getReviews: function (id, callback) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg"
            }
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + id + "/reviews.json?",
                data: params,
                dataType: "jsonp",
                success: callback
            });
        }
    },

    renderer: {
        renderSearchedMovie: function (response) {
            if (typeof (response.movies) == 'undefined') {
                proj.results.dom.movie_thumbnail.attr('src', response.posters.original).attr('id', "tt" + response.alternate_ids.imdb).fadeIn(700, "swing");
                proj.results.shared_variables.movieId = response.id;
            } else {
                proj.results.dom.movie_thumbnail.attr("src", response.movies[0].posters.original).attr('id', "tt" + response.movies[0].alternate_ids.imdb).fadeIn(700, "swing");
                proj.results.shared_variables.movieId = response.movies[0].id;
                proj.results.services.searchMovieInfo("tt" + response.movies[0].alternate_ids.imdb, proj.results.renderer.renderMovieInfo);
                proj.results.services.getReviews(response.movies[0].id, proj.results.renderer.renderMovieReviews);
            }
            if (proj.results.shared_variables.movieId != null) {
                proj.results.services.getSimilarMoviesbyId(proj.results.shared_variables.movieId, proj.results.renderer.renderSimilarMovies);
            }
        },

        renderSimilarMovies: function (response) {
            proj.results.dom.similar_movies_holder.empty();
            var similar_img = $(".similar-movie-img").clone().removeClass("templates");
            if (response.movies.length != 0) {
                for (var i = 0; i < response.movies.length; i++) { 
                    proj.results.dom.similar_movies_holder.append(
                        similar_img
                        .clone()
                        .attr('src', response.movies[i].posters.original)
                        .attr('id', response.movies[i].title)
                        .fadeIn(700, "swing")
                        .on('click', response, function (response) {
                            proj.results.show(response.currentTarget.id);
                        }));
                }
            } else {
                proj.results.dom.similar_movies_holder.append(
                    proj.results.dom.suggestion_box.html("No Suggestions"));
            }

        },

        renderMovieInfo: function (response) {
            proj.results.dom.movie_info.append(
            proj.results.dom.movie_title.html(response.title),
            proj.results.dom.movie_genre.html(response.genres[0].name),
            proj.results.dom.movie_overview.html(response.overview),
            proj.results.dom.movie_tagline.html(response.tagline),
            proj.results.dom.write_a_review.attr('id',response.imdb_id)
            );
        },

        renderMovieReviews: function (response) {
            for (var i = 0; i < response.reviews.length; i++) {
                if (response.reviews[i].critic != "") {
                    proj.results.dom.reviews_holder.append(
                        proj.results.dom.review_critic.clone().html(response.reviews[i].critic),
                        proj.results.dom.review_date.clone().html(response.reviews[i].date),
                        "<br />",
                        proj.results.dom.review_quote.clone().html(response.reviews[i].quote),
                        proj.results.dom.review_publisher.clone().html(response.reviews[i].publication),
                        "<br />", "<br />");
                }
            }
        }
    }
};