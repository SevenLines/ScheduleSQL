/*
--Áåç äèñïåò÷åðîâ
SELECT DISTINCT rtrim(va.aobozn)
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
-- LEFT JOIN vacfac vf ON vf.id_5 = vf.
WHERE kk.id_1 not in (
 SELECT DISTINCT objid
 FROM ownres
) and rtrim(va.aobozn) not like '%Ç'
and rtrim(va.aobozn) not like		 '%ÇÑ'
and left(va.aobozn, 1) != 'ô' COLLATE Cyrillic_General_CS_AS
ORDER BY 1 

SELECT *
FROM vacdisp
*/

DELETE FROM ownres

INSERT INTO ownres(ownerid, obj, objid, dayofweek, parasps, everyweek, dbeg, days)
--SELECT objid, count(*)
--FROM (
SELECT 13 as ownerid, 3 as obj, kk.id_1 as objid, 0 as dayofweek, 'âñå ïàðû' as parasps, 0 as everyweek, 0 as dbeg, 366 as days 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _Êèáåðíåòèê
WHERE va.aobozn in ('ÈÍÑ', 'ÀÑÓÁ', 'ÈÑÒÁ', 'ÈÑÒÁÏ', 'ÈÒÁ', 'ÝÂÌÁ', 'ÈÑÁ', 'ÈÑÁÏ', 'ÈÑÌÁ', 'ÈÑÌÁ.')
UNION
SELECT 32, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                         
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã. _Êèáåðíåòèê
WHERE va.aobozn in ('ÈÍÑì', 'ÈÑÒÌ', 'ÊÑÌ', 'ÝÂÌÌ', 'ÈÒÒÌ') 
UNION
SELECT 21, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                          
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _âå÷åðíèêè 
WHERE va.aobozn in ('ÀÂ', 'ÀÐÁÂ', 'ÊÒÁÂ', 'ÎÀÏÂ', 'ÐÄÁÂ', 'ÒÂÁÂ', 'ÒÂÂ', 'ÒÒÁÂ', 'ÝÓÍÁÂ', 'ÝÓÍÂ', 'ÞÐÁÂ', 'ÞÐÃáâ', 'ÏÎáâ')
UNION
SELECT 12, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                          
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('ÑÐÁ', 'ÑÖÁ', 'ÏÑÁ', 'ÐÊÁ', 'ÆÐÁ') -- _ÑÌÈ 
UNION
SELECT 16, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                       
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('ÄÈ', 'ÄÈÁ', 'ÄÏÈÁ') -- _Äèçàéí 
UNION
SELECT 24, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                            
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('ÈÈÁ', 'ÌÄ', 'ÌÄÈ') -- _Èñêóññòâîâåä  
UNION
SELECT 20, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                        
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('ÈÁÁ', 'ÈÔÁ', 'ÍÌÁ', 'ÐÄÁ') -- _ÔÒÈ 
UNION
SELECT 38, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                       
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('ÐÒÓÌ', 'ÎÒÌ', 'ÌÍÒÌ') -- Ìã.ÔÒÈ
UNION
SELECT 11, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                        
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _Õèìèê
WHERE va.aobozn in ('ÒÏÁ', 'ÌÖÁ', 'ÀÒÁÏ', 'ÀÒÏÁ', 'ÕÒÁ', 'ÕÒÁÏ', 'ÕÒÎÁ', 'ÕÒÎÁÏ', 'ÕÒÒÁ', 'ÕÒÒáï')
UNION
SELECT 30, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                   
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã.Õèìèê 
WHERE va.aobozn in ('ÀÇÎÑÌ', 'ÁÏÌ', 'ÌÖÌ', 'ÎÕÏÌ', 'ÏÈÌ', 'ÁÈÌ', 'ÕÒÌ', 'ÏÑÓÌ')
UNION
SELECT 14, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn  -- _Ýíåðãåòèê  
WHERE va.aobozn in ('ÏÒÝÁ', 'ÒÝÁ', 'ÒÝÁÏ', 'ÝÀÏÁ', 'ÝÏÁ', 'ÝÑÁ', 'ÝÑÒÁ', 'ÝÝÁ', 'ÝÝÁÏ', 'ÝËÒáï')
UNION
SELECT 33, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn  -- Ìã.Ýíåðãåòèê 
WHERE va.aobozn in ('ÝÍÃì', 'ÖÝì', 'ÓÝÑÌ', 'ÀÑÓÌ', 'ÂÝÌ', 'ÈÝÌ', 'ÊÒÝÌ', 'ÍÂÝÌ', 'ÏÐÝÌ', 'ÑÝÌ', 'ÔÝÊÒÌ', 'ÝÏÌ', 'ÝÑÌ', 'ÝÑÒÌ', 'ÝÒÌ', 'ÝÓÌ', 'ÌÎÒÓÌ')
UNION
SELECT 18, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _Áèçíåñ
WHERE va.aobozn in ('ÝÒÝÊá', 'ÏÄá', 'ÌÁá', 'ÃÌÔá', 'ÏÎá', 'ÈÌÁ', 'ÈÍÁ', 'ÌÏÁ', 'ÌÝÁ', 'ÏÌÁ', 'ÓÊÁ', 'ÓÊÁÏ', 'ÓÏÁ', 'ÓÔÏÁ', 'ÔÊÁ', 'ÝÏÎÁ', 'ÝÓÁ', 'ÝÓÁÓ', 'ÞÐÁ', 'ÞÐÃá', 'ÞÐÓá')
UNION
SELECT 36, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã.Áèçíåñ
WHERE va.aobozn in ('ÈÈì', 'ÁÁÌÇ', 'ÈÍÈÌ', 'ÌÎÈÌ', 'ÌÝÌ', 'ÌÝÌÇ', 'ÓÏÊÌ', 'ÔÌ', 'ÏÑì', 'ÔÌÇ', 'ÓÑÌ')
UNION
SELECT 17, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _Ãîðíûé 
WHERE va.aobozn in ('ÁÆÒÁ', 'ÁÒÏÁ', 'ÃÀ', 'ÃÃ', 'ÃÄ', 'ÃÌ', 'ÃÎ', 'ÃÏ', 'ÈÃ', 'ÎÎÑÁ', 'ÎÏ', 'ÒÁÁ')
UNION
SELECT 35, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã.Ãîðíûé 
WHERE va.aobozn in ('ÁÆÒÌ', 'ÏÁÌ', 'ÏÎÌ', 'ÝÊÎÌ', 'ÝÊÎÌÇ')
UNION
SELECT 8, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _ÔÃÃÃ 
WHERE va.aobozn in ('ÃÈÑ', 'ÍÄÁ', 'ÍÄÄÁ', 'ÏÃ', 'ÒÃ', 'ÒÕÁ', 'ÐÃ', 'ÐÌ', 'ÐÔ')
UNION
SELECT 9, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _Àðõèòåêòîð 
WHERE va.aobozn in ('À', 'ÀÐÁ', 'ÃÐÁ', 'ÄÀÑ', 'ÄÑÁ', 'ÐÐÁ', 'ÐÐÁÏ')
UNION
SELECT 28, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã.Àðõèòåêòîð
WHERE va.aobozn in ('ÀÈÌ', 'ÀÓÑÌ', 'ÃÈÐÌ', 'ÃÐÌ', 'ÃÐÌÂ')
UNION
SELECT 10, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _Ñòðîèòåëü 
WHERE va.aobozn in ('ÓÑÒá', 'ÊÍÁÈÍÄ', 'ÑÎÁÏ', 'ÊÍá', 'ÀÄÁ', 'ÝÝÇáï', 'ÂÂÁ', 'ÃÑÕÁ', 'ÃÑÕÁÏ', 'ÏÃÑÁ', 'ÏÃÑÁÏ', 'ÏÇ', 'ÑÎÁ', 'ÑÎÏÇÁ', 'ÑÒÁ', 'ÑÓÇ', 'ÒÂÁ', 'ÝÓÍÁ')
UNION
SELECT 29, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã.Ñòðîèòåëü
WHERE va.aobozn in ('ÒÈÌì', 'ÒÃÂì', 'ÎÒÊì', 'ÍÒÑì', 'ÀÄÌ', 'ÂÂÌ', 'ÃÑÕÌ', 'ÏÃÑÌ', 'ÑÑÝÌ', 'ÒÂÌ', 'ÝÂÁÌ', 'ÝÈÏÌ', 'ÓÑÒÌ')
UNION
SELECT 7, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _Ìàøèíîñòðîèòåëü
WHERE va.aobozn in ('ÀÒÌá', 'ÌÈÐá', 'ÀÌÁ', 'ÀÒÁ', 'ÊÒÁ', 'ÌÌÁ', 'ÌÐÁ', 'ÌÑÊÁ')
UNION
SELECT 26, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã.Ìàø-ñòð 
WHERE va.aobozn in ('ÈÒÏÌ', 'ÎÓÎÌ', 'ÒÌÌ', 'ÂÏÎÌ', 'ÏÊÌ', 'ÒÀÑÌ')
UNION
SELECT 41, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _Òðàíñïîðò  
WHERE va.aobozn in ('ÀÑá', 'ÀÀá', 'ÝÒÁÏ', 'ËÈÌÁ', 'ÍÊÁ', 'ÑÄÌ', 'ÑÌ', 'ÒÒÁ', 'ÓÒÑÁ', 'ÝË', 'ÝËÁ', 'ÝËÁÏ', 'ÝÒÁ', 'ÌÒÁÏ', 'ÌÒÁ')
UNION
SELECT 27, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã.ÔÃÃÃ 
WHERE va.aobozn in ('ÃÍÄÌ', 'ÃÍÄì')
UNION
SELECT 42, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã.Òðàíñïîðò 
WHERE va.aobozn in ('ËÌÁÌ', 'ËÌÁÌÇ', 'ÒÝÀÌ', 'ÑÏÌ', 'ÌÒÌ')
UNION
SELECT 44, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366 -- Àñïèðàíò
FROM kontkurs kk
WHERE fac = 664
UNION
SELECT 45, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366 -- EasySchool
FROM kontkurs kk
WHERE obozn like 'ES-%'
UNION
SELECT 46, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Brix 
WHERE va.aobozn in ('ÈÝá', 'ÌÄÁá', 'ÝÈÁ')
UNION
SELECT 47, 3, kk.id_1, 0, 'âñå ïàðû', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Ìã. Brix 
WHERE va.aobozn in ('ÂÝÀÌ', 'ÌÂÀì')
--) t
--GROUP BY objid
--HAVING count(*) > 1



