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
and rtrim(aud.obozn) in ('�-01', '�-04', '�-100', '�-103', '�-121', '�-303', '�-305', '�-306', '�-307', '�-310', '�-���.', '�-013', '�-02', '�-07', '�-110', '�-110�', '�-201', '�-202', '�-211', '�-214', '�-301', '�-302', '�-304', '�-311', '�-010', '�-04', '�-09', '�-101', '�-114', '�-207', '�-208', '�-215', '�-303', '�-305', '�-306', '�-���.', '�-100', '�-101', '�-102', '�-120', '�-200', '�-���.', '�-012', '�-06', '�-102�', '�-122', '�-202', '�-215�', '�-220', '�-301', '�-302', '�-304', '�-308', '�-309', '�-312', '�-318', '�-319', '�-320', '�-325', '�-011', '�-017', '�-019', '�-03', '�-06', '�-06�', '�-08', '�-103', '�-109', '�-113', '�-114', '�-117', '�-119', '�-209', '�-211', '�-213', '�-217', '�-307', '�-311', '�-312', '�-316', '�-319', '�-321', '�-323', '�-���.', '�-01', '�-023', '�-03', '�-123', '�-305', '�-307', '�-307�', '�-309', '�-311', '�-315', '�-317', '�-319', '�-011', '�-013', '�-018', '�-026', '�-104', '�-106', '�-122', '�-207', '�-214', '�-222', '�-224', '�-226', '�-301', '�-302', '�-303', '�-305', '�-311', '�-313', '�-315', '�-315�', '�-317')
and aud.obozn not like '��%'
and aud.obozn not like '���%'
and aud.obozn not like '����%'
and aud.obozn not like '����%'
and aud.obozn not like '����%'
and aud.obozn not like '��%'
and aud.obozn not like '���%'
and aud.obozn not like '����%'
and aud.obozn not like '���%'
and aud.obozn not like '���%'
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
and rtrim(aud.obozn) in ('�-01', '�-04', '�-100', '�-103', '�-121', '�-303', '�-305', '�-306', '�-307', '�-310', '�-���.', '�-013', '�-02', '�-07', '�-110', '�-110�', '�-201', '�-202', '�-211', '�-214', '�-301', '�-302', '�-304', '�-311', '�-010', '�-04', '�-09', '�-101', '�-114', '�-207', '�-208', '�-215', '�-303', '�-305', '�-306', '�-���.', '�-100', '�-101', '�-102', '�-120', '�-200', '�-���.', '�-012', '�-06', '�-102�', '�-122', '�-202', '�-215�', '�-220', '�-301', '�-302', '�-304', '�-308', '�-309', '�-312', '�-318', '�-319', '�-320', '�-325', '�-011', '�-017', '�-019', '�-03', '�-06', '�-06�', '�-08', '�-103', '�-109', '�-113', '�-114', '�-117', '�-119', '�-209', '�-211', '�-213', '�-217', '�-307', '�-311', '�-312', '�-316', '�-319', '�-321', '�-323', '�-���.', '�-01', '�-023', '�-03', '�-123', '�-305', '�-307', '�-307�', '�-309', '�-311', '�-315', '�-317', '�-319', '�-011', '�-013', '�-018', '�-026', '�-104', '�-106', '�-122', '�-207', '�-214', '�-222', '�-224', '�-226', '�-301', '�-302', '�-303', '�-305', '�-311', '�-313', '�-315', '�-315�', '�-317')
and aud.obozn not like '��%'
and aud.obozn not like '���%'
and aud.obozn not like '����%'
and aud.obozn not like '����%'
and aud.obozn not like '����%'
and aud.obozn not like '��%'
and aud.obozn not like '���%'
and aud.obozn not like '����%'
and aud.obozn not like '���%'
and aud.obozn not like '���%'
--ORDER BY aud.obozn
