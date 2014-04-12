proj.favorites = {

    services: {
        checkFavoritesAlreadyExists: function (id) {
            var params = {
                imdbId: id,
                username:proj.state.currentUser.username
            }
            $.ajax({
                url: "http://localhost:1316/MoviesWebService.asmx/checkFavoritesAlreadyExists",
                data: JSON.stringify(params),
                type: 'post',
                contentType: 'application/json',
                success: function (response) {
                    if(response.d == false)
                        proj.favorites.services.addMovieToFavorites(id);
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
                url: "http://localhost:1316/MoviesWebService.asmx/enterFavoriteMovie",
                data: JSON.stringify(params),
                type: 'post',
                contentType: 'application/json',
                success: function(response) {
                    alert('Movie Successfully Added');
                }
            })
        }

    },

}