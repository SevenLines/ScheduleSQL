DECLARE @kont int, @sem int

SELECT @sem = 1

SELECT @kont = 17484 -- яна-14

SELECT * 
INTO #konts_id
FROM kontgrp 
WHERE kont = @kont and depth = 1


INSERT raspnagr(kont, kontid, op, nt, sem, pred, kaf, fobuch, afobuch, nagrid, h, hy, dbeg, days, prep, aud, nagrtype, nagrprop, stud, editstud, hy1, hy2, syear, u)
SELECT r.kont, t.id_7, op, nt, sem, pred, kaf, fobuch, afobuch, nagrid, h, hy, dbeg, days, prep, aud, nagrtype, nagrprop, t.students, editstud, hy1, hy2, syear, u
FROM raspnagr r
 LEFT JOIN #konts_id t ON t.id_7 = t.id_7
WHERE r.kont = @kont AND r.sem = @sem and  r.kontid = 0

DELETE raspnagr
WHERE kont = @kont AND sem = @sem and  kontid = 0

DROP TABLE #konts_id




--WHERE r.kont = 17484 AND r.sem = 1 and  r.kontid = 0


/* raspnagr:
3986377
3986378
3986379
3986380
3986381
3986382
3986383
*/