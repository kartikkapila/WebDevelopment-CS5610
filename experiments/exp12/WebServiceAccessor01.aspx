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
        <h4>In this simple experiment, I will just get a movie object from the web service</h4>
        <h3 class="heading">Get a Movie Object</h3>
        <button class="go">GO</button>
        <div class="content">
            <h4 class="content-holder"></h4>
        </div>
        <h4>This is possible by implementing the following method in the web service</h4>
        <pre>
[WebMethod]
public MoviesTO GetMovie()
{
    return new MoviesTO("Star Wars");   
}
        </pre>
        <h4>Once we get the movie object, we extract its name, and display the name in the body of the page</h4>
        <h4>To extract the name, we use jquery as follows:</h4>
        <pre>
 $.ajax({
        url: "http://net4.ccs.neu.edu/home/kkapila/WebService00.asmx/GetMovie",
        type: 'post',
        contentType: 'application/json',
        success: function (response) {
            content.html(response.d.name);
        }
    });
});
        </pre>
        <a href="../../fileview/Default.aspx?~/experiments/exp12/WebServiceAccessor01.aspx">Source</a>
    </div>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(function () {
            var content = $(".content-holder");
            $(".go").click(function () {

                $.ajax({
                    url: "http://net4.ccs.neu.edu/home/kkapila/WebService00.asmx/GetMovie",
                    type: 'post',
                    contentType: 'application/json',
                    success: function (response) {
                        content.empty();
                        content.html(response.d.name);
                    }
                });
            });
        });
    </script>
</body>
</html>
