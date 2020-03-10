SELECT *
 INTO #rn
FROM SPR_POLITEX.dbo.raspnagr
WHERE id_51 in (
4230950,
4218428,
4231044,
4231046,
4231047,
4231048,
4231052,
4231053,
4231930,
4231057,
4231060,
4231928,
4230948
)

SET IDENTITY_INSERT potoklist ON
GO

DELETE FROM kontlist WHERE op in (SELECT op FROM #rn) and op not in (21300019, 21300013)
DELETE FROM potoklist WHERE op in (SELECT op FROM #rn) and op not in (21300019, 21300013)

INSERT INTO potoklist (id_8, op, pred, semestr, groups,pgroups, stud, oblek, obsem, oblab, konts, kaf, fobuch, fil, lek, sem, lab, dbeg, days, syear, fac, parentop, op_n)
SELECT id_8, op, pred, semestr, groups,pgroups, stud, oblek, obsem, oblab, konts, kaf, fobuch, fil, lek, sem, lab, dbeg, days, syear, fac, parentop, op_n
FROM SPR_POLITEX.dbo.potoklist
WHERE op in (SELECT op FROM #rn) and op not in (SELECT op FROM potoklist) and op not in (21300019, 21300013)

SET IDENTITY_INSERT potoklist OFF
GO

SET IDENTITY_INSERT raspnagr ON
GO


INSERT INTO raspnagr(id_51, kont, kontid, op, nt, sem, pred, kaf, fobuch, afobuch, nagrid, h, hy, dbeg, days, prep, aud, nagrtype, nagrprop, oldid, nagr_h, stud, editstud, rnprep, syear, u, prep_for_print)
SELECT id_51, kont, kontid, op, nt, sem, pred, kaf, fobuch, afobuch, nagrid, h, hy, dbeg, days, prep, aud, nagrtype, nagrprop, oldid, nagr_h, stud, editstud, rnprep, syear, u, prep_for_print
FROM #rn

SET IDENTITY_INSERT raspnagr OFF
GO

DROP TABLE #rn

--SET IDENTITY_INSERT potoklist OFF
/*SET IDENTITY_INSERT raspnagr OFF
GO*/

/*SELECT *
FROM potoklist
ORDER BY op DESC*/

