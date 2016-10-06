<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PagedSortedEdited.aspx.vb" Inherits="PagedSortedEdited" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
      AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1"
      EmptyDataText="There are no data records to display.">
      <Columns>
       <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
       <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
       <asp:BoundField DataField="ContactName" HeaderText="ContactName" SortExpression="ContactName" />
      </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:northwndConnectionString1 %>"
      DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID"
      InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax)"
      ProviderName="<%$ ConnectionStrings:northwndConnectionString1.ProviderName %>" SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax] FROM [Customers]"
      UpdateCommand="UPDATE [Customers] SET [CompanyName] = @CompanyName, [ContactName] = @ContactName, [ContactTitle] = @ContactTitle, [Address] = @Address, [City] = @City, [Region] = @Region, [PostalCode] = @PostalCode, [Country] = @Country, [Phone] = @Phone, [Fax] = @Fax WHERE [CustomerID] = @original_CustomerID">
      <InsertParameters>
       <asp:Parameter Name="CustomerID" Type="String" />
       <asp:Parameter Name="CompanyName" Type="String" />
       <asp:Parameter Name="ContactName" Type="String" />
       <asp:Parameter Name="ContactTitle" Type="String" />
       <asp:Parameter Name="Address" Type="String" />
       <asp:Parameter Name="City" Type="String" />
       <asp:Parameter Name="Region" Type="String" />
       <asp:Parameter Name="PostalCode" Type="String" />
       <asp:Parameter Name="Country" Type="String" />
       <asp:Parameter Name="Phone" Type="String" />
       <asp:Parameter Name="Fax" Type="String" />
      </InsertParameters>
      <UpdateParameters>
       <asp:Parameter Name="CompanyName" Type="String" />
       <asp:Parameter Name="ContactName" Type="String" />
       <asp:Parameter Name="ContactTitle" Type="String" />
       <asp:Parameter Name="Address" Type="String" />
       <asp:Parameter Name="City" Type="String" />
       <asp:Parameter Name="Region" Type="String" />
       <asp:Parameter Name="PostalCode" Type="String" />
       <asp:Parameter Name="Country" Type="String" />
       <asp:Parameter Name="Phone" Type="String" />
       <asp:Parameter Name="Fax" Type="String" />
       <asp:Parameter Name="original_CustomerID" Type="String" />
      </UpdateParameters>
      <DeleteParameters>
       <asp:Parameter Name="original_CustomerID" Type="String" />
      </DeleteParameters>
     </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
