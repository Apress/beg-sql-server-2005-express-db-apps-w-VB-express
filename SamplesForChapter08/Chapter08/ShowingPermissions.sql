USE master
GO

--Syntax for listing all permissions
SELECT * FROM sys.fn_builtin_permissions(DEFAULT)

--Return a list of all securable class names
SELECT DISTINCT class_desc
FROM sys.fn_builtin_permissions(DEFAULT)
ORDER BY class_desc

--List permissions for LOGIN securable class
SELECT class_desc 'class', 
    permission_name, 
    covering_permission_name 'covering_permission',
    parent_class_desc 'parent_class',
    parent_covering_permission_name 'parent_covering_permission'    
FROM sys.fn_builtin_permissions(N'LOGIN')

--For display in book
SELECT CAST(class_desc AS nvarchar(5)) 'class', 
    CAST(permission_name AS nvarchar(15)) 'permission_name',
    CAST(covering_permission_name AS nvarchar(19)) 'covering_permission',
    CAST(parent_class_desc AS nvarchar(12)) 'parent_class',
    CAST(parent_covering_permission_name AS nvarchar(26)) 'parent_covering_permission'
FROM sys.fn_builtin_permissions(N'LOGIN')


--Explore a specific permission for a securable class
SELECT class_desc 'class', 
    permission_name, 
    covering_permission_name 'covering_permission',
    parent_class_desc 'parent_class',
    parent_covering_permission_name 'parent_covering_permission'    
FROM sys.fn_builtin_permissions(N'SERVER')
WHERE permission_name = 'ALTER ANY LOGIN'

--For display in book
SELECT CAST(class_desc AS nvarchar(6)) 'class', 
    CAST(permission_name AS nvarchar(15)) 'permission_name',
    CAST(covering_permission_name AS nvarchar(19)) 'covering_permission',
    CAST(parent_class_desc AS nvarchar(12)) 'parent_class',
    CAST(parent_covering_permission_name AS nvarchar(26)) 'parent_covering_permission'
FROM sys.fn_builtin_permissions(N'SERVER')
WHERE permission_name = 'ALTER ANY LOGIN'



