SELECT DISTINCT rs.aud,
case when p.i = 2 then 7 + day else day end as day,
		rs.para + isnull(p2.i, 1) - 1 as para,
raspnagr, rs.id_55
INTO #tables
FROM raspis rs 
 JOIN raspnagr rn ON rs.raspnagr = rn.id_51
 LEFT JOIN auditories a ON a.id_60 = rs.aud
 LEFT JOIN (SELECT 1 as i UNION SELECT 2) p ON rs.everyweek = 2  -- бьем на через недельные
 LEFT JOIN (SELECT 1 as i UNION SELECT 2) p2 ON rs.kol_par = 2 -- 2-х часовые
WHERE rn.sem = 2 and rs.aud != 0
ORDER BY day, rs.para


SELECT 1 as d INTO #days  UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION  SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13
SELECT 1 as p INTO #pairs UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 

SELECT rtrim(aud.obozn), a.raspnagr, d.d, p.p, CASE WHEN a.aud IS NULL THEN NULL ELSE 'V' END
FROM #days d
	JOIN #pairs p ON 1 = 1
	JOIN auditories aud ON 1 = 1
	LEFT JOIN #tables a ON a.day = d.d and p.p = a.para and a.aud = aud.id_60
WHERE aud.obozn != '' and rtrim(aud.obozn) = 'Ж-316'
ORDER BY aud.obozn, d.d, p.p

DROP TABLE #tables
DROP TABLE #pairs
DROP TABLE #days


