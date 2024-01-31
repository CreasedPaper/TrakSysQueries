DECLARE @LineID int = 7;


SELECT m.[ID]
, m.[Name] [DisplayName]
, m.[AltName]
, m.[Description]
, m.[ProductCode]
, m.[ID] [Value]
, m.[Name] + ' [ ' + m.[ProductCode] + ' ]' [DisplayName]
, s.AreaID [Value]
, a.ParentAreaID
, m.*
, j.*
, s.*
, a.*
FROM dbo.[tProduct] m
 INNER JOIN dbo.[tProductSet] j ON j.[ID] = m.ProductSetID 
 INNER JOIN dbo.tSystem s ON s.ProductSetID = j.ID
 INNER JOIN dbo.tArea a on s.AreaID = a.ID
WHERE a.ParentAreaID = 2 
AND (
	(@LineID = 2)
	OR
	(@LineID != 2 AND s.AreaID = @LineID)
	)
--(m.[ProductSetID] = -1) AND 
--(m.[VersionState] = 2) 
--AND 
--(j.[SiteID] IN (-1, 1))
ORDER BY j.[SiteID] DESC, m.[Name]