proj.favorites = {

    services: {
        checkFavoritesAlreadyExists: function (id) {
            var params = {
                imdbId: id,
                username:proj.state.currentUser.username
            }
            $.ajax({
                url: "http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/checkFavoritesAlreadyExists",
                //url: "http://localhost:1316/MoviesWebService.asmx/checkFavoritesAlreadyExists",
                data: JSON.stringify(params),
                type: 'post',
                contentType: 'application/json',
                success: function (response) {
                    if (response.d == false) {
                        proj.favorites.services.addMovieToFavorites(id);
                    }
                    else {
                        alert('Movie Aready in Favorites');
                    }
                }
            });
        },

        addMovieToFavorites: function (id) {
            var params = {
                imdbId: id,
                username: proj.state.currentUser.username
            }
            $.ajax({
                url:"http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/enterFavoriteMovie",
                //url: "http://localhost:1316/MoviesWebService.asmx/enterFavoriteMovie",
                data: JSON.stringify(params),
                type: 'post',
                contentType: 'application/json',
                success: function (response) {
                    proj.favorites.services.incrementFavoritesCount(id);
                    alert('Movie Successfully Added');
                }
            })
        },

        incrementFavoritesCount: function (id) {
            var params = {
                imdbId : id
            }
            $.ajax({
                url: "http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/incrementFavoritesCount",
                //url: "http://localhost:1316/MoviesWebService.asmx/incrementFavoritesCount",
                data: JSON.stringify(params),
                type: 'post',
                contentType: 'application/json',
                success: function (response) { }

            });
        },

    },

}