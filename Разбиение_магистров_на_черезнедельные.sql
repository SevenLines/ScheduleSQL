SELECT DISTINCT id_51
 INTO #rn_ids
FROM raspnagr rn
 LEFT JOIN kontlist kl ON kl.op = rn.op
 LEFT JOIN kontgrplist kgl ON kgl.op = rn.op
WHERE rn.kont in (
	SELECT kk.id_1
	FROM kontkurs kk
	WHERE kk.id_1 in (
	 SELECT DISTINCT objid
	 FROM ownres
	 WHERE  ownerid in (
		SELECT id_75
		FROM vacdisp
		WHERE disp like 'Ìã.%')
	)
)
or rn.kontid in (
	SELECT kg.id_7
	FROM kontgrp kg
	WHERE kg.kont in (
	 SELECT DISTINCT objid
	 FROM ownres
	 WHERE  ownerid in (
		SELECT id_75
		FROM vacdisp
		WHERE disp like 'Ìã.%')
	)
) or kl.kont in (
	SELECT kk.id_1
	FROM kontkurs kk
	WHERE kk.id_1 in (
	 SELECT DISTINCT objid
	 FROM ownres
	 WHERE  ownerid in (
		SELECT id_75
		FROM vacdisp
		WHERE disp like 'Ìã.%')
	)
) or kgl.kontid in (
	SELECT kg.id_7
	FROM kontgrp kg
	WHERE kg.kont in (
	 SELECT DISTINCT objid
	 FROM ownres
	 WHERE  ownerid in (
		SELECT id_75
		FROM vacdisp
		WHERE disp like 'Ìã.%')
	)
)

UPDATE zansps 
SET prop12 = 1
where id_54 in(
	SELECT nagrprop
	FROM raspnagr 
	WHERE id_51 in (SELECT * FROM #rn_ids) and nagrprop > 0
)

DECLARE @id_51 int, @nagrprop int

DECLARE RASP_CUR CURSOR FOR
  SELECT id_51
  FROM raspnagr 
  WHERE id_51 in (SELECT * FROM #rn_ids) and nagrprop = 0

OPEN RASP_CUR

FETCH NEXT FROM RASP_CUR INTO @id_51

WHILE @@FETCH_STATUS = 0
BEGIN
 INSERT INTO zansps (zants, prop12) VALUES (0,1)
 SET @nagrprop = @@identity
 UPDATE raspnagr SET nagrprop = @nagrprop WHERE id_51 = @id_51
 FETCH NEXT FROM RASP_CUR INTO @id_51
END

CLOSE RASP_CUR
DEALLOCATE RASP_CUR


DROP TABLE #rn_ids

