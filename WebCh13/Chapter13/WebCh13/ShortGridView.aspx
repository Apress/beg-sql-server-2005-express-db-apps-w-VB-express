<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ShortGridView.aspx.vb" Inherits="ShortGridView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ShipperID"
      DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
      <Columns>
       <asp:BoundField DataField="ShipperID" HeaderText="ShipperID" ReadOnly="True" SortExpression="ShipperID" />
       <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
       <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
      </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:northwndConnectionString1 %>"
      DeleteCommand="DELETE FROM [Shippers] WHERE [ShipperID] = @original_ShipperID" InsertCommand="INSERT INTO [Shippers] ([CompanyName], [Phone]) VALUES (@CompanyName, @Phone)"
      ProviderName="<%$ ConnectionStrings:northwndConnectionString1.ProviderName %>" SelectCommand="SELECT [ShipperID], [CompanyName], [Phone] FROM [Shippers]"
      UpdateCommand="UPDATE [Shippers] SET [CompanyName] = @CompanyName, [Phone] = @Phone WHERE [ShipperID] = @original_ShipperID">
      <InsertParameters>
       <asp:Parameter Name="CompanyName" Type="String" />
       <asp:Parameter Name="Phone" Type="String" />
      </InsertParameters>
      <UpdateParameters>
       <asp:Parameter Name="CompanyName" Type="String" />
       <asp:Parameter Name="Phone" Type="String" />
       <asp:Parameter Name="original_ShipperID" Type="Int32" />
      </UpdateParameters>
      <DeleteParameters>
       <asp:Parameter Name="original_ShipperID" Type="Int32" />
      </DeleteParameters>
     </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
