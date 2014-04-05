<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Display Property</title>
    <link rel="stylesheet" type="text/css" href="../../css/display-property.css" />
</head>
<body>
    <form id="form1" runat="server">
    <h2>display:table property</h2> 
    <p>Using html tables for layout design is considered to be bad practice for the following reasons:</p>
    <ol>
        <li>Tables take more time to download</li>
        <li>CSS gives us more flexibility and control over the layout as compared to tables</li>
    </ol>
    <p>Below, I have shown how we can get the look and feel of a html table using css.</p>
    <div class="main">
        <div class="row">
            <div class="left-cell">
                <p>Default Button</p>
            </div>
            <div class="cell">
                <button class="default-button">Submit</button>
            </div>
        </div>
        <div class="row">
             <div class="left-cell">
                 <p>Rectangular Button</p>
            </div>
             <div class="cell">
                 <button class="custom-button">Submit</button>
            </div>
        </div>
        <div class="row">
             <div class="left-cell">
                 <p>Rounded Button</p>
            </div>
            <div class="cell">
                 <button class="round-button">GO</button>
            </div>
        </div>
        <div class="row">
            <div class="left-cell">
                 <p>Hover over the button</p>
            </div>
            <div class="cell">
                <button class="active-button">Submit</button>
            </div>
        </div>
        <div class="row">
            <div class="left-cell">
                 <p>Hover over the button</p>
            </div>
            <div class="cell">
                <button class="active-round-button">GO</button>
            </div>
        </div>
    </div>
    <p>The dashed green color border is obtained by using display:table as follows:</p>
    <pre>
.main {
    display:table;
    width:50%;
    border:2px green dashed;
}
    </pre>
    <p>Next we design the row by using display:table-row</p>
    <pre>
.row {
    margin:10px 10px;
    display:table-row;
    text-align:center;
}
    </pre>
    <p>Next we use cells to place our data inside the rows, using display:table-cell</p>
    <pre>
.cell {
    display:table-cell;
    width:50%;
    border:1px dashed red; 
}
    </pre>
    <h2>Sources</h2>
    <ul><li><a href="../../fileview/Default.aspx?~/experiments/exp05/CSS-Table-Display.aspx">ASPX</a></li>
        <li><a href="../../fileview/Default.aspx?~/css/display-property.css">CSS</a></li>
    </ul>
    </form>
</body>
</html>
