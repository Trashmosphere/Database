CREATE DEFINER=`root`@`%` PROCEDURE `ingestion`()
BEGIN


INSERT INTO `current` (currentID)
SELECT DISTINCT b.`current`
FROM buffertable b
LEFT JOIN spaceJunk.current a ON a.CurrentID = b.current
WHERE a.currentID IS NULL;

INSERT INTO noradCat (NoradCatID)
SELECT DISTINCT b.norad_cat_id
FROM buffertable b
LEFT JOIN spaceJunk.noradCat a ON a.NoradCatID = b.norad_cat_id
WHERE a.NoradCatID IS NULL;

INSERT INTO size (Size)
SELECT DISTINCT b.RCS_SIZE
FROM buffertable b
LEFT JOIN spaceJunk.size a ON a.Size = b.RCS_SIZE
WHERE a.Size IS NULL;

INSERT INTO objectType (Type)
SELECT DISTINCT b.OBJECT_TYPE
FROM buffertable b
LEFT JOIN spaceJunk.objectType a ON a.Type = b.OBJECT_TYPE
WHERE a.Type IS NULL;

INSERT INTO `spaceJunk`.`spaceObjectsDetails`
(
`Intldes`,
`NoradCatID`,
`ObjectTypeID`,
`SatName`,
`StateID`,
`LaunchCalendarID`,
`Site`,
`DecayCalendarID`,
`Period`,
`Inclination`,
`Apogee`,
`Perigee`,
`Comment`,
`CommentCode`,
`RCSVALUE`,
`SizeID`,
`File`,
`LaunchYear`,
`LaunchNum`,
`LaunchPiece`,
`CurrentID`)
SELECT b.INTLDES
		, nc.ID 
        , ot.ID 
        , b.SATNAME
        , st.ID
        , c.ID 
        , b.SITE
        , c1.ID  
        , b.PERIOD
        , b.INCLINATION
        , b.APOGEE
        , b.PERIGEE
        , b.COMMENT
        , b.COMMENTCODE
        , b.RCSVALUE
        , s.ID 
        , b.FILE
        , b.LAUNCH_YEAR
        , b.LAUNCH_NUM
        , b.LAUNCH_PIECE
        , ct.ID 
FROM buffertable b
INNER JOIN noradCat nc ON nc.NoradCatID = b.norad_cat_id
INNER JOIN objectType ot ON ot.Type = b.OBJECT_TYPE
INNER JOIN states st ON st.stateCode = b.COUNTRY
INNER JOIN calendar c ON STR_TO_DATE(CONCAT(c.Day, ',', c.Month, ',', c.Year), '%d,%m,%Y' )= b.LAUNCH
LEFT JOIN calendar c1 ON STR_TO_DATE(CONCAT(c1.Day, ',', c1.Month, ',', c1.Year) ,'%d,%m,%Y')= b.DECAY
INNER JOIN `current` ct ON ct.currentID = b.CURRENT
INNER JOIN size s ON s.Size = b.RCS_SIZE;

DELETE FROM buffertable;
END