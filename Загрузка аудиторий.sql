/*
  «агруженость аудиторий с учетом магистров и пожеланий, без учета заочников
*/
SELECT rtrim(t.obozn) as obozn , ceiling(t.h + isnull(w.h, 0)) as h
 INTO #auditories
FROM (
	SELECT a.obozn, aud, sum(h) as h
	FROM (
		SELECT
			CASE WHEN al.aud = 0 or al.aud is NULL THEN rn.aud ELSE al.aud END as aud,
			CASE WHEN nagrprop = 0 THEN id_51 ELSE nagrprop END as id, 
			max(rn.h / isnull(asize.c, 1)) as h
		FROM raspnagr rn
		LEFT JOIN audlist al ON al.auds = rn.aud 
		LEFT JOIN (SELECT auds, count(*) as c FROM audlist GROUP BY auds) asize ON asize.auds = al.auds
		LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
		WHERe sem = 1 and afobuch = 1
		GROUP BY CASE WHEN al.aud = 0 or al.aud is NULL THEN rn.aud ELSE al.aud END, CASE WHEN nagrprop = 0 THEN id_51 ELSE nagrprop END
	) t
	LEFT JOIN auditories a ON t.aud = a.id_60
	WHERE a.obozn is not NULL
	GROUP BY a.obozn, aud
) t
LEFT JOIN (
	SELECT t.aud, sum(pairs * dayofweek * everyweek) as h
	FROM (
		SELECT 
			wa.aud as aud, 
			CASE WHEN rtrim(parasps) = 'все пары' THEN 8 ELSE LEN(parasps) - LEN(REPLACE(parasps, ';', '')) END as pairs,
			CASE WHEN dayofweek = 0 THEN 6 ELSE 1 END as dayofweek,
			CASE WHEN everyweek = 0 THEN 2 ELSE 1 END as everyweek
		FROM wishaudd wa
	) t
	GROUP BY t.aud
) w ON w.aud = t.aud
ORDER BY 1-- DESC

SELECT TOP 100 *
FROM #auditories
ORDER BY 2 DESC

SELECT *
FROM #auditories
ORDER BY 1

DROP TABLE #auditories