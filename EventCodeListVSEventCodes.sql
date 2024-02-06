--DECLARE @EventCodesList NVARCHAR(MAX) = (SELECT vcps.[SystemCustomProperties.EventCodeList] FROM viewCustomPropertySYstem vcps) -- WHERE ID = @SystemID

--Select [Name], Code from tEventCode 
----INNER JOIN dbo.tSystem s on s
--where EventCodeGroupID = 4

SELECT s.ID, s.[Name], s.[AltName], a.Name, s.AreaID, vcps.[SystemCustomProperties.EventCodeList] [EventCodeList], Replace(split.[value], ' ', '') [EventCode], ec.Name FROM viewCustomPropertySystem vcps
INNER JOIN tSystem s on s.AltName = vcps.AltName
INNER JOIN tArea a on s.AreaID = a.ID
CROSS APPLY string_split(vcps.[SystemCustomProperties.EventCodeList], ',') as split
INNER JOIN tEventCode ec on split.value = ec.Code
WHERE 
IsTemplate != 1 
AND [SystemCustomProperties.EventCodeList] not like ''
ORDER BY a.[Name], s.ID 


-- this is a marvel of human acheivement -- 
-- aka the greatest thing i've ever done --
--   Susan Brethauer's Greatest Query   --