DECLARE @sem int
SET @sem = 2

SELECT 1 as p
INTO #pairs
UNION SELECT 2
UNION SELECT 3
UNION SELECT 4
UNION SELECT 5
UNION SELECT 6
UNION SELECT 7
UNION SELECT 8

SELECT 1 as dayofweek
INTO #days
UNION SELECT 2
UNION SELECT 3
UNION SELECT 4
UNION SELECT 5
UNION SELECT 6

SELECT 1 as everyweek
INTO #everyweek
UNION SELECT 2

-- переписать
SELECT rtrim(t2.obozn), 
	sum(CASE WHEN day is NULL THEN 0 ELSE 1 END) as occupation, 
	cast(floor(1.0*sum(CASE WHEN day is NULL THEN 0 ELSE 1 END) / 96 * 100) as varchar) + '%' as occupation, a.maxstud
FROM (
	SELECT obozn, day, everyweek, para
	FROM (
	SELECT a.obozn, (day - 1) % 7 + 1 as day, everyweek, r.para--, count(*) as hours
	FROM auditories a
	LEFT JOIN (
		SELECT isnull(al.aud, rs.aud) as aud, day, para, kol_par, 
			CASE 
				WHEN rs.everyweek = 1 THEN 
					CASE 
						WHEN day < 8 THEN 1 
						ELSE 2 
					END
				ELSE e.everyweek
			END as everyweek
		FROM raspis rs
		  LEFT JOIN raspnagr rn ON rn.id_51 = rs.raspnagr
		  LEFT JOIN audlist al ON al.auds = rs.aud
		  LEFT JOIN #everyweek e ON rs.everyweek = 2
		WHERE sem = @sem
	) r ON r.aud = a.id_60 
	UNION ALL
	SELECT a.obozn, (day - 1) % 7 + 1, everyweek, r.para--, count(*) as hours
	FROM auditories a
	LEFT JOIN (
		SELECT ws.aud, isnull(d.dayofweek, ws.dayofweek) as day, e.everyweek, isnull(p.p, wsp.para) as para
		FROM wishauddpara wsp
			JOIN wishaudd ws ON wsp.wish = ws.id_62
			LEFT JOIN #pairs p ON wsp.para = -1
			LEFT JOIN #days d ON ws.dayofweek = 0
			LEFT JOIN #everyweek e ON ws.everyweek = 0
	) r ON r.aud = a.id_60 
	) t
	GROUP BY obozn, day, everyweek, para
) t2
LEFT JOIN auditories a ON t2.obozn = a.obozn
WHERE t2.obozn not like 'М-%' and t2.obozn not like 'Т-%' and t2.obozn != ''
GROUP BY rtrim(t2.obozn), a.maxstud
ORDER BY 1

DROP TABLE #pairs
DROP TABLE #days
DROP TABLE #everyweek

