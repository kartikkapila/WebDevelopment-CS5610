<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="experiments_exp03_HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HomePage</title>
    <link rel="stylesheet" type="text/css" href="../../css/homepage.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="nav-background-provider">
        <div class="margin-provider">
            <ul class="nav-bar-provider">
                <li><a href="#">Home</a></li>
                <li><a href="#">Project</a></li>
                <li><a href="#">Experiments</a></li>
                <li><a href="#">Blog</a></li>
            </ul>    
        </div>
    </div>
    <div class="table margin-provider">
        <div class="image-cell">
            <img src="../../me1.jpg" style="width:100%;border: solid;border-radius: 55px;"/>
        </div>
        <div class="content-cell">
            <h3>About Me</h3>
            <p>Hi everyone. My name is Kartik Kapila. I am currently pursuing Master's of Computer Science at Northeastern University.</p>
            <p>This website is being developed as part of <b>CS5610: Web Development </b>course taught by <b>Prof. Jose Annunziato</b>.</p>
            <p>In my Engineering days, I really liked coding in <b>PHP</b> and I am looking forward to learn the following Web Technologies in this course:</p>
            <ul>
                <li>JavaScript</li>
                <li>jQuery</li>
                <li>Web Services</li>
            </ul>
            <h5>Email:kkapila@ccs.neu.edu</h5>
        </div>
        <div class="tools-cell">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="sitestatistics/" target="_blank">SiteStatistics</a></li>
                <li><a href="statistics/" target="_blank">Statistics</a></li>
                <li><a href="source/" target="_blank">Source</a></li>
                <li><a href="search/" target="_blank">Search</a></li>
                <li><a href="searchtree/" target="_blank">SearchTree</a></li>
                <li><a href="textview/" target="_blank">TextView</a></li>
                <li><a href="filelist.aspx" target="_blank">FileList</a></li>
                <li><a href="autofile.aspx" target="_blank">AutoFile</a></li>
                <li><a href="images/autoimage.aspx" target="_blank">Images</a></li>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
