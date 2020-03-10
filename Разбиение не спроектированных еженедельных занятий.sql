DECLARE @ID int
DECLARE cur CURSOR
FOR
SELECT DISTINCT rn.id_51 --, rtrim(isnull(kk2.obozn, kk.obozn)), rn.*
FROM raspnagr rn
LEFT JOIN kontkurs kk ON kk.id_1 = rn.kont
LEFT JOIN kontlist kl ON kl.op = rn.op
LEFT JOIN kontkurs kk2 ON kk.id_1 = kl.kont
LEFT JOIN zansps zs ON zs.id_54 = rn.nagrprop
WHERE id_51 not in (
	SELECT raspnagr
	FROM raspis
) and sem = 2  
and rtrim(isnull(kk2.obozn, kk.obozn)) not like '%(х,г)' 
and rtrim(isnull(kk2.obozn, kk.obozn)) not like '%(ся,%'
and rtrim(isnull(kk2.obozn, kk.obozn)) not like '%(х,б%'
and isnull(kk2.fac, kk.fac) != 664
and nagrprop = 0
and nagrtype = 1
and hy % 2 = 0
ORDER BY id_51

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



