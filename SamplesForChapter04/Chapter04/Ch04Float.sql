SET NOCOUNT ON
DECLARE @float1 float
SET @float1 = CAST(POWER(10,9) as float)
SELECT @float1 * @float1 * @float1 * @float1 * 100 AS 'Large Float value',
    FLOOR(LOG10(@float1 * @float1 * @float1 * @float1 * 100)
    + 1) AS 'Number of digits'
