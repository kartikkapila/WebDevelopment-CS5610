<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Local Storage</title>
    <link rel="stylesheet" type="text/css" href="../../css/localstorage.css" />
</head>
<body>
    <form id="form1" runat="server"></form>
    <div class="container">
        <h3>Local Storage Experiments</h3>
        <p>In this experiment, you will see that we can retrieve the value from the local storage, even if
            we are currently on a different page.
        </p>
        <p>Please enter the key value you stored in the last experiment, to get the value associated with it.</p>
        <input class="key" type="text" placeholder="Enter Key"/><br /><br />
        <button class="submit-btn">Store</button>
        <p>This is possible using the following code:</p>
        <pre>
var value = localStorage.getItem(key);
        </pre>
        <a href="../../fileview/Default.aspx?~/experiments/exp15/LocalStorage01.aspx">Source</a>
    </div>
    <script src ="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(".submit-btn").click(function (e) {
            var key = $(".key").val();
            if (key != "") {
                var value = localStorage.getItem(key);
                alert(value);
            } else {
                alert('The key was left blank');
            }
        });
    </script>
</body>
</html>
