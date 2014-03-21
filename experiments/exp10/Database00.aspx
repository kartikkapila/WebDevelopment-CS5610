<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Database Experiment 01</title>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Displaying User Information in Grid Format</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:kkapilaCS %>" 
            ProviderName="<%$ ConnectionStrings:kkapilaCS.ProviderName %>" 
            SelectCommand="SELECT [id], [username], [email] FROM kkapila.[USERS]">
        </asp:SqlDataSource>
        <a href="../../fileview/Default.aspx?~/experiments/exp10/Database00.aspx">Source</a>  
    </form>
</body>
</html>