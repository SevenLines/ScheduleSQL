DECLARE @nt int, @id51 int, @pred int, @kont int, @kontid int

SELECT @nt = 3 -- тип занятия
SELECT @id51 = 4153981 -- копию этого делаем
SELECT @pred = 22231 -- предмет
SELECT @kont = 21798 -- контингент
SELECT @kontid = 449377 -- подгруппа

INSERT INTO raspnagr(kont, kontid, op, nt, sem, pred, kaf, fobuch, afobuch, nagrid, h, hy, dbeg, days, prep, aud, nagrtype, nagrprop, oldid, nagr_h, stud, editstud, rnprep, syear, u)
SELECT TOP 1 @kont, @kontid, op, @nt, sem, @pred, kaf, fobuch, afobuch, nagrid, h, hy, dbeg, days, 0, 0, nagrtype, 0, oldid, nagr_h, stud, editstud, rnprep, syear, u
FROM raspnagr rn
 LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
WHERE id_51 = @id51
ORDER BY rn.pred



/*
UPDATE rn
SET pred = 22231
FROM raspnagr rn
WHERE id_51 in (4179148, 4179147)

SELECT *
FROM raspnagr
WHERE kontid = 448158 and pred = 22231

448611 --ЭВМБ-14-1-1(И,О)
449377 -- ЭВМБ-14-1-2(И,О)

SELECT *
FROM kontgrp
WHERE obozn like '%АСУБ-14%'

SELECT *
FROM vacpred
WHERE pred like '%Защита информации%' 
WHERE id_15  = 596

SELECT *
FROM normtime

SELECT TOP 1 *
FROM raspnagr rn
ORDER BY 1  DESC*/

