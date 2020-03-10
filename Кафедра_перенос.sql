DECLARE @old_kaf int
DECLARE @new_kaf int

SET @old_kaf = 1
SET @new_kaf = 1

UPDATE potoklist
SET kaf = @new_kaf
WHERE kaf = @old_kaf

UPDATE raspnagr
SET kaf = @new_kaf
WHERE kaf = @old_kaf

UPDATE rnprepods
SET kaf = @new_kaf
WHERE kaf = @old_kaf

