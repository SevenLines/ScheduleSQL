DECLARE @sem int;

SET @sem = 2;

SELECT n2.*,
	case [Вид Работ] when 'Лек' then 1 when 'Прак' then 2 when 'Лаб' then 3 end as nt,
	n2.[Группа] as obozn,
	vk.id_17 as kaf,
	vp.id_15 as pred,
	kg.id_7 as kontid,
	kg.kont as kont,
	2 - cast(n2.[Семестр] as int) % 2 as sem
 INTO  #temp
FROM dbo.Нагрузка n2
 LEFT JOIN vacpred vp ON vp.pred = n2.[Дисциплина]
 LEFT JOIN vackaf vk ON vk.kaf = n2.[Кафедра]
 LEFT JOIN kontgrp kg ON 
	kg.obozn like case when n2.[НомПГ] != 0 
						then n2.[Группа]+'-'+cast(n2.[НомПГ] as varchar) 
						else n2.[Группа] + '(' 
						end +'%'
 JOIN ownres o ON o.objid = kg.kont and o.ownerid != 44
ORDER BY 1

SELECT n.[Группа], n.[Дисциплина], n.[НомПГ], n.[Вид Работ], n.*
FROM #temp n
LEFT JOIN (
	SELECT DISTINCT n2.id
	FROM #temp n2
	 LEFT JOIN kontlist kl ON kl.kont = n2.kont
	 LEFT JOIN kontgrplist kgl ON kgl.kontid = n2.kontid
	 LEFT JOIN raspnagr rn ON rn.pred = n2.pred 
		and rn.kaf = n2.kaf 
		and rn.sem = @sem
		and rn.nt = n2.nt
		and (kgl.op = rn.op or kl.op = rn.op or rn.kontid = n2.kontid or (rn.kontid = 0 and rn.kont = n2.kont))
	WHERE n2.sem = @sem 
		and rn.id_51 is not NULL
) n2 ON n2.id = n.id 
WHERE n.sem = @sem and n2.id is NULL
ORDER BY n.[Дисциплина], n.[Группа]

DROP TABLE #temp

-- повторы потоков
SELECT pl.konts, pl.semestr, vp.pred
FROM raspnagr rn
LEFT JOIN potoklist pl ON pl.op = rn.op
 LEFT JOIN raspnagr rn2 ON rn.pred = rn2.pred and rn.sem = rn2.sem and rn.id_51 != rn2.id_51
 LEFT JOIN potoklist pl2 ON pl2.op = rn2.op
 LEFT JOIN vacpred vp ON vp.id_15 = rn.pred
WHERE rn.sem = @sem and isnull(rn.op, 0) != 0 and pl2.konts = pl.konts --and pl.semestr = pl2.semestr
GROUP BY pl.konts, pl.semestr, vp.pred
HAVING count(*) > 1