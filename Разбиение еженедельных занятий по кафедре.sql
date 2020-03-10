SELECT *
INTO #base
FROM raspnagr
WHERE sem = 2 
	and kaf = 850  -- тут кафедру поменять
	and id_51 not in (SELECT raspnagr FROM raspis)


UPDATE z
SET prop12 = 1
FROM zansps z
WHERE id_54 in (
	SELECT nagrprop
	FROM #base
	WHERE nagrprop != 0	
)

DECLARE @ID int
DECLARE cur CURSOR
FOR
SELECT id_51
FROM #base
WHERE nagrprop = 0

OPEN cur
FETCH NEXT FROM cur INTO @ID

WHILE @@FETCH_STATUS = 0
BEGIN

BEGIN TRAN T1;

INSERT INTO zansps(zants, prop12)
VALUES(0, 1)

UPDATE raspnagr
SET nagrprop = SCOPE_IDENTITY()
WHERE id_51 = @ID

COMMIT TRAN T1; 

FETCH NEXT FROM cur INTO @ID
END

CLOSE cur
DEALLOCATE cur

DROP TABLE #base