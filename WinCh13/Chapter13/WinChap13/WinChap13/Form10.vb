Public Class Form10
Dim bolClosed, bolShown As Boolean

 Private Sub Form9_FormClosed(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
  bolClosed = True
 End Sub
 Private Sub Form10_Shown(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Shown
  bolShown = True
 End Sub
Private Sub Form10_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
'TODO: This line of code loads data into the 'PubsDataSet.vTitleSales' table. You can move, or remove it, as needed.
Me.VTitleSalesTableAdapter.Fill(Me.PubsDataSet.vTitleSales)

  RunStoredProc()

  Me.FillToolStrip.Visible = False
  Dim intLBDisp As Integer = (Me.ListBox1.Left + Me.ListBox1.Width)
  Me.TitleTextBox.Width += intLBDisp - _
   (Me.TitleTextBox.Left + Me.TitleTextBox.Width)
  Me.TitleSalesTextBox.Width += intLBDisp - _
  (Me.TitleSalesTextBox.Left + Me.TitleSalesTextBox.Width)

End Sub

'Private Sub FillToolStripButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FillToolStripButton.Click
'Try
'    Me.SalesForATitleIDTableAdapter.Fill(Me.PubsDataSet.SalesForATitleID, TitleidToolStripTextBox.Text)
'Catch ex As System.Exception
'    System.Windows.Forms.MessageBox.Show(ex.Message)
'End Try

'End Sub

 Private Sub ListBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged

  Try
   RunStoredProc()
  Catch ex As Exception
   If bolShown = True And bolClosed = False Then
    MessageBox.Show(ex.ToString)
   End If
  End Try

 End Sub

 Sub RunStoredProc()
  Me.SalesForATitleIDTableAdapter.Fill( _
   Me.PubsDataSet.SalesForATitleID, _
   Me.ListBox1.SelectedValue.ToString)
 End Sub

End Class
