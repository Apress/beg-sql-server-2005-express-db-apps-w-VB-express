Public Class Form7
 Dim bolClosed As Boolean

 Private Sub Form7_FormClosed(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
  bolClosed = True
 End Sub

Private Sub ProductCategoryBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ProductCategoryBindingNavigatorSaveItem.Click
Me.Validate()
Me.ProductCategoryBindingSource.EndEdit()
Me.ProductCategoryTableAdapter.Update(Me.CatSubCatAdventureWorks_DataDataSet.ProductCategory)

End Sub

Private Sub Form7_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
'TODO: This line of code loads data into the 'CatSubCatAdventureWorks_DataDataSet.ProductCategory' table. You can move, or remove it, as needed.
Me.ProductCategoryTableAdapter.Fill(Me.CatSubCatAdventureWorks_DataDataSet.ProductCategory)


  UpdateTextBoxes()

  Me.Label1.Text = "SelectedValue:"
  Me.Label2.Text = "SelectedIndex:"
  Me.ProductCategoryBindingNavigator.Visible = False

End Sub

 Sub UpdateTextBoxes()
  Try
   Me.TextBox1.Text = Me.NameListBox.SelectedValue.ToString
   Me.TextBox2.Text = Me.NameListBox.SelectedIndex.ToString
  Catch ex As Exception
   If bolClosed = False Then
    MessageBox.Show(ex.Message)
   Else
    'Test diagnostic output; do not run normally
    'MessageBox.Show(ex.Message)
   End If
  End Try
 End Sub

 Private Sub NameListBox_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NameListBox.SelectedIndexChanged
  UpdateTextBoxes()
 End Sub
End Class