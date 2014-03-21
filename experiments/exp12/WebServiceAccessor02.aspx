<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/webservice-accessor.css" />
</head>
<body>
    <form id="form1" runat="server">
    </form>
    <div class="container">
        <h3>Creating WebServices</h3>
        <h4>In this simple experiment, I will just get a list of movie objects from the web service</h4>
        <h3 class="heading">Get a list of Movie Objects</h3>
        <button class="go">GO</button>   
        <div class="content">
            <h4 class="content-holder"></h4>
        </div>
        <h4>This is possible by implementing the following method in the web service</h4>
        <pre>
[WebMethod]
public List<MoviesTO> GetMovies()
{
    List<MoviesTO> list = new List<MoviesTO>();
    list.Add(new MoviesTO("Star Wars"));
    list.Add(new MoviesTO("PS I Love You"));
    list.Add(new MoviesTO("Titanic"));
    return list;
}
        </pre>
    <h4>Once we get the list of movie objects, we extract their name, and display the names in the body of the page</h4>
    <h4>To extract the name, we use jquery as follows:</h4>
    <pre>
$.ajax({
        url: "http://net4.ccs.neu.edu/home/kkapila/WebService00.asmx/GetMovies",
        type: 'post',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            for (var i = 0; i < response.d.length; i++) {
             $(&quot;&lt;h4&gt;&quot;).html(response.d[i].name).appendTo(content);
            }
        }
    });
});

    </pre>
    </div>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(function () {
            var content = $(".content");
            $(".go").click(function () {

                $.ajax({
                    url: "http://net4.ccs.neu.edu/home/kkapila/WebService00.asmx/GetMovies",
                    type: 'post',
                    contentType: 'application/json',
                    success: function (response) {
                        content.empty();
                        console.log(response);
                        for (var i = 0; i < response.d.length; i++) {
                            $("<h4>").html(response.d[i].name)
                                     .appendTo(content);
                        }

                    }
                });
            });
        });
    </script>
</body>
</html>
