SELECT left(preds, 46)
FROM vacpred
GROUP BY left(preds, 46)
HAVING COUNT(*) > 1
ORDER BY 1