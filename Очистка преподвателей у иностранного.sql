UPDATE raspnagr
SET prep = 0
WHERE kaf in (216, 217) and prep !=0  and nt != 1 and kont in (
	SELECT objid
	FROM ownres
	WHERE ownerid in (
		SELECT id_75
		FROM vacdisp
		WHERE disp not like 'Ã„%' and id_75 not in (45, 46, 44)
	)
)
