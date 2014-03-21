<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Responsive WebPage</title>
    <link rel="stylesheet" type="text/css" href="../../../css/responsive-side-bars.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
         <div class="body">
            <h3>Responsive Side Bar</h3>
             <h4>In this experiment, the sidebar wraps to the bottom, if it cannot fit in the provided width.</h4>
             <h4>One way of doing this is by using the media element in css, as follows:</h4>
             <div class="quote">@media (min-width:50px) and (max-width:600px) {
    .wrapper {
        width: 100%;
        margin: auto;
    }
}</div>
        <p>Here when the width of the screen is between 50px and 600px, the sidebar wraps to the content on the left side of the page</p>
         </div>
        <div class="sidebar">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="../../../fileview/Default.aspx?~/experiments/exp01/ResponsiveWebPages/Responsive-side-bars.aspx">ASPX Source</a></li>
                <li><a href="../../../fileview/Default.aspx?~/css/responsive-side-bars.css">CSS</a></li>
            </ul>
        </div>
        </div> 
    </form>
</body>
</html>
