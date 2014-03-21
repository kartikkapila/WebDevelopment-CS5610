<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Variable Layout</title>
    <link rel="stylesheet" type="text/css" href="../../../css/variable-layout.css" />
</head>
<body>
    <form id="form1" runat="server">
      <div class="intro">
        <h3>Variable Layout</h3>
        <h4>Here, the area with green background will try to maintain a margin of 400px on its right side from the area in pink background.
            Thus the side bar won't wrap around the text area, as it did in the last experiment</h4>
          </div>
        <div class="container">
        <div class="sidebar">
            <h3>Quick Links</h3>
            <ul>
                <li>
                    <a href="../../../fileview/Default.aspx?~/experiments/exp01/ResponsiveWebPages/Variable-Layout.aspx">ASPX Source</a>
                </li>
                <li>
                    <a href="../../../fileview/Default.aspx?~/css/variable-layout.css">CSS</a>
                </li>
            </ul>
        </div>
        <div class="main">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper quam et lectus euismod tempor.</p>
            <p>Donec euismod risus risus, ac porttitor lacus luctus a. Pellentesque tristique sem quis dui commodo, at feugiat urna vulputate. Curabitur vestibulum dui sit amet lacinia pretium. Nunc dictum quam sed interdum malesuada. Curabitur faucibus consectetur massa, eu auctor velit consequat vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse placerat quam vel ligula faucibus, quis dictum eros dignissim. Proin aliquet scelerisque ante, sed scelerisque mi vestibulum a. Donec quis lacinia orci. Donec tincidunt velit nisi, vel dignissim libero cursus vestibulum. In consequat lorem vel nunc commodo blandit. Phasellus aliquam congue eros id tincidunt. Phasellus posuere urna eros, nec molestie ligula volutpat ut. Sed suscipit mi vel feugiat rutrum. </p>
        </div>
        
    </div>
    </form>
</body>
</html>
