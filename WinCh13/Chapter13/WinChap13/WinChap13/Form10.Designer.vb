<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form10
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
Me.components = New System.ComponentModel.Container
Dim TitleLabel As System.Windows.Forms.Label
Dim TitleSalesLabel As System.Windows.Forms.Label
Me.ListBox1 = New System.Windows.Forms.ListBox
Me.PubsDataSet = New WinChap13.pubsDataSet
Me.VTitleSalesBindingSource = New System.Windows.Forms.BindingSource(Me.components)
Me.VTitleSalesTableAdapter = New WinChap13.pubsDataSetTableAdapters.vTitleSalesTableAdapter
Me.SalesForATitleIDBindingSource = New System.Windows.Forms.BindingSource(Me.components)
Me.SalesForATitleIDTableAdapter = New WinChap13.pubsDataSetTableAdapters.SalesForATitleIDTableAdapter
Me.FillToolStrip = New System.Windows.Forms.ToolStrip
Me.TitleidToolStripLabel = New System.Windows.Forms.ToolStripLabel
Me.TitleidToolStripTextBox = New System.Windows.Forms.ToolStripTextBox
Me.FillToolStripButton = New System.Windows.Forms.ToolStripButton
Me.TitleTextBox = New System.Windows.Forms.TextBox
Me.TitleSalesTextBox = New System.Windows.Forms.TextBox
TitleLabel = New System.Windows.Forms.Label
TitleSalesLabel = New System.Windows.Forms.Label
CType(Me.PubsDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
CType(Me.VTitleSalesBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
CType(Me.SalesForATitleIDBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
Me.FillToolStrip.SuspendLayout()
Me.SuspendLayout()
'
'ListBox1
'
Me.ListBox1.DataSource = Me.VTitleSalesBindingSource
Me.ListBox1.DisplayMember = "title"
Me.ListBox1.FormattingEnabled = True
Me.ListBox1.Location = New System.Drawing.Point(12, 39)
Me.ListBox1.Name = "ListBox1"
Me.ListBox1.Size = New System.Drawing.Size(267, 121)
Me.ListBox1.TabIndex = 0
Me.ListBox1.ValueMember = "title_id"
'
'PubsDataSet
'
Me.PubsDataSet.DataSetName = "pubsDataSet"
Me.PubsDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
'
'VTitleSalesBindingSource
'
Me.VTitleSalesBindingSource.DataMember = "vTitleSales"
Me.VTitleSalesBindingSource.DataSource = Me.PubsDataSet
'
'VTitleSalesTableAdapter
'
Me.VTitleSalesTableAdapter.ClearBeforeFill = True
'
'SalesForATitleIDBindingSource
'
Me.SalesForATitleIDBindingSource.DataMember = "SalesForATitleID"
Me.SalesForATitleIDBindingSource.DataSource = Me.PubsDataSet
'
'SalesForATitleIDTableAdapter
'
Me.SalesForATitleIDTableAdapter.ClearBeforeFill = True
'
'FillToolStrip
'
Me.FillToolStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.TitleidToolStripLabel, Me.TitleidToolStripTextBox, Me.FillToolStripButton})
Me.FillToolStrip.Location = New System.Drawing.Point(0, 0)
Me.FillToolStrip.Name = "FillToolStrip"
Me.FillToolStrip.Size = New System.Drawing.Size(299, 25)
Me.FillToolStrip.TabIndex = 1
Me.FillToolStrip.Text = "FillToolStrip"
'
'TitleidToolStripLabel
'
Me.TitleidToolStripLabel.Name = "TitleidToolStripLabel"
Me.TitleidToolStripLabel.Size = New System.Drawing.Size(37, 22)
Me.TitleidToolStripLabel.Text = "titleid:"
'
'TitleidToolStripTextBox
'
Me.TitleidToolStripTextBox.Name = "TitleidToolStripTextBox"
Me.TitleidToolStripTextBox.Size = New System.Drawing.Size(100, 21)
'
'FillToolStripButton
'
Me.FillToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text
Me.FillToolStripButton.Name = "FillToolStripButton"
Me.FillToolStripButton.Size = New System.Drawing.Size(23, 17)
Me.FillToolStripButton.Text = "Fill"
'
'TitleLabel
'
TitleLabel.AutoSize = True
TitleLabel.Location = New System.Drawing.Point(17, 182)
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = New System.Drawing.Size(26, 13)
TitleLabel.TabIndex = 2
TitleLabel.Text = "title:"
'
'TitleTextBox
'
Me.TitleTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.SalesForATitleIDBindingSource, "title", True))
Me.TitleTextBox.Location = New System.Drawing.Point(82, 179)
Me.TitleTextBox.Name = "TitleTextBox"
Me.TitleTextBox.Size = New System.Drawing.Size(100, 20)
Me.TitleTextBox.TabIndex = 3
'
'TitleSalesLabel
'
TitleSalesLabel.AutoSize = True
TitleSalesLabel.Location = New System.Drawing.Point(17, 208)
TitleSalesLabel.Name = "TitleSalesLabel"
TitleSalesLabel.Size = New System.Drawing.Size(59, 13)
TitleSalesLabel.TabIndex = 4
TitleSalesLabel.Text = "Title Sales:"
'
'TitleSalesTextBox
'
Me.TitleSalesTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.SalesForATitleIDBindingSource, "TitleSales", True))
Me.TitleSalesTextBox.Location = New System.Drawing.Point(82, 205)
Me.TitleSalesTextBox.Name = "TitleSalesTextBox"
Me.TitleSalesTextBox.Size = New System.Drawing.Size(100, 20)
Me.TitleSalesTextBox.TabIndex = 5
'
'Form10
'
Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
Me.ClientSize = New System.Drawing.Size(299, 266)
Me.Controls.Add(TitleLabel)
Me.Controls.Add(Me.TitleTextBox)
Me.Controls.Add(TitleSalesLabel)
Me.Controls.Add(Me.TitleSalesTextBox)
Me.Controls.Add(Me.FillToolStrip)
Me.Controls.Add(Me.ListBox1)
Me.Name = "Form10"
Me.Text = "Form10"
CType(Me.PubsDataSet, System.ComponentModel.ISupportInitialize).EndInit()
CType(Me.VTitleSalesBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
CType(Me.SalesForATitleIDBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
Me.FillToolStrip.ResumeLayout(False)
Me.FillToolStrip.PerformLayout()
Me.ResumeLayout(False)
Me.PerformLayout()

End Sub
    Friend WithEvents ListBox1 As System.Windows.Forms.ListBox
    Friend WithEvents PubsDataSet As WinChap13.pubsDataSet
    Friend WithEvents VTitleSalesBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents VTitleSalesTableAdapter As WinChap13.pubsDataSetTableAdapters.vTitleSalesTableAdapter
    Friend WithEvents SalesForATitleIDBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents SalesForATitleIDTableAdapter As WinChap13.pubsDataSetTableAdapters.SalesForATitleIDTableAdapter
    Friend WithEvents FillToolStrip As System.Windows.Forms.ToolStrip
    Friend WithEvents TitleidToolStripLabel As System.Windows.Forms.ToolStripLabel
    Friend WithEvents TitleidToolStripTextBox As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents FillToolStripButton As System.Windows.Forms.ToolStripButton
    Friend WithEvents TitleTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TitleSalesTextBox As System.Windows.Forms.TextBox
End Class
