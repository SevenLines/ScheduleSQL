DELETE FROM wishprepd
WHERE id_64 not in (
	SELECT id_64
	FROM wishprepd p
		JOIN dbo.classifier c ON c.id_ = p.wishview and class_id = 3
	WHERE wishview in (18, 16, 15)
)

DELETE FROM wishprepdpara
WHERE wish not in (
	SELECT id_64
	FROM wishprepd p
		JOIN dbo.classifier c ON c.id_ = p.wishview and class_id = 3
	WHERE wishview in (18, 16, 15)
)