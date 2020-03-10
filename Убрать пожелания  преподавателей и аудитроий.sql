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

DELETE FROM wishaudd
WHERE id_62 not in (
	SELECT id_62
	FROM wishaudd p
		JOIN dbo.classifier c ON c.id_ = p.wishview and class_id = 3
	WHERE wishview in (18, 16, 15)
)

DELETE FROM wishauddpara
WHERE wish not in (
	SELECT id_62
	FROM wishaudd p
		JOIN dbo.classifier c ON c.id_ = p.wishview and class_id = 3
	WHERE wishview in (18, 16, 15)
)

DELETE FROM dbo.wishkontd
WHERE id_69 not in (
	SELECT id_69
	FROM wishkontd p
		JOIN dbo.classifier c ON c.id_ = p.wishview and class_id = 3
	WHERE wishview in (18, 16, 15)
)

DELETE FROM dbo.wishkontdpara
WHERE wish not in (
	SELECT id_69
	FROM wishkontd p
		JOIN dbo.classifier c ON c.id_ = p.wishview and class_id = 3
	WHERE wishview in (18, 16, 15)
)

SELECT *
FROM classifier
WHERE class_id = 3