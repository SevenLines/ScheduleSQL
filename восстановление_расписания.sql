/*
-- восстановить одиночные занятия
UPDATE rsps
SET rsps.raspnagr = t.new_id
FROM raspis rsps
 JOIN (
 SELECT rn.id_51 new_id, rn_old.id_51 old_id--,
		--rn.nt, rn_old.nt,
		--rn.pred, rn_old.pred,
		--rn.sem, rn_old.sem,
		--rn.afobuch, rn_old.afobuch,
		--rn.kontid, rn_old.kontid,
		--rn.kont, rn_old.kont
	FROM raspnagr rn
	  JOIN SPR_POLITEX_PRESENT.dbo.raspnagr rn_old 
	  ON (isnull(rn.kontid, 0) = 0 AND rn.kont = rn_old.kont 
			OR isnull(rn.kontid, 0) != 0 AND rn.kontid = rn_old.kontid)
		AND rn.nt = rn_old.nt 
		AND rn.pred = rn_old.pred 
		AND rn.sem = rn_old.sem
		AND rn.afobuch = rn_old.afobuch
	WHERE rn.sem = 1  and rn.afobuch = 1 and isnull(rn.kont, 0) != 0 and rn.id_51 != rn_old.id_51
	--ORDER BY rn.id_51
) t ON t.old_id = rsps.raspnagr
*/

/*
-- восстановить одиночные занятия
UPDATE rsps
SET rsps.raspnagr = t.new_id
FROM raspis rsps
 JOIN (
	SELECT rn.id_51 new_id, rn_old.id_51 old_id--, rn_old.prep prep_id--, rn.op, rn_old.op, pl.konts, pl_old.konts--kl.kont, kl_old.kont, rn_old.prep, rn.prep, *
	FROM raspnagr rn 
		JOIN kontlist kl ON kl.op = rn.op
		JOIN SPR_POLITEX_PRESENT.dbo.raspnagr rn_old ON 
			rn.nt = rn_old.nt 
			AND rn.pred = rn_old.pred 
			AND rn.sem = rn_old.sem
			AND rn.afobuch = rn_old.afobuch
		JOIN SPR_POLITEX_PRESENT.dbo.kontlist kl_old ON kl_old.op = rn_old.op AND kl.kont = kl_old.kont
		JOIN potoklist pl ON pl.op = rn.op
		JOIN SPR_POLITEX_PRESENT.dbo.potoklist pl_old ON pl_old.op = rn_old.op
	WHERE rn.sem = 1 AND isnull(rn_old.op, 0) > 0  and rn.id_51 != rn_old.id_51
	GROUP BY rn.id_51, rn_old.id_51
	--ORDER BY rn.id_51
) t ON t.old_id = rsps.raspnagr
*/

SELECT rn.id_51 new_id, rn_old.id_51 old_id--, rn_old.prep prep_id--, rn.op, rn_old.op, pl.konts, pl_old.konts--kl.kont, kl_old.kont, rn_old.prep, rn.prep, *
FROM raspnagr rn 
	JOIN kontlist kl ON kl.op = rn.op
	JOIN SPR_POLITEX_PRESENT.dbo.raspnagr rn_old ON 
		rn.nt = rn_old.nt 
		AND rn.pred = rn_old.pred 
		AND rn.sem = rn_old.sem
		AND rn.afobuch = rn_old.afobuch
	JOIN SPR_POLITEX_PRESENT.dbo.kontlist kl_old ON kl_old.op = rn_old.op AND kl.kont = kl_old.kont
	JOIN potoklist pl ON pl.op = rn.op
	JOIN SPR_POLITEX_PRESENT.dbo.potoklist pl_old ON pl_old.op = rn_old.op
WHERE rn.sem = 1 AND isnull(rn_old.op, 0) > 0  and rn.id_51 != rn_old.id_51
GROUP BY rn.id_51, rn_old.id_51 --, rn_old.prep, rn.op, rn_old.op, pl.konts, pl_old.konts
--ORDER BY 1