SELECT para, rtrim(a.obozn),rtrim( coalesce(pl.konts, kg.obozn, kk.obozn)), rn.stud, pl.semestr, rtrim(pp.prep), rtrim(vp.preds), *
FROM raspis r
 LEFT JOIN raspnagr rn ON rn.id_51 = r.raspnagr
 LEFT JOIN potoklist pl ON pl.op = rn.op
 LEFT JOIN kontkurs kk ON kk.id_1 = rn.kont
 LEFT JOIN kontgrp kg ON kg.id_7 = rn.kontid
 LEFT JOIN prepods pp ON pp.id_61 = rn.prep
 LEFT JOIN auditories a ON a.id_60 = r.aud
 LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
WHERE (everyweek = 2 and day = 6 or (everyweek = 1 and (day = 6) ))
	and para in (4,5)
	and r.aud in (486, 908, 456, 457, 191, 381, 361, 61, 211, 393, 403, 495, 834, 833, 212, 640, 641, 639, 638, 648,190, 517, 646, 647, 370, 422)
ORDER BY para, a.obozn