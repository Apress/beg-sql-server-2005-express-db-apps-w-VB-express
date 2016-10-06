DECLARE @xdata xml
SET @xdata = '<root><firstname>Rick</firstname>' +
    '<firstname>Virginia</firstname></root>'
SELECT @xdata AS 'xml data'

SET @xdata = '<firstname>Rick</firstname>' +
    '<firstname>Virginia</firstname>'
SELECT @xdata AS 'xml data'

SET @xdata = '<root><firstname>Rick' +
    '<firstname>Virginia</firstname></root>'
SELECT @xdata AS 'xml data'
