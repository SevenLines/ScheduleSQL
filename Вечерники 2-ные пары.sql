
DECLARE @sem INT
SELECT @sem=2 
UPDATE zansps SET 
 prop11 = 2
where id_54 in(
SELECT nagrprop
FROM raspnagr 
WHERE sem = @sem
	and nt in (1,2,3)
	--and hy1 % 2 = 0
	and afobuch = 4
	and nagrtype = 1
	and nagrprop > 0
	and hy >= 2
)


DECLARE @id_51 int, @nagrprop int

DECLARE RASP_CUR CURSOR FOR
  SELECT id_51
  FROM raspnagr 
  WHERE sem = @sem
	and nt in (1,2,3)
	--and hy1 % 2 = 0
	and afobuch = 4
	and nagrtype = 1
	and nagrprop = 0
	and hy>=2


OPEN RASP_CUR

FETCH NEXT FROM RASP_CUR INTO @id_51

WHILE @@FETCH_STATUS = 0
BEGIN
 INSERT INTO zansps (zants, prop11) VALUES (0,2)
 SET @nagrprop = @@identity
 UPDATE raspnagr SET nagrprop = @nagrprop WHERE id_51 = @id_51
 FETCH NEXT FROM RASP_CUR INTO @id_51
END

CLOSE RASP_CUR
DEALLOCATE RASP_CUR
