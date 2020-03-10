SELECT kk.obozn, kk.kurs, pr.pred, nt.repvrnt, s.aud
FROM raspis s
 LEFT JOIN raspnagr rn ON rn.id_51 = s.raspnagr
 LEFT JOIN vacpred pr ON pr.id_15 = rn.pred
 LEFT JOIN kontkurs kk ON kk.id_1 = rn.kont
 LEFT JOIN normtime nt ON nt.id_40 = rn.nt
WHERE s.aud = 0 and rn.sem = 1 and rn.pred not in (13572, 13643, 581, 17111, 29570, 33272, 585, 17987, 24959, 1369, 16297)
