<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LookupSSEData.aspx.vb" Inherits="LookupSSEData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CompanyName"
      DataValueField="CustomerID" Height="150px" Width="250px" AutoPostBack="True"></asp:ListBox><asp:SqlDataSource
       ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\northwnd.mdf;Integrated Security=True;User Instance=True"
       ProviderName="System.Data.SqlClient" SelectCommand="SELECT [CustomerID], [CompanyName] FROM [Customers]">
      </asp:SqlDataSource>
    <div>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID"
      DataSourceID="SqlDataSource2">
      <Columns>
       <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" >
        <ItemStyle HorizontalAlign="Right" />
       </asp:BoundField>
       <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" >
        <ItemStyle HorizontalAlign="Right" />
       </asp:BoundField>
       <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" DataFormatString="{0:d}" >
        <ItemStyle HorizontalAlign="Right" />
       </asp:BoundField>
       <asp:BoundField DataField="Freight" HeaderText="Freight" SortExpression="Freight" DataFormatString="{0:c}" >
        <ItemStyle HorizontalAlign="Right" />
       </asp:BoundField>
       <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" DataFormatString="{0:c}" >
        <ItemStyle HorizontalAlign="Right" />
       </asp:BoundField>
       <asp:BoundField DataField="Freight &amp; Subtotal" HeaderText="Freight &amp; Subtotal"
        ReadOnly="True" SortExpression="Freight &amp; Subtotal" DataFormatString="{0:c}" >
        <ItemStyle HorizontalAlign="Right" />
       </asp:BoundField>
      </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\northwnd.mdf;Integrated Security=True;User Instance=True"
      ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [vOSubtotals] WHERE ([CustomerID] = @CustomerID)">
      <SelectParameters>
       <asp:ControlParameter ControlID="ListBox1" DefaultValue="ALFKI" Name="CustomerID"
        PropertyName="SelectedValue" Type="String" />
      </SelectParameters>
     </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
