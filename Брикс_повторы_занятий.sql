SELECT pl.op, pd.prep, rn.nt, vp.pred, rn.kont, rn.kontid, rn.prep, rn. pred, rn.dbeg, rn.days, count(*)
FROM raspnagr rn
LEFT JOIN potoklist pl ON pl.op = rn.op
LEFT JOIN prepods pd ON pd.id_61 = rn.prep
LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
WHERE rn.kaf= 868 and rn.sem = 2
GROUP BY pl.op, pd.prep, rn.nt, vp.pred, rn.kont, rn.prep, rn.pred, rn.kontid, rn.dbeg, rn.days
HAVING count(*) > 1
