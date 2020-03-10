UPDATE raspnagr
SET dbeg = 154, days = 126
WHERE id_51 = 4231989

SELECT *
FROM raspnagr
WHERE id_51 = 4231988

UPDATE raspnagr
SET op = 86300617
WHERE  id_51 = 4231989

INSERT INTO potoklist(op, pred, semestr, groups, pgroups, stud, oblek, obsem, oblab, konts, kaf,fobuch, fil, lek, sem, lab, dbeg, days, syear)
SELECT (SELECT max(op) + 1 FROM potoklist), pred, semestr, groups, pgroups, stud, oblek, obsem, oblab, konts, kaf,fobuch, fil, lek, sem, lab, dbeg, days, syear
FROM potoklist
WHERE op = 17600360   

SELECT *
FROM potoklist
ORDER BY 1 DESC

SELECT *
FROM kontkurs
WHERE obozn like 'ÒÂÁ%'

INSERT INTO kontlist(op, kont)
SELECT 86300617, 22858
UNION
SELECT 86300617, 22932
UNION
SELECT 86300617, 23203
