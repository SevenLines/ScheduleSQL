DECLARE @op int

SET @op = 86300616

--'����', '���', '���', '����', '���', '��', '����', '���', '���', '���', '����', '����', '���', '����'
-- '����', '���', '���', '����', '���', '��', '����', '���', '���', '���', '����', '����', '���', '����'


SELECT id_1
 INTO #kk
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE rtrim(va.aobozn) in ('���', '����', '����', '����', '����', '����', '����')
	and kurs = 1 
	/*and id_1 not in (
		SELECT kont
		FROM kontlist
		WHERE op = @op
	)*/

SELECT *
FROM #kk

DELETE FROM kontlist WHERE op = @op

INSERT INTO kontlist
SELECT @op, id_1
FROM #kk

DROP TABLE #kk

SELECT *
FROM kontlist
WHERE op = @op