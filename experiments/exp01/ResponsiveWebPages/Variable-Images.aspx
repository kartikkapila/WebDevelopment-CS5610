<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Variable Images</title>
    <link rel="stylesheet" type="text/css" href="../../../css/variable-images.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="intro">
    <h3>Variable Images</h3>
    <h4>Here, the area with green background will try to maintain a margin of 400px on its right side from the area in pink background.
            Thus the side bar won't wrap around the text and image area.</h4>
    <h4>Also, the image will adjust its size as per the size of the screen.</h4></div>
    <div class="container">
        <div class="sidebar">
            <h3>Quick Links</h3>
            <ul>
                <li>
                    <a href="../../../fileview/Default.aspx?~/experiments/exp01/ResponsiveWebPages/Variable-Images.aspx">ASPX Source</a>
                </li>
                <li>
                    <a href="../../../fileview/Default.aspx?~/css/variable-images.css">CSS</a>
                </li>
            </ul>
        </div>
        <div class="main">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper quam et lectus euismod tempor
        Donec euismod risus risus, ac porttitor lacus luctus a. Pellentesque tristique sem quis dui commodo, at feugiat urna vulputate.</p>
        <img src="../../../images/leh.jpg" />
        <p>Morbi diam dui, cursus ac tortor at, ullamcorper placerat libero. Aenean lacinia magna ut est tempus lacinia. Sed ultricies nec neque nec malesuada. Donec augue dui, aliquet at magna a, consequat vulputate libero. Proin vitae nulla at tellus vestibulum pulvinar et sed lacus. In ut molestie urna. Suspendisse luctus luctus ipsum vel dignissim. Curabitur vel venenatis nisl, mollis bibendum diam. Curabitur in metus vehicula, pretium sem vitae, sollicitudin urna. Sed condimentum nibh a neque auctor varius. Praesent eget orci at orci commodo eleifend id sit amet nisi. Aenean rhoncus, quam at laoreet iaculis, dui nisi feugiat magna, ut accumsan felis lectus ut diam. Maecenas at neque malesuada neque ullamcorper rutrum. Sed pretium ac velit sed elementum. Nam nec tortor vitae nibh fringilla viverra. Nullam pulvinar suscipit risus, pellentesque dapibus urna egestas eget.</p>
        </div>

    </div>
    </form>
</body>
</html>
