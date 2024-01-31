
SELECT (SELECT Name FROM tEventCategoryGroup ecg WHERE ecg.Name = s.AltName) [ecgName]
,a.[KEY]
, s.*
FROM tSystem s 
LEFT JOIN tArea a ON a.ID = s.AreaID
WHERE s.IsTemplate = 0
ORDER BY a.DisplayOrder, s.DisplayOrder