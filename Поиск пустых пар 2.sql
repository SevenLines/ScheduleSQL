SELECT 1 as wk
INTO #pairs
UNION 
SELECT 2

SELECT DISTINCT 
kgr.obozn, kgr.id_7, disp--t.*
FROM (
	SELECT kontid, 
	day,
	disp,
	max(case when kaf = 218 then para else -1 end) as phy,
	min(case when kaf = 218 then 99 else para end) as _min,
	max(case when kaf = 218 then -99 else para end) as _max, 
	count(*) as cnt
	FROM (
		SELECT DISTINCT 
		kgr.id_7 as kontid,
		vd.disp,
		case when p.wk = 2 then 7 + day else day end as day,
		rs.para + isnull(p2.wk, 1) - 1 as para,
		max(rn.kaf) as kaf
		FROM kontgrp kgr
		 LEFT JOIN kontgrp kgr_ ON kgr_.id_7 = kgr.parent or kgr_.parent = kgr.id_7
		 LEFT JOIN kontgrplist kgrl ON kgrl.kontid in (kgr.id_7, kgr_.id_7)
		 LEFT JOIN kontlist kl ON kl.kont = kgr.kont
		 LEFT JOIN raspnagr rn ON rn.op in (kl.op, kgrl.op) or (rn.kont = kgr.kont and isnull(rn.kontid, 0) = 0) or rn.kontid in (kgr.id_7, kgr_.id_7)
		 JOIN raspis rs ON rs.raspnagr = rn.id_51
		 LEFT JOIN #pairs p ON rs.everyweek = 2  -- бьем на через недельные
		 LEFT JOIN #pairs p2 ON rs.kol_par = 2 -- 2-х часовые
		 LEFT JOIN ownres own ON own.objid = kgr.kont
		 LEFT JOIN vacdisp vd ON vd.id_75 = kgr.kont
		WHERE sem = 2
		GROUP BY kgr.id_7, vd.disp, case when p.wk = 2 then 7 + day else day end, rs.para + isnull(p2.wk, 1) - 1
	) t
	GROUP BY kontid, disp, day
) t
LEFT JOIN kontgrp kgr ON kgr.id_7 = t.kontid
WHERE 
_min != 99 
and _max != -99
and (_max - _min + 1) != case when phy = -1 or (phy != -1 and _min < phy and phy < _max) then cnt else cnt - 1 end
ORDER BY kgr.obozn


DROP TABLE #pairs
