SELECT *
FROM groups
WHERE obozn like '%М-%'
  and obozn not like 'СДМ-%'
  and obozn not like 'ГМ-%'
  and obozn not like 'СМ-%'


UPDATE groups
SET fac = -fac
WHERE obozn like '%М-%'
  and obozn not like 'СДМ-%'
  and obozn not like 'ГМ-%'
  and obozn not like 'СМ-%'