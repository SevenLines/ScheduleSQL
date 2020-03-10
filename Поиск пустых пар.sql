SELECT 1 as wk
INTO #pairs
UNION 
SELECT 2

SELECT kg1.kont, kg1.id_7 as kg1, kg2.id_7 as kg2
FROM kontgrp kg1
 LEFT JOIN kontgrp kg2 ON kg2.id_7 = kg1.parent
WHERE kg1.id_7 = 450884

SELECT DISTINCT --id_51, 
kgr.obozn, 
kgr.id_7,
case when p.wk = 2 then 7 + day else day end as day2, 
para,
kgr_.id_7, kgr_.kont
FROM raspis rs
 
/*	LEFT JOIN raspnagr rn ON rn.id_51 = rs.raspnagr
	
	LEFT JOIN kontgrp kgr1 ON kgr1.kont = rn.kont and isnull(rn.kontid, 0) = 0
	LEFT JOIN kontgrp kgr2 ON kgr2.id_7 = rn.kontid

	LEFT JOIN kontlist kl ON kl.op = rn.op
	LEFT JOIN kontgrp kgr3 ON kgr3.kont = kl.kont

	LEFT JOIN kontgrplist kgl ON kgl.op = rn.op

	LEFT JOIN kontgrp kgr ON kgr.id_7 = coalesce(kgl.kontid, kgr3.id_7, kgr2.id_7, kgr1.id_7)
	LEFT JOIN kontgrp kgr_ ON kgr_.id_7 = kgr.parent
	*/
	--LEFT JOIN kontgrp kgr5 ON kgr5.id_7 = kgr4.parent
	--LEFT JOIN kontgrp kgr ON kgr.id_7 = case when kgr5.id_7 = 0 then kgr4.id_7 else kgr5.id_7 end
	
	LEFT JOIN #pairs p ON rs.everyweek = 2
--GROUP BY kgr.obozn, kgr.id_7, case when p.wk = 2 then 7 + day else day end
--HAVING (max(para) - min(para) + 1) / count(*) != 1
WHERE kgr.id_7 = 450884--450093 --450884--
ORDER BY kgr.id_7, day2, para

/*SELECT *
FROM kontgrp

SELECT --id_51, 
kgr.obozn, 
kgr.id_7
--case when p.wk = 2 then 7 + day else day end as day2, 
--para
FROM raspis rs
	LEFT JOIN raspnagr rn ON rn.id_51 = rs.raspnagr
	LEFT JOIN kontgrp kgr1 ON kgr1.kont = rn.kont and isnull(rn.kontid, 0) = 0
	LEFT JOIN kontgrp kgr2 ON kgr2.id_7 = rn.kontid

	LEFT JOIN kontlist kl ON kl.op = rn.op
	LEFT JOIN kontgrp kgr3 ON kgr3.kont = kl.kont

	LEFT JOIN kontgrplist kgl ON kgl.op = rn.op

	LEFT JOIN kontgrp kgr ON kgr.id_7 = coalesce(kgl.kontid, kgr3.id_7, kgr2.id_7, kgr1.id_7)
	LEFT JOIN #pairs p ON rs.everyweek = 2
GROUP BY kgr.obozn, kgr.id_7, case when p.wk = 2 then 7 + day else day end
HAVING (max(para) - min(para) + 1) / count(*) != 1
--WHERE kgr.id_7 = 450884
--ORDER BY kgr.id_7, day2, para*/


DROP TABLE #pairs