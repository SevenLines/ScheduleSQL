SELECT DISTINCT va.aobozn
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE id_1 in (
	SELECT objid
	FROM ownres
	WHERE ownerid in (
		SELECT id_75
		FROM vacdisp
		WHERE disp like '%Ã„.%')
		)
ORDER BY va.aobozn

		
