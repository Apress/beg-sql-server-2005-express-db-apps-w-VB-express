<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form8
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
Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form8))
Me.ProductSubcategoryBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
Me.ProductSubcategoryBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton
Me.ProductSubcategoryDataGridView = New System.Windows.Forms.DataGridView
Me.FillByCatID1ToolStrip = New System.Windows.Forms.ToolStrip
Me.CatIDToolStripLabel = New System.Windows.Forms.ToolStripLabel
Me.CatIDToolStripTextBox = New System.Windows.Forms.ToolStripTextBox
Me.FillByCatID1ToolStripButton = New System.Windows.Forms.ToolStripButton
Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.ProductSubcategoryBindingSource = New System.Windows.Forms.BindingSource(Me.components)
Me.CatSubCatAdventureWorks_DataDataSet = New WinChap13.CatSubCatAdventureWorks_DataDataSet
Me.ProductSubcategoryTableAdapter = New WinChap13.CatSubCatAdventureWorks_DataDataSetTableAdapters.ProductSubcategoryTableAdapter
CType(Me.ProductSubcategoryBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
Me.ProductSubcategoryBindingNavigator.SuspendLayout()
CType(Me.ProductSubcategoryDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
Me.FillByCatID1ToolStrip.SuspendLayout()
CType(Me.ProductSubcategoryBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
CType(Me.CatSubCatAdventureWorks_DataDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
Me.SuspendLayout()
'
'ProductSubcategoryBindingNavigator
'
Me.ProductSubcategoryBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
Me.ProductSubcategoryBindingNavigator.BindingSource = Me.ProductSubcategoryBindingSource
Me.ProductSubcategoryBindingNavigator.CountItem = Me.BindingNavigatorCountItem
Me.ProductSubcategoryBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
Me.ProductSubcategoryBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.ProductSubcategoryBindingNavigatorSaveItem})
Me.ProductSubcategoryBindingNavigator.Location = New System.Drawing.Point(0, 0)
Me.ProductSubcategoryBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
Me.ProductSubcategoryBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
Me.ProductSubcategoryBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
Me.ProductSubcategoryBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
Me.ProductSubcategoryBindingNavigator.Name = "ProductSubcategoryBindingNavigator"
Me.ProductSubcategoryBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
Me.ProductSubcategoryBindingNavigator.Size = New System.Drawing.Size(367, 25)
Me.ProductSubcategoryBindingNavigator.TabIndex = 0
Me.ProductSubcategoryBindingNavigator.Text = "BindingNavigator1"
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
Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 22)
Me.BindingNavigatorDeleteItem.Text = "Delete"
'
'ProductSubcategoryBindingNavigatorSaveItem
'
Me.ProductSubcategoryBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
Me.ProductSubcategoryBindingNavigatorSaveItem.Image = CType(resources.GetObject("ProductSubcategoryBindingNavigatorSaveItem.Image"), System.Drawing.Image)
Me.ProductSubcategoryBindingNavigatorSaveItem.Name = "ProductSubcategoryBindingNavigatorSaveItem"
Me.ProductSubcategoryBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
Me.ProductSubcategoryBindingNavigatorSaveItem.Text = "Save Data"
'
'ProductSubcategoryDataGridView
'
Me.ProductSubcategoryDataGridView.AutoGenerateColumns = False
Me.ProductSubcategoryDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5})
Me.ProductSubcategoryDataGridView.DataSource = Me.ProductSubcategoryBindingSource
Me.ProductSubcategoryDataGridView.Location = New System.Drawing.Point(12, 79)
Me.ProductSubcategoryDataGridView.Name = "ProductSubcategoryDataGridView"
Me.ProductSubcategoryDataGridView.Size = New System.Drawing.Size(300, 220)
Me.ProductSubcategoryDataGridView.TabIndex = 1
'
'FillByCatID1ToolStrip
'
Me.FillByCatID1ToolStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.CatIDToolStripLabel, Me.CatIDToolStripTextBox, Me.FillByCatID1ToolStripButton})
Me.FillByCatID1ToolStrip.Location = New System.Drawing.Point(0, 25)
Me.FillByCatID1ToolStrip.Name = "FillByCatID1ToolStrip"
Me.FillByCatID1ToolStrip.Size = New System.Drawing.Size(367, 25)
Me.FillByCatID1ToolStrip.TabIndex = 2
Me.FillByCatID1ToolStrip.Text = "FillByCatID1ToolStrip"
'
'CatIDToolStripLabel
'
Me.CatIDToolStripLabel.Name = "CatIDToolStripLabel"
Me.CatIDToolStripLabel.Size = New System.Drawing.Size(39, 22)
Me.CatIDToolStripLabel.Text = "CatID:"
'
'CatIDToolStripTextBox
'
Me.CatIDToolStripTextBox.Name = "CatIDToolStripTextBox"
Me.CatIDToolStripTextBox.Size = New System.Drawing.Size(100, 25)
'
'FillByCatID1ToolStripButton
'
Me.FillByCatID1ToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text
Me.FillByCatID1ToolStripButton.Name = "FillByCatID1ToolStripButton"
Me.FillByCatID1ToolStripButton.Size = New System.Drawing.Size(69, 22)
Me.FillByCatID1ToolStripButton.Text = "FillByCatID1"
'
'DataGridViewTextBoxColumn1
'
Me.DataGridViewTextBoxColumn1.DataPropertyName = "ProductSubcategoryID"
Me.DataGridViewTextBoxColumn1.HeaderText = "ProductSubcategoryID"
Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
Me.DataGridViewTextBoxColumn1.ReadOnly = True
'
'DataGridViewTextBoxColumn2
'
Me.DataGridViewTextBoxColumn2.DataPropertyName = "ProductCategoryID"
Me.DataGridViewTextBoxColumn2.HeaderText = "ProductCategoryID"
Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
'
'DataGridViewTextBoxColumn3
'
Me.DataGridViewTextBoxColumn3.DataPropertyName = "Name"
Me.DataGridViewTextBoxColumn3.HeaderText = "Name"
Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
'
'DataGridViewTextBoxColumn4
'
Me.DataGridViewTextBoxColumn4.DataPropertyName = "rowguid"
Me.DataGridViewTextBoxColumn4.HeaderText = "rowguid"
Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
'
'DataGridViewTextBoxColumn5
'
Me.DataGridViewTextBoxColumn5.DataPropertyName = "ModifiedDate"
Me.DataGridViewTextBoxColumn5.HeaderText = "ModifiedDate"
Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
'
'ProductSubcategoryBindingSource
'
Me.ProductSubcategoryBindingSource.DataMember = "ProductSubcategory"
Me.ProductSubcategoryBindingSource.DataSource = Me.CatSubCatAdventureWorks_DataDataSet
'
'CatSubCatAdventureWorks_DataDataSet
'
Me.CatSubCatAdventureWorks_DataDataSet.DataSetName = "CatSubCatAdventureWorks_DataDataSet"
Me.CatSubCatAdventureWorks_DataDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
'
'ProductSubcategoryTableAdapter
'
Me.ProductSubcategoryTableAdapter.ClearBeforeFill = True
'
'Form8
'
Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
Me.ClientSize = New System.Drawing.Size(367, 320)
Me.Controls.Add(Me.FillByCatID1ToolStrip)
Me.Controls.Add(Me.ProductSubcategoryDataGridView)
Me.Controls.Add(Me.ProductSubcategoryBindingNavigator)
Me.Name = "Form8"
Me.Text = "Form8"
CType(Me.ProductSubcategoryBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
Me.ProductSubcategoryBindingNavigator.ResumeLayout(False)
Me.ProductSubcategoryBindingNavigator.PerformLayout()
CType(Me.ProductSubcategoryDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
Me.FillByCatID1ToolStrip.ResumeLayout(False)
Me.FillByCatID1ToolStrip.PerformLayout()
CType(Me.ProductSubcategoryBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
CType(Me.CatSubCatAdventureWorks_DataDataSet, System.ComponentModel.ISupportInitialize).EndInit()
Me.ResumeLayout(False)
Me.PerformLayout()

End Sub
    Friend WithEvents CatSubCatAdventureWorks_DataDataSet As WinChap13.CatSubCatAdventureWorks_DataDataSet
    Friend WithEvents ProductSubcategoryBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents ProductSubcategoryTableAdapter As WinChap13.CatSubCatAdventureWorks_DataDataSetTableAdapters.ProductSubcategoryTableAdapter
    Friend WithEvents ProductSubcategoryBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents ProductSubcategoryBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents ProductSubcategoryDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents FillByCatID1ToolStrip As System.Windows.Forms.ToolStrip
    Friend WithEvents CatIDToolStripLabel As System.Windows.Forms.ToolStripLabel
    Friend WithEvents CatIDToolStripTextBox As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents FillByCatID1ToolStripButton As System.Windows.Forms.ToolStripButton
End Class
