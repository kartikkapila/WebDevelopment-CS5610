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
        <h4>In this week, I will be creating my own webservice. I plan to use this in my project to get the data asynchronously.</h4>
        <h4>In this simple experiment, I will just get a hard-coded message from the web service</h4>
        <br />
        <h3 class="heading">Say Hi to the WebService</h3>
        <button class="go">GO</button>   
        <div class="content">
            <h4 class="content-holder"></h4>
        </div>
        <br /><br />
        <h4>To do this, we will invoke the webservice, using the following url.</h4>
        <pre>http://net4.ccs.neu.edu/home/kkapila/WebService00.asmx/HelloWorld</pre>
        <a href="../../fileview/Default.aspx?~/experiments/exp12/WebServiceAccessor00.aspx">Source</a>
    </div>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(function () {
            var content = $(".content-holder");
            $(".go").click(function () {

                $.ajax({
                    url: "http://net4.ccs.neu.edu/home/kkapila/WebService00.asmx/HelloWorld",
                    type: 'post',
                    contentType: 'application/json',
                    success: function (response) {
                        content.html(response.d);
                    }
                });
            });
        });
    </script>
</body>
</html>
