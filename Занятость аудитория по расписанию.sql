SELECT rtrim(aud.obozn), isnull(cast(oc.h as varchar), ''),
	 isnull(cast(wish.h as varchar), ''), isnull(oc.h, 0) + isnull(wish.h, 0)
FROM auditories aud
 LEFT JOIN (
	 SELECT a.id_60 as id, a.obozn, sum(
		case when everyweek = 2
		then 2
		else 1 
		end	
	) as h
	FROM raspis r
	 LEFT JOIN raspnagr rn ON rn.id_51 = r.raspnagr
	 LEFT JOIN auditories a ON a.id_60 = r.aud
	GROUP BY a.obozn, a.id_60
) oc ON oc.id = aud.id_60
 LEFT JOIN (
	SELECT id, obozn, SUM(case when everyweek = 0 then t * 6 * dayofweek else t * dayofweek end) as h
	FROM (
		SELECT CASE WHEN parasps like '%1%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%2%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%3%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%4%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%5%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%6%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%7%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%8%' THEN 1 ELSE 0 END as t, everyweek, 
			case when dayofweek > 0 then 1 else 2 end as dayofweek, a.obozn as obozn, id_60 as id
		FROM wishaudd w
		 LEFT JOIN auditories a ON a.id_60 = w.aud
	) t
	GROUP BY id, obozn
) wish ON wish.id = aud.id_60
WHERE (oc.h is not NULL or wish.h is not NULL)
and rtrim(aud.obozn) in ('À-01', 'Á-04', 'Á-100', 'Á-103', 'Á-121', 'Á-303', 'Á-305', 'Á-306', 'Á-307', 'Á-310', 'Á-àìô.', 'Â-013', 'Â-02', 'Â-07', 'Â-110', 'Â-110à', 'Â-201', 'Â-202', 'Â-211', 'Â-214', 'Â-301', 'Â-302', 'Â-304', 'Â-311', 'Ã-010', 'Ã-04', 'Ã-09', 'Ã-101', 'Ã-114', 'Ã-207', 'Ã-208', 'Ã-215', 'Ã-303', 'Ã-305', 'Ã-306', 'Ã-àìô.', 'Ä-100', 'Ä-101', 'Ä-102', 'Ä-120', 'Ä-200', 'Ä-àìô.', 'Å-012', 'Å-06', 'Å-102à', 'Å-122', 'Å-202', 'Å-215à', 'Å-220', 'Å-301', 'Å-302', 'Å-304', 'Å-308', 'Å-309', 'Å-312', 'Å-318', 'Å-319', 'Å-320', 'Å-325', 'Æ-011', 'Æ-017', 'Æ-019', 'Æ-03', 'Æ-06', 'Æ-06à', 'Æ-08', 'Æ-103', 'Æ-109', 'Æ-113', 'Æ-114', 'Æ-117', 'Æ-119', 'Æ-209', 'Æ-211', 'Æ-213', 'Æ-217', 'Æ-307', 'Æ-311', 'Æ-312', 'Æ-316', 'Æ-319', 'Æ-321', 'Æ-323', 'Æ-àìô.', 'È-01', 'È-023', 'È-03', 'È-123', 'È-305', 'È-307', 'È-307à', 'È-309', 'È-311', 'È-315', 'È-317', 'È-319', 'Ê-011', 'Ê-013', 'Ê-018', 'Ê-026', 'Ê-104', 'Ê-106', 'Ê-122', 'Ê-207', 'Ê-214', 'Ê-222', 'Ê-224', 'Ê-226', 'Ê-301', 'Ê-302', 'Ê-303', 'Ê-305', 'Ê-311', 'Ê-313', 'Ê-315', 'Ê-315à', 'Ê-317')
and aud.obozn not like 'ÆÄ%'
and aud.obozn not like 'ÈÀÇ%'
and aud.obozn not like 'ÈíÑè%'
and aud.obozn not like 'ÈðêÝ%'
and aud.obozn not like 'ÒÎÌÑ%'
and aud.obozn not like 'ÒÏ%'
and aud.obozn not like 'ÓÈË%'
and aud.obozn not like 'Ó÷åá%'
and aud.obozn not like 'õîç%'
and aud.obozn not like 'ÑÌÈ%'
ORDER BY isnull(oc.h, 0) + isnull(wish.h, 0), aud.obozn


SELECT (sum(isnull(oc.h, 0) + isnull(wish.h, 0)) + 232) / count(*), count(*), sum(isnull(oc.h, 0) + isnull(wish.h, 0)) 
FROM auditories aud
 LEFT JOIN (
	 SELECT a.id_60 as id, a.obozn, sum(
		case when everyweek = 2
		then 2
		else 1 
		end	
	) as h
	FROM raspis r
	 LEFT JOIN raspnagr rn ON rn.id_51 = r.raspnagr
	 LEFT JOIN auditories a ON a.id_60 = r.aud
	GROUP BY a.obozn, a.id_60
) oc ON oc.id = aud.id_60
 LEFT JOIN (
	SELECT id, obozn, SUM(case when everyweek = 0 then t * 6 * dayofweek else t * dayofweek end) as h
	FROM (
		SELECT CASE WHEN parasps like '%1%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%2%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%3%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%4%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%5%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%6%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%7%' THEN 1 ELSE 0 END +
			CASE WHEN parasps like '%8%' THEN 1 ELSE 0 END as t, everyweek, 
			case when dayofweek > 0 then 1 else 2 end as dayofweek, a.obozn as obozn, id_60 as id
		FROM wishaudd w
		 LEFT JOIN auditories a ON a.id_60 = w.aud
	) t
	GROUP BY id, obozn
) wish ON wish.id = aud.id_60
WHERE (oc.h is not NULL or wish.h is not NULL)
and rtrim(aud.obozn) in ('À-01', 'Á-04', 'Á-100', 'Á-103', 'Á-121', 'Á-303', 'Á-305', 'Á-306', 'Á-307', 'Á-310', 'Á-àìô.', 'Â-013', 'Â-02', 'Â-07', 'Â-110', 'Â-110à', 'Â-201', 'Â-202', 'Â-211', 'Â-214', 'Â-301', 'Â-302', 'Â-304', 'Â-311', 'Ã-010', 'Ã-04', 'Ã-09', 'Ã-101', 'Ã-114', 'Ã-207', 'Ã-208', 'Ã-215', 'Ã-303', 'Ã-305', 'Ã-306', 'Ã-àìô.', 'Ä-100', 'Ä-101', 'Ä-102', 'Ä-120', 'Ä-200', 'Ä-àìô.', 'Å-012', 'Å-06', 'Å-102à', 'Å-122', 'Å-202', 'Å-215à', 'Å-220', 'Å-301', 'Å-302', 'Å-304', 'Å-308', 'Å-309', 'Å-312', 'Å-318', 'Å-319', 'Å-320', 'Å-325', 'Æ-011', 'Æ-017', 'Æ-019', 'Æ-03', 'Æ-06', 'Æ-06à', 'Æ-08', 'Æ-103', 'Æ-109', 'Æ-113', 'Æ-114', 'Æ-117', 'Æ-119', 'Æ-209', 'Æ-211', 'Æ-213', 'Æ-217', 'Æ-307', 'Æ-311', 'Æ-312', 'Æ-316', 'Æ-319', 'Æ-321', 'Æ-323', 'Æ-àìô.', 'È-01', 'È-023', 'È-03', 'È-123', 'È-305', 'È-307', 'È-307à', 'È-309', 'È-311', 'È-315', 'È-317', 'È-319', 'Ê-011', 'Ê-013', 'Ê-018', 'Ê-026', 'Ê-104', 'Ê-106', 'Ê-122', 'Ê-207', 'Ê-214', 'Ê-222', 'Ê-224', 'Ê-226', 'Ê-301', 'Ê-302', 'Ê-303', 'Ê-305', 'Ê-311', 'Ê-313', 'Ê-315', 'Ê-315à', 'Ê-317')
and aud.obozn not like 'ÆÄ%'
and aud.obozn not like 'ÈÀÇ%'
and aud.obozn not like 'ÈíÑè%'
and aud.obozn not like 'ÈðêÝ%'
and aud.obozn not like 'ÒÎÌÑ%'
and aud.obozn not like 'ÒÏ%'
and aud.obozn not like 'ÓÈË%'
and aud.obozn not like 'Ó÷åá%'
and aud.obozn not like 'õîç%'
and aud.obozn not like 'ÑÌÈ%'
--ORDER BY aud.obozn
