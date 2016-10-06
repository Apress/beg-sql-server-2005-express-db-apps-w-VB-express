Public Class Form8

Private Sub ProductSubcategoryBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ProductSubcategoryBindingNavigatorSaveItem.Click
Me.Validate()
Me.ProductSubcategoryBindingSource.EndEdit()
Me.ProductSubcategoryTableAdapter.Update(Me.CatSubCatAdventureWorks_DataDataSet.ProductSubcategory)

End Sub

Private Sub Form8_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
'TODO: This line of code loads data into the 'CatSubCatAdventureWorks_DataDataSet.ProductSubcategory' table. You can move, or remove it, as needed.
Me.ProductSubcategoryTableAdapter.Fill(Me.CatSubCatAdventureWorks_DataDataSet.ProductSubcategory)

  Me.ProductSubcategoryDataGridView. _
   Columns("ProductSubcategoryID").MinimumWidth = 115
End Sub

Private Sub FillByCatID1ToolStripButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FillByCatID1ToolStripButton.Click
Try
    Me.ProductSubcategoryTableAdapter.FillByCatID1(Me.CatSubCatAdventureWorks_DataDataSet.ProductSubcategory, CType(CatIDToolStripTextBox.Text, Integer))
Catch ex As System.Exception
    System.Windows.Forms.MessageBox.Show(ex.Message)
End Try

End Sub
End Class