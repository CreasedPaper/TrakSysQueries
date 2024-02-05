DECLARE @SDT datetimeoffset = '2024-01-09T00:00:00.000-05:00';
DECLARE @EDT datetimeoffset = '2024-01-30T23:59:59.000-05:00';
DECLARE @LineID int = 2;
DECLARE @ShiftID int = -1;
DECLARE @ProductID int = -1;
DECLARE @JobID int = -1;

SELECT m.ProductName [GroupValue]
, m.ProductName [GroupLabel]
, 1 [SeriesValue] 
, 1 [SeriesLabel] 
, 1 [SeriesDisplayOrder] 
, SUM(m.[DurationSeconds]) / 60.0 [Value] 
, SUM(m.[DurationSeconds]) / 60.0 [TotalMinutes] 
, SUM(m.[DurationSeconds]) / 3600.0 [TotalHours] 
, (SUM(m.[DurationSeconds]) / 1.0) / SUM(m.[EventCount]) [AverageSeconds] 
, (SUM(m.[DurationSeconds]) / 60.0) / SUM(m.[EventCount]) [AverageMinutes] 
, (SUM(m.[DurationSeconds]) / 3600.0) / SUM(m.[EventCount]) [AverageHours] 

, SUM(m.[DurationSeconds]) [TotalSeconds], COUNT(m.[EventCount]) [TotalCount]
FROM dbo.[viewEvent] m
 INNER JOIN dbo.[tSystem] j ON j.[ID] = m.SystemID
 INNER JOIN tEventDefinition ed ON ed.ID = m.EventDefinitionID
 INNER JOIN tEventDefinition ted ON ted.ID = ed.TemplateParentID
WHERE 
(m.[Date] BETWEEN @SDT AND @EDT) AND 
	(
		(@LineID = 2 AND (j.[AreaID] IN (SELECT a0.ID FROM tArea a0 WHERE a0.ParentAreaID = 2))) 
		or
		(@LineID IN (SELECT a0.ID FROM tArea a0 WHERE a0.ParentAreaID = 2) AND (j.[AreaID] = @LineID))
	) AND
--((@LineID = 2) OR (j.[AreaID] = @LineID)) AND
(m.[EventIsolationType] = 1) AND
	(
	(@ShiftID = -1)
	OR
	((@ShiftID = 1 OR @ShiftID = 2 OR @ShiftID = 3) AND ShiftID = @ShiftID)
	)
AND 
	(
		(@ProductID = -1)
	OR
		(m.ProductID = @ProductID)
	)
AND 
	(
		(@JobID = -1)
	OR
		(@JobID != -1 AND m.JobID = @JobID)
	)

GROUP BY
 m.ProductName, m.[SiteID]
ORDER BY m.[SiteID] DESC, [Value] DESC
