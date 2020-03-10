SELECT sum(stud) * 8 / 6
FROM (
	SELECT 
	isnull(t2.h, 0) * 7 + day as weekday,
	rs.para as para,
	sum(t.stud) as stud
	FROM raspis rs
	JOIN (
		SELECT id_55 as id, sum(coalesce(kg.students, kk.stud, 0)) as stud
		FROM raspis rs
		 LEFT JOIN raspnagr rn ON rn.id_51 = rs.raspnagr
		 LEFT JOIN kontlist kl ON kl.op = rn.op
		 LEFT JOIN kontgrp kg ON kg.id_7 = rn.kontid
		 LEFT JOIN kontkurs kk ON kk.id_1 = isnull(kl.kont, rn.kont)
		WHERE rs.aud in (
			SELECT id_60
			FROM auditories
			WHERE obozn like '—Ã»%'
		)
		GROUP BY id_55
	) t ON t.id = rs.id_55
	LEFT JOIN (
		SELECT 0 as h
		UNION 
		SELECT 1
	) t2 ON rs.everyweek = 2
	GROUP BY para, isnull(t2.h, 0) * 7 + day
) t
--ORDER BY weekday, para, stud
