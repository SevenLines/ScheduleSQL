UPDATE kk
SET smenao = 2
FROM kontkurs kk
WHERE id_1 in (
	SELECT objid
	FROM ownres
	WHERE ownerid in (
		SELECT id_75
		FROM vacdisp
		WHERE disp like '%ฬใ.%')) and obozn not like '%ระฬย%'
