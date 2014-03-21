<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Database Experiment 02</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h3>Displaying User Information through Paging</h3>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="2">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:kkapilaCS %>" 
            ProviderName="<%$ ConnectionStrings:kkapilaCS.ProviderName %>" 
            SelectCommand="SELECT [id], [username], [password], [email] FROM kkapila.[Users]">
        </asp:SqlDataSource>
    <a href="../../fileview/Default.aspx?~/experiments/exp10/Database01.aspx">Source</a>    
    </div>
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
</body>
</html>
