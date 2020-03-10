UPDATE raspnagr
SET nagrtype = 0
WHERE kont in (
	SELECT id_1
	FROM kontkurs kk
	WHERE kk.id_1 in (
	 SELECT DISTINCT objid
	 FROM ownres
	 WHERE ownerid = 44
	) and obozn like 'à%ç-%'
) or op in (
	SELECT DISTINCT op
	FROM kontlist
	WHERE kont in (
		SELECT id_1
		FROM kontkurs kk
		WHERE kk.id_1 in (
		 SELECT DISTINCT objid
		 FROM ownres
		 WHERE ownerid = 44
		) and obozn like 'à%ç-%'
	)
)