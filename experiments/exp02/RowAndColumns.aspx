<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RowAndColumns.aspx.cs" Inherits="experiments_exp02_RowAndColumns" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rows&Columns</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../../css/home.css" />
    <link rel="stylesheet" type="text/css" href="../../css/row-and-columns.css" />
</head>
<body>
<form id="form1" runat="server">
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
</div>
<div class="main container">
    <h3>Page Layout</h3>
    <div class="row outer">
        <div class="col-md-12">
         <h5>Using Bootstrap's rows and columns we will organize our contents on the page.
            This row will occupy all the columns. The first 4 columns will be used for the image.
            The next 4 columns will be used for introduction.</h5>
        <h5>The last 4 columns will consist of a sidebar, which will have all the necessary tools required for grading.</h5>
        </div>
    </div>
    <div class="row inner">
        <div class="col-md-4">
             <h5>For Image</h5>
         </div>
         <div class="col-md-4">
             <h5>For Introduction</h5>
         </div>
         <div class="col-md-4">
             <h5>For Sidebar</h5>
         </div>
     </div>
    <h5>The above can be achieved by</h5>
    <pre>&lt;div class=&quot;row inner&quot;&gt;
   &lt;div class=&quot;col-md-4&quot;&gt;
      &lt;h5&gt;For Image&lt;/h5&gt;
   &lt;/div&gt;
   &lt;div class=&quot;col-md-4&quot;&gt;
      &lt;h5&gt;For Introduction&lt;/h5&gt;
   &lt;/div&gt;
   &lt;div class=&quot;col-md-4&quot;&gt;
      &lt;h5&gt;For Sidebar&lt;/h5&gt;
   &lt;/div&gt;
&lt;/div&gt;</pre>
    <h5>To go to home page click <a href="../../Default.aspx">Home</a> </h5>
    <h2>Source</h2>
    <ul><li><a href="../../fileview/Default.aspx?~/experiments/exp02/RowAndColumns.aspx">ASPX</a></li></ul>
</div>
    </form>
    <script src="../../javascript/bootstrap.min.js"></script>
</body>
</html>
