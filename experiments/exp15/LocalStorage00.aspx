<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" type="text/css" href="../../css/localstorage.css" />
    <title>Local Storage</title>
</head>
<body>
    <form id="form1" runat="server"></form>
    <div class="container">
        <h3>Local Storage Experiments</h3>
        <p>In these sets of experiments, I will demonstrate the use of local storage(cache) in an application.</p>
        <p>In a local storage, the contents are stored in name:value format</p>
        <p>In this experiment, we will just store the values in local storage. We will later see, how we can use these
            values and get information dynamically.
        </p>
        <p>To store a name:value pair, please enter the key and value fields below.</p>
        <input class="key" type="text" placeholder="Enter Key"/><br /><br />
        <input class="value" type="text" placeholder="Enter Value"/><br /><br />
        <button class="submit-btn">Store</button>
        <p>We can store the values in the following way:</p>
        <pre>
localStorage.setItem(key, value);
        </pre>
        <a href="../../fileview/Default.aspx?~/experiments/exp15/LocalStorage00.aspx">Source</a>
    </div>
    <script src ="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(".submit-btn").click(function (e) {
            var key = $(".key").val();
            var value = $(".value").val();
            if (key != "" && value != "") {
                localStorage.setItem(key, value);
                alert('Your data has been successfully been stored in the localStorage');
            } else {
                alert('Either the key or value was left blank');
            }
        });
    </script>
</body>
</html>
