test = {
    init: function () {
        test.dom.init();
        test.controller.init();
    },
    dom: {

        search_button: null,

        init: function () {
            test.dom.search_button = $(".search-button");
        }
    },
    controller: {
        init: function () {
            test.dom.search_button.click(test.controller.search_button_clicked);
        },
        search_button_clicked: function (event) {
            test.services.getAlbums(test.renderer.displayAlbums);
        }
    },
    services: {
        getAlbum: function (callback) {
            var param = {

            }
            $.ajax({
                url: '',
                data: param,
                type: 'post',
                contentType: 'application/json',
                success:callback
            })
        }
    },
    renderer: {
        displayAlbums: function (response) {

        }
    }
}