DELETE
FROM wishauddpara
WHERE wish in (
	SELECT id_62
	FROM wishaudd
	WHERE parasps like '6; 7; 8;%'
)


DELETE 
FROM wishaudd
WHERE parasps like '6; 7; 8;%'