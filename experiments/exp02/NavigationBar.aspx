<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NavigationBar.aspx.cs" Inherits="experiments_exp02_MenuBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Navigation Bar</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
          <div class="collapse navbar-collapse navbar-inverse">
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Project</a></li>
                    <li><a href="#">Experiments</a></li>
                    <li><a href="#">Blog</a></li>
                </ul>
          </div>
        </div>
    <div class="main container">
    <h3>Navigation Bar</h3>
    <h5>To add the Navigation Bar, we use</h5>
    <pre>&lt;div class=&quot;container&quot;&gt;
   &lt;div class=&quot;collapse navbar-collapse navbar-inverse&quot;&gt;
      &lt;ul class=&quot;nav navbar-nav&quot;&gt;
         &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Home&lt;/a&gt;&lt;/li&gt;
         &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Project&lt;/a&gt;&lt;/li&gt;
         &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Experiments&lt;/a&gt;&lt;/li&gt;
         &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Blog&lt;/a&gt;&lt;/li&gt;
     &lt;/ul&gt;
  &lt;/div&gt;
&lt;/div&gt;</pre>
    <h5>Here navbar-inverse gives the black background to the navigation bar along with some text-styling. The left margin comes from the container class.</h5>
    <h2>Source</h2>
    <ul><li><a href="../../fileview/Default.aspx?~/experiments/exp02/NavigationBar.aspx">ASPX</a></li></ul>
    </div>
    </form>
    <script src="../../javascript/bootstrap.min.js"></script>
</body>
</html>
