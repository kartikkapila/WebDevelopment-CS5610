<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Database Experiment 03</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />    
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h3>Database Experiments</h3>
        <h5>In these sets of experiments, we will try to access the database tables, retrieve the data,
            and display it in different formats.
        </h5>
        <h4>Displaying user information using Repeater</h4>
        <div class="row">
            <div class="col-md-8">
                <asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="repeater">
                            <div class="id">
                                <h5>id:<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' /></h5></div>
                            <div class="username">
                                <h5>username:<asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' /></h5></div>
                            <div class="email">
                                <h5>email:<asp:Label ID="Label1" runat="server" Text='<%# Eval("email") %>' /></h5></div>
                        </div>        
                   </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:kkapilaCS %>"
                    ProviderName="<%$ ConnectionStrings:kkapilaCS.ProviderName %>"
                    SelectCommand="SELECT [id], [username], [email] FROM kkapila.[Users]">
                </asp:SqlDataSource>
            </div>
        </div>  
    <a href="../../fileview/Default.aspx?~/experiments/exp10/Database02.aspx">Source</a>  
    </div>
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
</body>
</html>
