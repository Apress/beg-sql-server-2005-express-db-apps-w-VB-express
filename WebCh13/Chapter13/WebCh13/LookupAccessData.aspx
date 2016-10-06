<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LookupAccessData.aspx.vb" Inherits="LookupAccessData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:Label ID="Label1" runat="server" Text="Enter CustomerID: "></asp:Label>
     <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <div>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID"
      DataSourceID="AccessDataSource1" EmptyDataText="There are no data records to display.">
      <Columns>
       <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True"
        SortExpression="OrderID" />
       <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
       <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
       <asp:BoundField DataField="Freight" HeaderText="Freight" SortExpression="Freight" />
       <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" />
       <asp:BoundField DataField="Freight &amp; Subtotal" HeaderText="Freight &amp; Subtotal"
        ReadOnly="True" SortExpression="Freight &amp; Subtotal" />
      </Columns>
     </asp:GridView>
     <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\Northwind.mdb"
      DeleteCommand="DELETE FROM `Orders` WHERE `OrderID` = ?" InsertCommand="INSERT INTO `Orders` (`OrderID`, `CustomerID`, `EmployeeID`, `OrderDate`, `RequiredDate`, `ShippedDate`, `ShipVia`, `Freight`, `ShipName`, `ShipAddress`, `ShipCity`, `ShipRegion`, `ShipPostalCode`, `ShipCountry`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
      SelectCommand="SELECT Orders.OrderID, Orders.CustomerID, Orders.OrderDate, Orders.Freight, [Order Subtotals].Subtotal, Orders.Freight + [Order Subtotals].Subtotal AS [Freight &amp; Subtotal] FROM (Orders INNER JOIN [Order Subtotals] ON Orders.OrderID = [Order Subtotals].OrderID) WHERE (Orders.CustomerID = ?)"
      UpdateCommand="UPDATE `Orders` SET `CustomerID` = ?, `EmployeeID` = ?, `OrderDate` = ?, `RequiredDate` = ?, `ShippedDate` = ?, `ShipVia` = ?, `Freight` = ?, `ShipName` = ?, `ShipAddress` = ?, `ShipCity` = ?, `ShipRegion` = ?, `ShipPostalCode` = ?, `ShipCountry` = ? WHERE `OrderID` = ?">
      <DeleteParameters>
       <asp:Parameter Name="original_OrderID" Type="Int32" />
      </DeleteParameters>
      <UpdateParameters>
       <asp:Parameter Name="CustomerID" Type="String" />
       <asp:Parameter Name="EmployeeID" Type="Int32" />
       <asp:Parameter Name="OrderDate" Type="DateTime" />
       <asp:Parameter Name="RequiredDate" Type="DateTime" />
       <asp:Parameter Name="ShippedDate" Type="DateTime" />
       <asp:Parameter Name="ShipVia" Type="Int32" />
       <asp:Parameter Name="Freight" Type="Decimal" />
       <asp:Parameter Name="ShipName" Type="String" />
       <asp:Parameter Name="ShipAddress" Type="String" />
       <asp:Parameter Name="ShipCity" Type="String" />
       <asp:Parameter Name="ShipRegion" Type="String" />
       <asp:Parameter Name="ShipPostalCode" Type="String" />
       <asp:Parameter Name="ShipCountry" Type="String" />
       <asp:Parameter Name="original_OrderID" Type="Int32" />
      </UpdateParameters>
      <SelectParameters>
       <asp:ControlParameter ControlID="TextBox1" DefaultValue="ALFKI" Name="?" PropertyName="Text" />
      </SelectParameters>
      <InsertParameters>
       <asp:Parameter Name="OrderID" Type="Int32" />
       <asp:Parameter Name="CustomerID" Type="String" />
       <asp:Parameter Name="EmployeeID" Type="Int32" />
       <asp:Parameter Name="OrderDate" Type="DateTime" />
       <asp:Parameter Name="RequiredDate" Type="DateTime" />
       <asp:Parameter Name="ShippedDate" Type="DateTime" />
       <asp:Parameter Name="ShipVia" Type="Int32" />
       <asp:Parameter Name="Freight" Type="Decimal" />
       <asp:Parameter Name="ShipName" Type="String" />
       <asp:Parameter Name="ShipAddress" Type="String" />
       <asp:Parameter Name="ShipCity" Type="String" />
       <asp:Parameter Name="ShipRegion" Type="String" />
       <asp:Parameter Name="ShipPostalCode" Type="String" />
       <asp:Parameter Name="ShipCountry" Type="String" />
      </InsertParameters>
     </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
