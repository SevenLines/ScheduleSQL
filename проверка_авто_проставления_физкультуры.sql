/* ѕроверка часов проставленных зан€тий, должен возвращать пустоту */
SELECT kg.obozn, sum(case when rs.everyweek = 2 then 2 else 1 end), rn.hy
FROM raspis rs
 LEFT JOIN raspnagr rn ON rn.id_51 = rs.raspnagr
 LEFT JOIN kontgrp kg ON kg.id_7 = rn.kontid
WHERE rn.pred = 36778
GROUP BY rn.kontid, kg.obozn, rn.id_51, rn.hy
HAVING sum(case when rs.everyweek = 2 then 2 else 1 end) != rn.hy

/* ѕроверка объединений и черезнедельных свойств, должен возвращать пустоту */
SELECT *
FROM kontkurs
WHERE id_1 in (
SELECT kont
FROM raspnagr rn
LEFT JOIN zansps z ON rn.nagrprop = z.id_54
WHERE pred = 36778 and nt = 2 and prop12 % 2 != hy % 2
)