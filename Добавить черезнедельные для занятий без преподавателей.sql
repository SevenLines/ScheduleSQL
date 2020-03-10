DECLARE @id_51 int

DECLARE cur CURSOR
FOR
SELECT id_51
FROM raspnagr
WHERE isnull(prep, 0) = 0 
	and sem = 1 
	and kaf not in (218, 366, 216, 217)
	and nagrprop = 0

OPEN cur
FETCH NEXT FROM cur INTO @id_51

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO zansps(zants, prop12) VALUES (0, 1)
	UPDATE raspnagr SET nagrprop = @@IDENTITY WHERE id_51 = @id_51
	
	FETCH NEXT FROM cur INTO @id_51
END
/*
SELECT *
FROM raspnagr
WHERE isnull(prep, 0) = 0 
	and sem = 1 
	and kaf not in (218, 366, 216, 217)
	and nagrprop = 0
ORDER BY 1
*/
CLOSE cur
DEALLOCATE cur

--id_51 >= 4229408 and id_51 <= 4230407