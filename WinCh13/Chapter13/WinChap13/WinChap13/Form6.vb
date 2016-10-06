Public Class Form6

Private Sub TitlesBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
Me.Validate()
Me.TitlesBindingSource.EndEdit()
Me.TitlesTableAdapter.Update(Me.PubsDataSet.titles)

End Sub

Private Sub Form6_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
'TODO: This line of code loads data into the 'PubsDataSet.titles' table. You can move, or remove it, as needed.
Me.TitlesTableAdapter.Fill(Me.PubsDataSet.titles)

End Sub
End Class