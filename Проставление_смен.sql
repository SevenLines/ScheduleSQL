UPDATE kontkurs
SET smenao = 
	CASE
		WHEN dsp.disp not like '��%' and dsp.id_75 != 44 THEN
			CASE 
				WHEN kk.fac in (683, 679, 669, 671, 1, 4, 10) THEN 
					CASE 
						WHEN rtrim(vao.aobozn) in ('���', '��') THEN 0 
						WHEN rtrim(vao.aobozn) in ('���', '�����', '�����', '����', '����', '���', '���', '���', '���', '���', '����') THEN 1 
						ELSE 2 - kurs % 2 
					END
				WHEN kk.fac = 144 THEN  2 - kurs % 2
					/*CASE 
						WHEN rtrim(vao.aobozn) in ('���', '���', '���', '���', '���') THEN 1
						ELSE 2 - kurs % 2
					END*/
				WHEN kk.fac = 143 THEN  3
				ELSE 0
			END
		ELSE 0
	END
FROM kontkurs kk
	LEFT JOIN vacfac fc ON kk.fac = fc.id_5
	LEFT JOIN vacaobozn vao ON vao.id_6 = kk.aobozn
	LEFT JOIN ownres ow ON ow.objid = kk.id_1
	LEFT JOIN vacdisp dsp ON dsp.id_75 = ow.ownerid
	
UPDATE kontkurs
SET smenav = smenao

/*	
SELECT *
FROM kontkurs

SELECT *
FROM vacfac
*/