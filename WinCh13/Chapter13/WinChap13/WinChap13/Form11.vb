Public Class Form11

Private Sub CustomersBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CustomersBindingNavigatorSaveItem.Click
Me.Validate()
Me.CustomersBindingSource.EndEdit()
Me.CustomersTableAdapter.Update(Me.NorthwindDataSet.Customers)

End Sub

Private Sub Form11_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
'TODO: This line of code loads data into the 'NorthwindDataSet.Customers' table. You can move, or remove it, as needed.
Me.CustomersTableAdapter.Fill(Me.NorthwindDataSet.Customers)

  Me.CustomersBindingNavigator.Visible = False
  Me.Button1.Text = "Update"
  Me.Button2.Text = "Refresh"
'  Me.CustomersDataGridView.Columns("CustomerID").Width = 65
  Me.CustomersDataGridView.Columns(0).Width = 65
End Sub

 Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
  Try
   Me.CustomersTableAdapter.Update(Me.NorthwindDataSet.Customers)
  Catch ex As System.Data.DBConcurrencyException
   Me.CustomersTableAdapter.Fill(Me.NorthwindDataSet.Customers)
   MessageBox.Show("Please enter your changes again and click Update.")
  End Try
 End Sub

 Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
  Me.CustomersTableAdapter.Fill(Me.NorthwindDataSet.Customers)
 End Sub

End Class