
DECLARE @SystemID int = 11;
DECLARE @ScheduleID int = 1;
DECLARE @MicrostopThresh int = 10;
DECLARE @AreaID int = 6

select COUNT(ShowAckFlag) [unAckCount] from (
SELECT 
m.[EventID], m.[StartDateTimeOffset], m.[EndDateTimeOffset], m.[DurationSeconds]
, m.[EventImpact], j1.[Name] [AreaName], m.[SystemName], m.[SubSystemName]
, m.[EventDefinitionName], m.[EventCategoryName], j2.[Name] [EventCodeName]
, m.[ProductName], m.[ProductCode], m.[JobName]
, m.[OeeEventType], m.[OeeEventTypeColor], ed.[Color] as [EventDefinitionColor]
, j3.[Notes]
, j3.[State]
, CASE m.[OeeEventType] WHEN 0 then N'N/A' WHEN 1 then N'Performance Loss' WHEN 2 then N'Availability Loss' WHEN 3 then N'System Not Scheduled' WHEN 4 then N'Legal Loss' ELSE NULL END [OeeEventTypeName] 
, (SELECT COUNT(ID) FROM tEventSub WHERE EventID = m.[EventID]) [EventSubCount] 
, (CASE WHEN j3.[State] = 0 THEN 1 ELSE 0 END) as [ShowAckFlag]

FROM dbo.[viewEvent] m
 INNER JOIN dbo.[tSystem] j ON j.[ID] = m.SystemID 
 INNER JOIN dbo.[tArea] j1 ON j1.[ID] = j.AreaID 
 LEFT OUTER JOIN dbo.[tEventCode] j2 ON j2.[ID] = m.EventCodeID 
 INNER JOIN dbo.[tEvent] j3 ON j3.[ID] = m.EventID 
 INNER JOIN [tEventDefinition] ed ON ed.ID = m.EventDefinitionID
WHERE 
(m.[ShiftHistoryID] = (select top 1 ID from tShiftHistory 
where scheduleID = @ScheduleID order by id desc)) AND 
(j.[AreaID] = @AreaID) AND
(m.[DurationSeconds] >= @MicrostopThresh) AND
(m.[EventIsolationType] = 1) AND 
(m.[SiteID] IN (-1, 1))
) as t0 where ShowAckFlag = 1;