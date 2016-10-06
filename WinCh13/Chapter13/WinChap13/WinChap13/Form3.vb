Public Class Form3

Private Sub ProductCategoryBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ProductCategoryBindingNavigatorSaveItem.Click
Me.Validate()
Me.ProductCategoryBindingSource.EndEdit()
Me.ProductCategoryTableAdapter.Update(Me.CatSubCatAdventureWorks_DataDataSet.ProductCategory)

End Sub

Private Sub Form3_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
'TODO: This line of code loads data into the 'CatSubCatAdventureWorks_DataDataSet.ProductCategory' table. You can move, or remove it, as needed.
Me.ProductCategoryTableAdapter.Fill(Me.CatSubCatAdventureWorks_DataDataSet.ProductCategory)

End Sub
End Class