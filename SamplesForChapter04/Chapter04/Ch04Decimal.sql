SET NOCOUNT ON
DECLARE @dec1 decimal(38,0)
SET @dec1 = CAST(POWER(10,9) as decimal(38,0))
SELECT @dec1 * @dec1 * @dec1 * @dec1 * 10 AS 'Large Decimal value',
    FLOOR(LOG10(@dec1 * @dec1 * @dec1 * @dec1 * 10)
    + 1) AS 'Number of digits'


