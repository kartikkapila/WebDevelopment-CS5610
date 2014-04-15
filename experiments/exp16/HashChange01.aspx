<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
</head>
<body>
    <div class="container">
        <h4>Hash Experiments</h4>
        <h5>In these sets of experiments, we will implement a single page application using the hash change event.</h5>
        <h5>In this experiment, whenever you click on any of the links, the hash changed event is trigged, and an alert
            will be displayed showing the hash value.
        </h5>
        <div class="row">
            <a href="#home">Home</a>
            <a href="#profile">Profile</a>
        </div>
        <h5>This is possible using the following code:</h5>
        <pre>
            var hashValue = location.hash;
            hashValue = hashValue.replace("#", "");
            alert(hashValue + " clicked");
        </pre>
        <h5>We replace the # with a blank space to retrieve page name.</h5>     
        <a href="../../fileview/Default.aspx?~/experiments/exp16/HashChange01.aspx">Source</a>
    </div>
    <form id="form1" runat="server">
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        window.onhashchange = handleHashChanged;
        function handleHashChanged() {
            var hashValue = location.hash;
            hashValue = hashValue.replace("#", "");
            alert(hashValue + " clicked");
        }
    </script>
</body>
</html>
