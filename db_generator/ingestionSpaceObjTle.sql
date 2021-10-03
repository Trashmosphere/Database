CREATE DEFINER=`root`@`%` PROCEDURE `ingestTle`()
BEGIN
INSERT INTO spaceJunk.spaceObjectTle(CalendarID
									, LineNumber
                                    , NoradCatID
                                    , InternationalDesignator
                                    , Epoch
                                    , Motion
                                    , MeanMotion
                                    , RadPressureCoef
                                    , Element)

SELECT 	CASE
			WHEN b.LineNumber = 1 
				THEN (SELECT ID
						FROM calendar 
                        WHERE `Day` = 1 
							AND `Year` = IF(LEFT(b.Epoch, 2) > 21, CONCAT('19', LEFT(b.Epoch, 2)), CONCAT('20', LEFT(b.Epoch, 2))) 
							AND  `Month` = (CASE 
													WHEN LENGTH((LEFT(b.Epoch,LOCATE('.',b.Epoch) - 1))) = 5
														THEN FLOOR(RIGHT((LEFT(b.Epoch,LOCATE('.',b.Epoch) - 1)),3)/30)
													ELSE
														FLOOR(RIGHT((LEFT(b.Epoch,LOCATE('.',b.Epoch) - 1)),2)/30)
											END )
                                                                        
					) 
				ELSE b.Epoch
                END calendarID
		,b.LineNumber
        , if(RIGHT(b.NoradCatID,1) = 'u', SUBSTRING(b.NoradCatID,     1,    CHAR_LENGTH(b.NoradCatID) - 1), b.NoradCatID)
        , b.InternationalDesignator
        , b.Epoch
        , b.Motion
        , b.MeanMotion
        , b.RadPressureCoef
        , if(b.Element = 0, b.last, b.Element)
FROM spaceJunk.bufferTable b

;
END