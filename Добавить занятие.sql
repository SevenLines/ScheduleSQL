DECLARE @nt int, @id51 int, @pred int, @kont int, @kontid int

SELECT @nt = 3 -- ��� �������
SELECT @id51 = 4153981 -- ����� ����� ������
SELECT @pred = 22231 -- �������
SELECT @kont = 21798 -- ����������
SELECT @kontid = 449377 -- ���������

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

448611 --����-14-1-1(�,�)
449377 -- ����-14-1-2(�,�)

SELECT *
FROM kontgrp
WHERE obozn like '%����-14%'

SELECT *
FROM vacpred
WHERE pred like '%������ ����������%' 
WHERE id_15  = 596

SELECT *
FROM normtime

SELECT TOP 1 *
FROM raspnagr rn
ORDER BY 1  DESC*/

