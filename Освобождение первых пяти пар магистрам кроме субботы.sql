-- добавление освобождений первых 5-ти пар

-- список контингентов магистров
SELECT objid as id
 INTO #magisters
FROM ownres
	LEFT JOIN kontkurs kk ON kk.id_1 = objid
WHERE ownerid in (
	SELECT id_75
	FROM vacdisp
	WHERE disp like '%Мг.%') --  and kk.obozn not like '%ГРМВ-%'

-- список подгрупп контингентов магистров
SELECT id_1 as id
 INTO #kontgrps
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE id_1 in ( SELECT id FROM #magisters )

-- удаляем освобождение всех пяти пар 
-- на каждый день недели у всех магистров
-- чтобы избежать повторов пожеланий, если есть какие-то другие пожелания, то они не трогаются
SELECT id_69 as wishid
 INTO #repeats
FROM wishkontd w
LEFT JOIN kontkurs kk ON kk.id_1 = w.kont
WHERE parasps like '%1; 2; 3; 4; 5;%'
 and kont in (SELECT id FROM #magisters)
 and dayofweek in (1,2,3,4,5)

DELETE FROM wishkontd
WHERE id_69 in (SELECT wishid FROM #repeats)

DELETE FROM wishkontdpara
WHERE wish in (SELECT wishid FROM #repeats)

-- освобождения у магистров первых пяти пар, по группам
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kk.id_1, 0, 1, 0, 1, '1; 2; 3; 4; 5;'
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE id_1 in ( SELECT id FROM #magisters )
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kk.id_1, 0, 2, 0, 1, '1; 2; 3; 4; 5;'
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE id_1 in ( SELECT id FROM #magisters )
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kk.id_1, 0, 3, 0, 1, '1; 2; 3; 4; 5;'
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE id_1 in ( SELECT id FROM #magisters )
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kk.id_1, 0, 4, 0, 1, '1; 2; 3; 4; 5;'
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE id_1 in ( SELECT id FROM #magisters )
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kk.id_1, 0, 5, 0, 1, '1; 2; 3; 4; 5;'
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE id_1 in ( SELECT id FROM #magisters )

-- освобождения у магистров первых пяти пар, по подгруппам
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kg.kont, kg.id_7, 1, 0, 1, '1; 2; 3; 4; 5;'
FROM kontgrp kg
WHERE kont in (SELECT id FROM #kontgrps)
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kg.kont, kg.id_7, 2, 0, 1, '1; 2; 3; 4; 5;'
FROM kontgrp kg
WHERE kont in (SELECT id FROM #kontgrps)
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kg.kont, kg.id_7, 3, 0, 1, '1; 2; 3; 4; 5;'
FROM kontgrp kg
WHERE kont in (SELECT id FROM #kontgrps)
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kg.kont, kg.id_7, 4, 0, 1, '1; 2; 3; 4; 5;'
FROM kontgrp kg
WHERE kont in (SELECT id FROM #kontgrps)
INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kg.kont, kg.id_7, 5, 0, 1, '1; 2; 3; 4; 5;'
FROM kontgrp kg
WHERE kont in (SELECT id FROM #kontgrps)

SELECT id_69 as wishid
 INTO #newly_added
FROM wishkontd w
LEFT JOIN kontkurs kk ON kk.id_1 = w.kont
WHERE parasps like '%1; 2; 3; 4; 5;%' and kont in (SELECT id FROM #magisters)

INSERT INTO wishkontdpara(wish, para)
SELECT wishid, 1 FROM #newly_added
INSERT INTO wishkontdpara(wish, para)
SELECT wishid, 2 FROM #newly_added
INSERT INTO wishkontdpara(wish, para)
SELECT wishid, 3 FROM #newly_added
INSERT INTO wishkontdpara(wish, para)
SELECT wishid, 4 FROM #newly_added
INSERT INTO wishkontdpara(wish, para)
SELECT wishid, 5 FROM #newly_added


-- для ГРМВ 6 пару еще осводобждаем
INSERT INTO wishkontdpara(wish, para)
SELECT id_69, 6
FROM wishkontd w
	LEFT JOIN kontkurs kk ON kk.id_1 = w.kont
WHERE parasps like '%1; 2; 3; 4; 5;%' and kk.obozn like 'ГРМВ%'

-- и корректируем parasps
UPDATE w
SET w.parasps = '1; 2; 3; 4; 5; 6;'
FROM wishkontd w
	LEFT JOIN kontkurs kk ON kk.id_1 = w.kont
WHERE parasps like '%1; 2; 3; 4; 5;%' and kk.obozn like 'ГРМВ%'

DROP TABLE #magisters
DROP TABLE #kontgrps
DROP TABLE #repeats
DROP TABLE #newly_added
/*
-- проверка на повторы
SELECT kont, kontid
FROM wishkontd
WHERE kont in (
	SELECT objid
	FROM ownres
	WHERE ownerid in (
		SELECT id_75
		FROM vacdisp
		WHERE disp like '%Мг.%')
) or kontid in (
	SELECT id_7 FROM kontgrp WHERE kont in (
		SELECT objid
		FROM ownres
		WHERE ownerid in (
			SELECT id_75
			FROM vacdisp
			WHERE disp like '%Мг.%')
	)
)
GROUP BY kont, kontid
HAVING count(*) > 1

SELECT *
FROM kontkurs
WHERE id_1 in (20812, 20810)
*/



