/*
--��� �����������
SELECT DISTINCT rtrim(va.aobozn)
FROM kontkurs kk
 LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
-- LEFT JOIN vacfac vf ON vf.id_5 = vf.
WHERE kk.id_1 not in (
 SELECT DISTINCT objid
 FROM ownres
) and rtrim(va.aobozn) not like '%�'
and rtrim(va.aobozn) not like		 '%��'
and left(va.aobozn, 1) != '�' COLLATE Cyrillic_General_CS_AS
ORDER BY 1 

SELECT *
FROM vacdisp
*/

DELETE FROM ownres

INSERT INTO ownres(ownerid, obj, objid, dayofweek, parasps, everyweek, dbeg, days)
--SELECT objid, count(*)
--FROM (
SELECT 13 as ownerid, 3 as obj, kk.id_1 as objid, 0 as dayofweek, '��� ����' as parasps, 0 as everyweek, 0 as dbeg, 366 as days 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _����������
WHERE va.aobozn in ('���', '����', '����', '�����', '���', '����', '���', '����', '����', '����.')
UNION
SELECT 32, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                         
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��. _����������
WHERE va.aobozn in ('����', '����', '���', '����', '����') 
UNION
SELECT 21, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                          
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _��������� 
WHERE va.aobozn in ('��', '����', '����', '����', '����', '����', '���', '����', '�����', '����', '����', '�����', '����')
UNION
SELECT 12, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                          
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('���', '���', '���', '���', '���') -- _��� 
UNION
SELECT 16, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                       
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('��', '���', '����') -- _������ 
UNION
SELECT 24, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                            
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('���', '��', '���') -- _������������  
UNION
SELECT 20, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                        
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('���', '���', '���', '���') -- _��� 
UNION
SELECT 38, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                       
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn
WHERE va.aobozn in ('����', '���', '����') -- ��.���
UNION
SELECT 11, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                        
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _�����
WHERE va.aobozn in ('���', '���', '����', '����', '���', '����', '����', '�����', '����', '�����')
UNION
SELECT 30, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                   
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��.����� 
WHERE va.aobozn in ('�����', '���', '���', '����', '���', '���', '���', '����')
UNION
SELECT 14, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn  -- _���������  
WHERE va.aobozn in ('����', '���', '����', '����', '���', '���', '����', '���', '����', '�����')
UNION
SELECT 33, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn  -- ��.��������� 
WHERE va.aobozn in ('����', '���', '����', '����', '���', '���', '����', '����', '����', '���', '�����', '���', '���', '����', '���', '���', '�����')
UNION
SELECT 18, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _������
WHERE va.aobozn in ('�����', '���', '���', '����', '���', '���', '���', '���', '���', '���', '���', '����', '���', '����', '���', '����', '���', '����', '���', '����', '����')
UNION
SELECT 36, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��.������
WHERE va.aobozn in ('���', '����', '����', '����', '���', '����', '����', '��', '���', '���', '���')
UNION
SELECT 17, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _������ 
WHERE va.aobozn in ('����', '����', '��', '��', '��', '��', '��', '��', '��', '����', '��', '���')
UNION
SELECT 35, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��.������ 
WHERE va.aobozn in ('����', '���', '���', '����', '�����')
UNION
SELECT 8, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _���� 
WHERE va.aobozn in ('���', '���', '����', '��', '��', '���', '��', '��', '��')
UNION
SELECT 9, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _���������� 
WHERE va.aobozn in ('�', '���', '���', '���', '���', '���', '����')
UNION
SELECT 28, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��.����������
WHERE va.aobozn in ('���', '����', '����', '���', '����')
UNION
SELECT 10, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _��������� 
WHERE va.aobozn in ('����', '������', '����', '���', '���', '�����', '���', '����', '�����', '����', '�����', '��', '���', '�����', '���', '���', '���', '����')
UNION
SELECT 29, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��.���������
WHERE va.aobozn in ('����', '����', '����', '����', '���', '���', '����', '����', '����', '���', '����', '����', '����')
UNION
SELECT 7, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _���������������
WHERE va.aobozn in ('����', '����', '���', '���', '���', '���', '���', '����')
UNION
SELECT 26, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��.���-��� 
WHERE va.aobozn in ('����', '����', '���', '����', '���', '����')
UNION
SELECT 41, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- _���������  
WHERE va.aobozn in ('���', '���', '����', '����', '���', '���', '��', '���', '����', '��', '���', '����', '���', '����', '���')
UNION
SELECT 27, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��.���� 
WHERE va.aobozn in ('����', '����')
UNION
SELECT 42, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��.��������� 
WHERE va.aobozn in ('����', '�����', '����', '���', '���')
UNION
SELECT 44, 3, kk.id_1, 0, '��� ����', 0, 0, 366 -- ��������
FROM kontkurs kk
WHERE fac = 664
UNION
SELECT 45, 3, kk.id_1, 0, '��� ����', 0, 0, 366 -- EasySchool
FROM kontkurs kk
WHERE obozn like 'ES-%'
UNION
SELECT 46, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- Brix 
WHERE va.aobozn in ('���', '����', '���')
UNION
SELECT 47, 3, kk.id_1, 0, '��� ����', 0, 0, 366                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
FROM kontkurs kk
LEFT JOIN vacaobozn va ON va.id_6 = kk.aobozn -- ��. Brix 
WHERE va.aobozn in ('����', '����')
--) t
--GROUP BY objid
--HAVING count(*) > 1



