<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
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
Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
Me.CatSubCatAdventureWorks_DataDataSet = New WinChap13.CatSubCatAdventureWorks_DataDataSet
Me.ProductCategoryBindingSource = New System.Windows.Forms.BindingSource(Me.components)
Me.ProductCategoryTableAdapter = New WinChap13.CatSubCatAdventureWorks_DataDataSetTableAdapters.ProductCategoryTableAdapter
Me.ProductCategoryBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton
Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton
Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator
Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox
Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel
Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator
Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton
Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton
Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator
Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton
Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton
Me.ProductCategoryBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton
Me.ProductCategoryDataGridView = New System.Windows.Forms.DataGridView
Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn
CType(Me.CatSubCatAdventureWorks_DataDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
CType(Me.ProductCategoryBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
CType(Me.ProductCategoryBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
Me.ProductCategoryBindingNavigator.SuspendLayout()
CType(Me.ProductCategoryDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
Me.SuspendLayout()
'
'CatSubCatAdventureWorks_DataDataSet
'
Me.CatSubCatAdventureWorks_DataDataSet.DataSetName = "CatSubCatAdventureWorks_DataDataSet"
Me.CatSubCatAdventureWorks_DataDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
'
'ProductCategoryBindingSource
'
Me.ProductCategoryBindingSource.DataMember = "ProductCategory"
Me.ProductCategoryBindingSource.DataSource = Me.CatSubCatAdventureWorks_DataDataSet
'
'ProductCategoryTableAdapter
'
Me.ProductCategoryTableAdapter.ClearBeforeFill = True
'
'ProductCategoryBindingNavigator
'
Me.ProductCategoryBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
Me.ProductCategoryBindingNavigator.BindingSource = Me.ProductCategoryBindingSource
Me.ProductCategoryBindingNavigator.CountItem = Me.BindingNavigatorCountItem
Me.ProductCategoryBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
Me.ProductCategoryBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.ProductCategoryBindingNavigatorSaveItem})
Me.ProductCategoryBindingNavigator.Location = New System.Drawing.Point(0, 0)
Me.ProductCategoryBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
Me.ProductCategoryBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
Me.ProductCategoryBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
Me.ProductCategoryBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
Me.ProductCategoryBindingNavigator.Name = "ProductCategoryBindingNavigator"
Me.ProductCategoryBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
Me.ProductCategoryBindingNavigator.Size = New System.Drawing.Size(360, 25)
Me.ProductCategoryBindingNavigator.TabIndex = 0
Me.ProductCategoryBindingNavigator.Text = "BindingNavigator1"
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
Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(36, 13)
Me.BindingNavigatorCountItem.Text = "of {0}"
Me.BindingNavigatorCountItem.ToolTipText = "Total number of items"
'
'BindingNavigatorSeparator1
'
Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator"
Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 6)
'
'BindingNavigatorMoveNextItem
'
Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 20)
Me.BindingNavigatorMoveNextItem.Text = "Move next"
'
'BindingNavigatorMoveLastItem
'
Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 20)
Me.BindingNavigatorMoveLastItem.Text = "Move last"
'
'BindingNavigatorSeparator2
'
Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator"
Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 6)
'
'BindingNavigatorAddNewItem
'
Me.BindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.BindingNavigatorAddNewItem.Image = CType(resources.GetObject("BindingNavigatorAddNewItem.Image"), System.Drawing.Image)
Me.BindingNavigatorAddNewItem.Name = "BindingNavigatorAddNewItem"
Me.BindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = True
Me.BindingNavigatorAddNewItem.Size = New System.Drawing.Size(23, 22)
Me.BindingNavigatorAddNewItem.Text = "Add new"
'
'BindingNavigatorDeleteItem
'
Me.BindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.BindingNavigatorDeleteItem.Image = CType(resources.GetObject("BindingNavigatorDeleteItem.Image"), System.Drawing.Image)
Me.BindingNavigatorDeleteItem.Name = "BindingNavigatorDeleteItem"
Me.BindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 20)
Me.BindingNavigatorDeleteItem.Text = "Delete"
'
'ProductCategoryBindingNavigatorSaveItem
'
Me.ProductCategoryBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.ProductCategoryBindingNavigatorSaveItem.Image = CType(resources.GetObject("ProductCategoryBindingNavigatorSaveItem.Image"), System.Drawing.Image)
Me.ProductCategoryBindingNavigatorSaveItem.Name = "ProductCategoryBindingNavigatorSaveItem"
Me.ProductCategoryBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 23)
Me.ProductCategoryBindingNavigatorSaveItem.Text = "Save Data"
'
'ProductCategoryDataGridView
'
Me.ProductCategoryDataGridView.AutoGenerateColumns = False
Me.ProductCategoryDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4})
Me.ProductCategoryDataGridView.DataSource = Me.ProductCategoryBindingSource
Me.ProductCategoryDataGridView.Location = New System.Drawing.Point(40, 77)
Me.ProductCategoryDataGridView.Name = "ProductCategoryDataGridView"
Me.ProductCategoryDataGridView.Size = New System.Drawing.Size(300, 220)
Me.ProductCategoryDataGridView.TabIndex = 1
'
'DataGridViewTextBoxColumn1
'
Me.DataGridViewTextBoxColumn1.DataPropertyName = "ProductCategoryID"
Me.DataGridViewTextBoxColumn1.HeaderText = "ProductCategoryID"
Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
Me.DataGridViewTextBoxColumn1.ReadOnly = True
'
'DataGridViewTextBoxColumn2
'
Me.DataGridViewTextBoxColumn2.DataPropertyName = "Name"
Me.DataGridViewTextBoxColumn2.HeaderText = "Name"
Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
'
'DataGridViewTextBoxColumn3
'
Me.DataGridViewTextBoxColumn3.DataPropertyName = "rowguid"
Me.DataGridViewTextBoxColumn3.HeaderText = "rowguid"
Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
'
'DataGridViewTextBoxColumn4
'
Me.DataGridViewTextBoxColumn4.DataPropertyName = "ModifiedDate"
Me.DataGridViewTextBoxColumn4.HeaderText = "ModifiedDate"
Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
'
'Form1
'
Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
Me.ClientSize = New System.Drawing.Size(360, 317)
Me.Controls.Add(Me.ProductCategoryDataGridView)
Me.Controls.Add(Me.ProductCategoryBindingNavigator)
Me.Name = "Form1"
Me.Text = "Form1"
CType(Me.CatSubCatAdventureWorks_DataDataSet, System.ComponentModel.ISupportInitialize).EndInit()
CType(Me.ProductCategoryBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
CType(Me.ProductCategoryBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
Me.ProductCategoryBindingNavigator.ResumeLayout(False)
Me.ProductCategoryBindingNavigator.PerformLayout()
CType(Me.ProductCategoryDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
Me.ResumeLayout(False)
Me.PerformLayout()

End Sub
    Friend WithEvents CatSubCatAdventureWorks_DataDataSet As WinChap13.CatSubCatAdventureWorks_DataDataSet
    Friend WithEvents ProductCategoryBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents ProductCategoryTableAdapter As WinChap13.CatSubCatAdventureWorks_DataDataSetTableAdapters.ProductCategoryTableAdapter
    Friend WithEvents ProductCategoryBindingNavigator As System.Windows.Forms.BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorCountItem As System.Windows.Forms.ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ProductCategoryBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents ProductCategoryDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn

End Class
