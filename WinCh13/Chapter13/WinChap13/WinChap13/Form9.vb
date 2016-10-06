Public Class Form9

Private Sub Form9_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
'TODO: This line of code loads data into the 'CatSubCatAdventureWorks_DataDataSet.ProductSubcategory' table. You can move, or remove it, as needed.
Me.ProductSubcategoryTableAdapter.Fill(Me.CatSubCatAdventureWorks_DataDataSet.ProductSubcategory)
'TODO: This line of code loads data into the 'CatSubCatAdventureWorks_DataDataSet.ProductCategory' table. You can move, or remove it, as needed.
Me.ProductCategoryTableAdapter.Fill(Me.CatSubCatAdventureWorks_DataDataSet.ProductCategory)

  UpdateListBox2()

  Me.Label1.Text = "Pick a category"
  Me.Label2.Text = "To show its products"
  Me.Button1.Text = "Show all products"
  Me.Button1.Width = Me.ListBox2.Width
  Me.Button1.Left = Me.ListBox2.Left
  Me.Button1.BackColor = Color.Transparent

End Sub

Sub UpdateListBox2()

  Me.ProductSubcategoryTableAdapter.FillByCatID1( _
   Me.CatSubCatAdventureWorks_DataDataSet.ProductSubcategory, _
   CInt(Me.ListBox1.SelectedValue))

  'Shows System.Convert.ToInt32 syntax to replace CInt syntax
  'Me.ProductSubcategoryTableAdapter.FillByCatID1( _
  'Me.CatSubCatAdventureWorks_DataDataSet.ProductSubcategory, 
  'System.Convert.ToInt32(Me.ListBox1.SelectedValue))
End Sub

Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
    Me.ProductSubcategoryTableAdapter.Fill( _
   Me.CatSubCatAdventureWorks_DataDataSet.ProductSubcategory)
End Sub

Private Sub ListBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged
  UpdateListBox2()
End Sub
End Class