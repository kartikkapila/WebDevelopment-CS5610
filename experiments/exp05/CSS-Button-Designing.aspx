<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CSS-Button-Designing.aspx.cs" Inherits="experiments_exp05_CSS_Designing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Button Designing</title>
    <link rel="stylesheet" type="text/css" href="../../css/button-designing.css" />
</head>
<body>
    <form id="form1" runat="server">
    <h2>Button Designing</h2>   
    <h4>We can use the default button or add a style to the default button, as shown in the example.</h4>
    <div class="main">
        <div class="row">
            <div class="left-cell">
                <h4>Default Button</h4>
            </div>
            <div class="cell">
                <button class="default-button">Submit</button>
            </div>
        </div>
        <div class="row">
             <div class="left-cell">
                 <h4>Rectangular Button</h4>
            </div>
             <div class="cell">
                 <button class="custom-button">Submit</button>
            </div>
        </div>
        <div class="row">
             <div class="left-cell">
                 <h4>Rounded Button</h4>
            </div>
            <div class="cell">
                 <button class="round-button">GO</button>
            </div>
        </div>
        <div class="row">
            <div class="left-cell">
                 <h4>Hover over the button</h4>
            </div>
            <div class="cell">
                <button class="active-button">Submit</button>
            </div>
        </div>
        <div class="row">
            <div class="left-cell">
                 <h4>Hover over the button</h4>
            </div>
            <div class="cell">
                <button class="active-round-button">GO</button>
            </div>
        </div>
    </div>
    <div>
        <p>The css to build the rectangular button is as follows:</p>
        <pre class="custom-quotes">
.custom-button
{
    border-radius:8px;
    color:rgb(255,255,255);
    background-color:#FF4000;
    padding:10px 10px;
    font-size:14px;
    line-height:1.42857;
    border:none;
    cursor:pointer;
}
</pre>
    </div>
    <h2>Sources</h2>
    <ul>
        <li><a href="../../fileview/Default.aspx?~/experiments/exp05/CSS-Button-Designing.aspx">ASPX</a></li>
        <li><a href="../../fileview/Default.aspx?~/css/button-designing.css">CSS</a></li>
    </ul>
  
    </form>
</body>
</html>
