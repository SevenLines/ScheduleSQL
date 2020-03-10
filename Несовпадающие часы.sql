SELECT kk.obozn, vp.pred, rn.h, rn.hy, rn.hy1, rn.hy2
FROM raspnagr rn
 LEFT JOIN kontkurs kk ON kk.id_1 = rn.kont
 LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
WHERE sem = 2 and afobuch <> 4 and (hy1 <> h or hy2 <> hy)
ORDER BY obozn