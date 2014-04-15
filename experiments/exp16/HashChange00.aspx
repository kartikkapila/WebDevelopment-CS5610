<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
    <title></title>
</head>
<body>
    <div class="container">
        <h4>Hash Experiments</h4>
        <h5>In these sets of experiments, we will implement a single page application using the hash change event.</h5>
        <h5>In this experiment, whenever you click on any of the links, the hash changed event is trigged.</h5>
        <a href="#home">Home</a>
        <a href="#profile">Profile</a>
        <h5>The code that we use to figure out if there is a  hash changed is as follows:</h5>
        <pre>
        window.onhashchange = handleHashChanged;
        function handleHashChanged() {
            alert('hash changed');
        }

        </pre>
        <a href="../../fileview/Default.aspx?~/experiments/exp16/HashChange00.aspx">Source</a>
    </div>
    <form id="form1" runat="server">
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        window.onhashchange = handleHashChanged;
        function handleHashChanged() {
            alert('hash changed');
        }
    </script>
</body>
</html>
