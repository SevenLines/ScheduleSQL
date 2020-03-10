SELECT rtrim(coalesce(pl.konts, kg.obozn, kk.obozn)), rtrim(nt.repvrnt), rtrim(vp.pred), rs.day, rs.para
FROM raspis rs
LEFT JOIN raspnagr rn ON rn.id_51 = rs.raspnagr
LEFT JOIN  prepods pr ON pr.id_61 = rn.prep
LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
LEFT JOIN kontkurs kk ON kk.id_1 = rn.kont
LEFT JOIN kontgrp kg ON kg.id_7 = rn.kontid
LEFT JOIN potoklist pl ON pl.op = rn.op
LEFT JOIN vacnt nt ON nt.id_41 = rn.nt
WHERE pr.prep like '%ÂÀÊ-%' and rn.sem = 2
ORDER BY 1

SELECT *
FROM dbo.vacnt