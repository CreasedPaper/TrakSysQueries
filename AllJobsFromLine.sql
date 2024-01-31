DECLARE @LineID int = 6;

SELECT 
m.[JobID] [ID], j.[Name], j1.[Name] [ProductName], j1.[ProductCode], m.[JobID] [Value], j.[Name] [DisplayName]
, MIN(m.[StartDateTime]) [StartDateTime], MIN(m.[Date]) [Date]
FROM dbo.[tJobSystemActual] m
 INNER JOIN dbo.[tJob] j ON j.[ID] = m.JobID 
 LEFT OUTER JOIN dbo.[tProduct] j1 ON j1.[ID] = j.ProductID 
 INNER JOIN dbo.[tSystem] j2 ON j2.[ID] = m.SystemID 
 INNER JOIN dbo.[tArea] j3 ON j3.[ID] = j2.AreaID 
WHERE 
(m.[Date] BETWEEN {ts '2024-01-29 00:00:00'} AND {ts '2024-01-31 00:00:00'})
AND 
	(
		(@LineID = 2 AND j3.ParentAreaID = @LineID)
	OR
		(@LineID != 2 AND j3.ID = @LineID)
	)
--AND 
--(m.[SystemID] = -1) AND j.[ProductID] IS NULL AND 
--(j3.[SiteID] IN (-1, 1))
GROUP BY
m.[JobID], j.[Name], j1.[Name], j1.[ProductCode], j3.[SiteID]
ORDER BY j3.[SiteID] DESC, m.[JobID]