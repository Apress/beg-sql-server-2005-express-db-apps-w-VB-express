<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form9
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
Me.Label1 = New System.Windows.Forms.Label
Me.ListBox1 = New System.Windows.Forms.ListBox
Me.ListBox2 = New System.Windows.Forms.ListBox
Me.Label2 = New System.Windows.Forms.Label
Me.Button1 = New System.Windows.Forms.Button
Me.CatSubCatAdventureWorks_DataDataSet = New WinChap13.CatSubCatAdventureWorks_DataDataSet
Me.ProductCategoryBindingSource = New System.Windows.Forms.BindingSource(Me.components)
Me.ProductCategoryTableAdapter = New WinChap13.CatSubCatAdventureWorks_DataDataSetTableAdapters.ProductCategoryTableAdapter
Me.ProductSubcategoryBindingSource = New System.Windows.Forms.BindingSource(Me.components)
Me.ProductSubcategoryTableAdapter = New WinChap13.CatSubCatAdventureWorks_DataDataSetTableAdapters.ProductSubcategoryTableAdapter
CType(Me.CatSubCatAdventureWorks_DataDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
CType(Me.ProductCategoryBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
CType(Me.ProductSubcategoryBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
Me.SuspendLayout()
'
'Label1
'
Me.Label1.AutoSize = True
Me.Label1.Location = New System.Drawing.Point(13, 41)
Me.Label1.Name = "Label1"
Me.Label1.Size = New System.Drawing.Size(39, 13)
Me.Label1.TabIndex = 0
Me.Label1.Text = "Label1"
'
'ListBox1
'
Me.ListBox1.DataSource = Me.ProductCategoryBindingSource
Me.ListBox1.DisplayMember = "Name"
Me.ListBox1.FormattingEnabled = True
Me.ListBox1.Location = New System.Drawing.Point(13, 58)
Me.ListBox1.Name = "ListBox1"
Me.ListBox1.Size = New System.Drawing.Size(120, 95)
Me.ListBox1.TabIndex = 1
Me.ListBox1.ValueMember = "ProductCategoryID"
'
'ListBox2
'
Me.ListBox2.DataSource = Me.ProductSubcategoryBindingSource
Me.ListBox2.DisplayMember = "Name"
Me.ListBox2.FormattingEnabled = True
Me.ListBox2.Location = New System.Drawing.Point(160, 58)
Me.ListBox2.Name = "ListBox2"
Me.ListBox2.Size = New System.Drawing.Size(120, 199)
Me.ListBox2.TabIndex = 2
'
'Label2
'
Me.Label2.AutoSize = True
Me.Label2.Location = New System.Drawing.Point(160, 40)
Me.Label2.Name = "Label2"
Me.Label2.Size = New System.Drawing.Size(39, 13)
Me.Label2.TabIndex = 3
Me.Label2.Text = "Label2"
'
'Button1
'
Me.Button1.Location = New System.Drawing.Point(163, 12)
Me.Button1.Name = "Button1"
Me.Button1.Size = New System.Drawing.Size(75, 23)
Me.Button1.TabIndex = 4
Me.Button1.Text = "Button1"
Me.Button1.UseVisualStyleBackColor = True
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
'ProductSubcategoryBindingSource
'
Me.ProductSubcategoryBindingSource.DataMember = "ProductSubcategory"
Me.ProductSubcategoryBindingSource.DataSource = Me.CatSubCatAdventureWorks_DataDataSet
'
'ProductSubcategoryTableAdapter
'
Me.ProductSubcategoryTableAdapter.ClearBeforeFill = True
'
'Form9
'
Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
Me.ClientSize = New System.Drawing.Size(292, 266)
Me.Controls.Add(Me.Button1)
Me.Controls.Add(Me.Label2)
Me.Controls.Add(Me.ListBox2)
Me.Controls.Add(Me.ListBox1)
Me.Controls.Add(Me.Label1)
Me.Name = "Form9"
Me.Text = "Form9"
CType(Me.CatSubCatAdventureWorks_DataDataSet, System.ComponentModel.ISupportInitialize).EndInit()
CType(Me.ProductCategoryBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
CType(Me.ProductSubcategoryBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
Me.ResumeLayout(False)
Me.PerformLayout()

End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents ListBox1 As System.Windows.Forms.ListBox
    Friend WithEvents ListBox2 As System.Windows.Forms.ListBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents CatSubCatAdventureWorks_DataDataSet As WinChap13.CatSubCatAdventureWorks_DataDataSet
    Friend WithEvents ProductCategoryBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents ProductCategoryTableAdapter As WinChap13.CatSubCatAdventureWorks_DataDataSetTableAdapters.ProductCategoryTableAdapter
    Friend WithEvents ProductSubcategoryBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents ProductSubcategoryTableAdapter As WinChap13.CatSubCatAdventureWorks_DataDataSetTableAdapters.ProductSubcategoryTableAdapter
End Class
