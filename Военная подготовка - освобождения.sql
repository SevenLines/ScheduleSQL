SELECT id_7, kont, obozn
 INTO #konts
FROM kontgrp
WHERE rtrim(replace(replace(obozn, '(»,«)', ''), '(»,Œ)', '')) in (
'√—’·Ô-16-1',
'œ√—·-16-1',
'¿ƒ·-16-1',
'¿—”·-15-1',
'¿“·Ô-16-1',
'√¿-16-1',
'√√-15-1',
'√√-16-1',
'√Œ-15-1',
'√Œ-16-1',
'√œ-15-1',
'√œ-16-1',
'»¡·-16-1',
'»Õ·-16-1',
'»—Ã·-16-1',
'»—“·-14-1',
'»—“·-16-1',
'»‘·-16-1',
'ÃÃ·-14-1',
'ÃÃ·-16-1',
'Ã–·-16-1',
'Ã“·Ô-16-1',
'Õƒ¡-16-1',
'Õƒ·-16-2',
'Õƒ·-16-3',
'Õƒ·-16-4',
'Õƒƒ·-15-1',
'Œœ-15-1',
'œ√—·Ô-16-1',
'–ƒ·-16-1',
'—ƒÃ-15-1',
'—Ã-15-2',
'—Ã-16-1',
'—Ã-16-2',
'—”«-16-1',
'““·-16-1',
'›¬Ã·-16-1',
'›À·Ô-16-1',
'›œ·-15-1',
'›œ¡-16-1',
'›—·-16-1',
'›—“·-16-1',
'›—“·-16-2',
'›“·-16-1',
'›“·Ô-16-1',
'›”Õ·-16-1',
'›—·-16-2'
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
		and parasps like '‚ÒÂ Ô‡˚%'
)


INSERT INTO wishkontd(kont, kontid, dayofweek, everyweek, wishview, parasps)
SELECT kont, id_7, 6, 0, 20, '‚ÒÂ Ô‡˚'
FROM #konts2

SELECT id_69
 INTO #wishkonts
FROM wishkontd
WHERE kontid in (SELECT id_7 FROM #konts2) 
	and dayofweek = 6 and everyweek = 0
	and parasps like '‚ÒÂ Ô‡˚%'

INSERT INTO wishkontdpara(wish, para)
SELECT id_69, -1
FROM #wishkonts
WHERE id_69 not in (SELECT wish FROM wishkontdpara)

DROP TABLE #konts
DROP TABLE #konts2
DROP TABLE #wishkonts
