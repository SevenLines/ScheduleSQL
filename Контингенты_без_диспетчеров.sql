SELECT rtrim(va.aobozn), kk.*
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON  kk.aobozn = va.id_6
WHERE id_1 in (
SELECT *
FROM (
	SELECT DISTINCT case rn.kont when 0 then kl.kont else rn.kont end as kont_id
	FROM raspnagr rn
	 LEFT JOIN kontlist kl  ON rn.op = kl.op
	WHERE sem = 1 ) t
	WHERE t.kont_id not in (
		SELECT DISTINCT objid
		FROM ownres
	)
)
and rtrim(va.aobozn) not like '%г'
and rtrim(va.aobozn) not like '%гC'
and rtrim(kk.obozn) not like '%(ся,н)%'
