SELECT id_7, kont, obozn
 INTO #konts
FROM kontgrp
WHERE rtrim(replace(replace(obozn, '(�,�)', ''), '(�,�)', '')) in (
'�����-16-1',
'����-16-1',
'���-16-1',
'����-15-1',
'����-16-1',
'��-16-1',
'��-15-1',
'��-16-1',
'��-15-1',
'��-16-1',
'��-15-1',
'��-16-1',
'���-16-1',
'���-16-1',
'����-16-1',
'����-14-1',
'����-16-1',
'���-16-1',
'���-14-1',
'���-16-1',
'���-16-1',
'����-16-1',
'���-16-1',
'���-16-2',
'���-16-3',
'���-16-4',
'����-15-1',
'��-15-1',
'�����-16-1',
'���-16-1',
'���-15-1',
'��-15-2',
'��-16-1',
'��-16-2',
'���-16-1',
'���-16-1',
'����-16-1',
'����-16-1',
'���-15-1',
'���-16-1',
'���-16-1',
'����-16-1',
'����-16-2',
'���-16-1',
'����-16-1',
'����-16-1',
'���-16-2'
)
ORDER BY obozn

SELECT *
  INTO #konts2
FROM #konts
WHERE id_7 not in (
	SELECT kontid
	FROM wishkontd
	WHERE kontid in (SELECT id_7 FROM #konts) 
		and dayofweek = 6 and everyweek = 0
		and parasps like '��� ����%'
)


INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kont, id_7, 6, 0, 20, '��� ����'
FROM #konts2

SELECT id_69
 INTO #wishkonts
FROM wishkontd
WHERE kontid in (SELECT id_7 FROM #konts2) 
	and dayofweek = 6 and everyweek = 0
	and parasps like '��� ����%'

INSERT INTO wishkontdpara(wish, para)
SELECT id_69, -1
FROM #wishkonts
WHERE id_69 not in (SELECT wish FROM wishkontdpara)

DROP TABLE #konts
DROP TABLE #konts2
DROP TABLE #wishkonts
