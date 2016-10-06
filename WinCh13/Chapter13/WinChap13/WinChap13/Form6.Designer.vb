<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form6
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
Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form6))
Me.PubsDataSet = New WinChap13.pubsDataSet
Me.TitlesBindingSource = New System.Windows.Forms.BindingSource(Me.components)
Me.TitlesTableAdapter = New WinChap13.pubsDataSetTableAdapters.titlesTableAdapter
Me.TitlesBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton
Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton
Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator
Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox
Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel
Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator
Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton
Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton
Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator
Me.TitlesDataGridView = New System.Windows.Forms.DataGridView
Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn10 = New System.Windows.Forms.DataGridViewTextBoxColumn
CType(Me.PubsDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
CType(Me.TitlesBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
CType(Me.TitlesBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
Me.TitlesBindingNavigator.SuspendLayout()
CType(Me.TitlesDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
Me.SuspendLayout()
'
'PubsDataSet
'
Me.PubsDataSet.DataSetName = "pubsDataSet"
Me.PubsDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
'
'TitlesBindingSource
'
Me.TitlesBindingSource.DataMember = "titles"
Me.TitlesBindingSource.DataSource = Me.PubsDataSet
'
'TitlesTableAdapter
'
Me.TitlesTableAdapter.ClearBeforeFill = True
'
'TitlesBindingNavigator
'
Me.TitlesBindingNavigator.AddNewItem = Nothing
Me.TitlesBindingNavigator.BindingSource = Me.TitlesBindingSource
Me.TitlesBindingNavigator.CountItem = Me.BindingNavigatorCountItem
Me.TitlesBindingNavigator.DeleteItem = Nothing
Me.TitlesBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2})
Me.TitlesBindingNavigator.Location = New System.Drawing.Point(0, 0)
Me.TitlesBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
Me.TitlesBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
Me.TitlesBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
Me.TitlesBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
Me.TitlesBindingNavigator.Name = "TitlesBindingNavigator"
Me.TitlesBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
Me.TitlesBindingNavigator.Size = New System.Drawing.Size(370, 25)
Me.TitlesBindingNavigator.TabIndex = 0
Me.TitlesBindingNavigator.Text = "BindingNavigator1"
'
'BindingNavigatorMoveFirstItem
'
Me.BindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.BindingNavigatorMoveFirstItem.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem.Image"), System.Drawing.Image)
Me.BindingNavigatorMoveFirstItem.Name = "BindingNavigatorMoveFirstItem"
Me.BindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
Me.BindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(23, 22)
Me.BindingNavigatorMoveFirstItem.Text = "Move first"
'
'BindingNavigatorMovePreviousItem
'
Me.BindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.BindingNavigatorMovePreviousItem.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem.Image"), System.Drawing.Image)
Me.BindingNavigatorMovePreviousItem.Name = "BindingNavigatorMovePreviousItem"
Me.BindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
Me.BindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(23, 22)
Me.BindingNavigatorMovePreviousItem.Text = "Move previous"
'
'BindingNavigatorSeparator
'
Me.BindingNavigatorSeparator.Name = "BindingNavigatorSeparator"
Me.BindingNavigatorSeparator.Size = New System.Drawing.Size(6, 25)
'
'BindingNavigatorPositionItem
'
Me.BindingNavigatorPositionItem.AccessibleName = "Position"
Me.BindingNavigatorPositionItem.AutoSize = False
Me.BindingNavigatorPositionItem.Name = "BindingNavigatorPositionItem"
Me.BindingNavigatorPositionItem.Size = New System.Drawing.Size(50, 21)
Me.BindingNavigatorPositionItem.Text = "0"
Me.BindingNavigatorPositionItem.ToolTipText = "Current position"
'
'BindingNavigatorCountItem
'
Me.BindingNavigatorCountItem.Name = "BindingNavigatorCountItem"
Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(36, 22)
Me.BindingNavigatorCountItem.Text = "of {0}"
Me.BindingNavigatorCountItem.ToolTipText = "Total number of items"
'
'BindingNavigatorSeparator1
'
Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator"
Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 25)
'
'BindingNavigatorMoveNextItem
'
Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 22)
Me.BindingNavigatorMoveNextItem.Text = "Move next"
'
'BindingNavigatorMoveLastItem
'
Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 22)
Me.BindingNavigatorMoveLastItem.Text = "Move last"
'
'BindingNavigatorSeparator2
'
Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator"
Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 25)
'
'TitlesDataGridView
'
Me.TitlesDataGridView.AllowUserToAddRows = False
Me.TitlesDataGridView.AllowUserToDeleteRows = False
Me.TitlesDataGridView.AutoGenerateColumns = False
Me.TitlesDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn10})
Me.TitlesDataGridView.DataSource = Me.TitlesBindingSource
Me.TitlesDataGridView.Location = New System.Drawing.Point(39, 74)
Me.TitlesDataGridView.Name = "TitlesDataGridView"
Me.TitlesDataGridView.ReadOnly = True
Me.TitlesDataGridView.Size = New System.Drawing.Size(300, 220)
Me.TitlesDataGridView.TabIndex = 1
'
'DataGridViewTextBoxColumn1
'
Me.DataGridViewTextBoxColumn1.DataPropertyName = "title_id"
Me.DataGridViewTextBoxColumn1.HeaderText = "title_id"
Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
Me.DataGridViewTextBoxColumn1.ReadOnly = True
'
'DataGridViewTextBoxColumn2
'
Me.DataGridViewTextBoxColumn2.DataPropertyName = "title"
Me.DataGridViewTextBoxColumn2.HeaderText = "title"
Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
Me.DataGridViewTextBoxColumn2.ReadOnly = True
'
'DataGridViewTextBoxColumn3
'
Me.DataGridViewTextBoxColumn3.DataPropertyName = "type"
Me.DataGridViewTextBoxColumn3.HeaderText = "type"
Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
Me.DataGridViewTextBoxColumn3.ReadOnly = True
'
'DataGridViewTextBoxColumn10
'
Me.DataGridViewTextBoxColumn10.DataPropertyName = "pubdate"
Me.DataGridViewTextBoxColumn10.HeaderText = "pubdate"
Me.DataGridViewTextBoxColumn10.Name = "DataGridViewTextBoxColumn10"
Me.DataGridViewTextBoxColumn10.ReadOnly = True
'
'Form6
'
Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
Me.ClientSize = New System.Drawing.Size(370, 306)
Me.Controls.Add(Me.TitlesDataGridView)
Me.Controls.Add(Me.TitlesBindingNavigator)
Me.Name = "Form6"
Me.Text = "Form6"
CType(Me.PubsDataSet, System.ComponentModel.ISupportInitialize).EndInit()
CType(Me.TitlesBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
CType(Me.TitlesBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
Me.TitlesBindingNavigator.ResumeLayout(False)
Me.TitlesBindingNavigator.PerformLayout()
CType(Me.TitlesDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
Me.ResumeLayout(False)
Me.PerformLayout()

End Sub
    Friend WithEvents PubsDataSet As WinChap13.pubsDataSet
    Friend WithEvents TitlesBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents TitlesTableAdapter As WinChap13.pubsDataSetTableAdapters.titlesTableAdapter
    Friend WithEvents TitlesBindingNavigator As System.Windows.Forms.BindingNavigator
    Friend WithEvents BindingNavigatorCountItem As System.Windows.Forms.ToolStripLabel
    Friend WithEvents BindingNavigatorMoveFirstItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents TitlesDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn10 As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
