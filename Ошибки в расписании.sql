SELECT 'Задвоенные занятия', rn.pred,  sem, nt, kgl.kontid, kg.obozn, vp.pred, count(*)
FROM raspnagr rn
LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
JOIN kontgrplist kgl ON kgl.op = rn.op
LEFT JOIN kontgrp kg ON kg.id_7 = kgl.kontid
WHERE sem = 2 and isnull(rn.op, 0) != 0 and nagrtype = 1
GROUP BY rn.pred, sem, nt, kg.obozn, vp.pred, kgl.kontid
HAVING count(*) > 1
UNION
SELECT 'Задвоенные занятия', rn.pred,  sem, nt, kl.kont, kk.obozn, vp.pred, count(*)
FROM raspnagr rn
LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
JOIN kontlist kl ON kl.op = rn.op
LEFT JOIN kontkurs kk ON kk.id_1 = kl.kont
WHERE sem = 2 and isnull(rn.op, 0) != 0 and nagrtype = 1
GROUP BY rn.pred, sem, nt, kl.kont, kk.obozn, vp.pred
HAVING count(*) > 1

/***
SELECT *
FROM raspnagr rn
LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
	WHERE op in (
	SELECT op
	FROM kontgrplist
	WHERE kontid =450053
) and sem = 2

SELECT *
FROM vacpred

SELECT *
FROM kontgrplist kl
LEFT JOIN kontgrp kgr ON kgr.id_7  = kl.kontid
WHERE op = -22300040

DELETE kontgrplist
WHERE id_ = 2398
**/
