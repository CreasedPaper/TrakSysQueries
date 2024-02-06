DECLARE @AreaID int = 2;
DECLARE @SDT datetimeoffset = '2024-01-31T00:00:00.000-05:00';
DECLARE @EDT datetimeoffset = '2024-02-02T23:59:59.000-05:00';
DECLARE @ShiftID int = -1;
DECLARE @JobID int = -1;
DECLARE @ProductCode nvarchar(1000) = N'';
DECLARE @GroupBy_Text nvarchar(1000) = N'Area';


SELECT ROW_NUMBER() OVER (ORDER BY m.ShiftName, m.ShiftName) [rownumber]
, m.ShiftName [GroupValue]
, m.ShiftName [GroupLabel]
, m.ShiftName [GroupDisplayOrder]
, m.ShiftName [SeriesValue] 
, m.ShiftName [SeriesLabel] 
, m.ShiftName [SeriesDisplayOrder] 
, ((CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[NetOperationSeconds]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 100 [Value] 
, ((CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[NetOperationSeconds]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 1 [ValueDecimal] 
, ((CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[NetOperationSeconds]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 100 [Oee] 
, ((CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[NetOperationSeconds]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 1 [OeeDecimal] 
, ((CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalNetOperationCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 100 [Oee2] 
, ((CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalNetOperationCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 1 [Oee2Decimal] 
, (CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[NetOperationSeconds]) AS FLOAT), 0)) * 100 [Availability] 
, (CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[NetOperationSeconds]) AS FLOAT), 0)) * 1 [AvailabilityDecimal] 
, (CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalNetOperationCalculationUnits]) AS FLOAT), 0)) * 100 [Availability2] 
, (CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalNetOperationCalculationUnits]) AS FLOAT), 0)) * 1 [Availability2Decimal] 
, (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * 100 [Performance] 
, (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * 1 [PerformanceDecimal] 
, (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0)) * 100 [Quality] 
, (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0)) * 1 [QualityDecimal] 
, (CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[IntervalTeepSeconds]) AS FLOAT), 0)) * 100 [AvailabilityTeep] 
, (CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[IntervalTeepSeconds]) AS FLOAT), 0)) * 1 [AvailabilityTeepDecimal] 
, (CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalIntervalTeepCalculationUnits]) AS FLOAT), 0)) * 100 [Availability2Teep] 
, (CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalIntervalTeepCalculationUnits]) AS FLOAT), 0)) * 1 [Availability2TeepDecimal] 
, ((CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[IntervalTeepSeconds]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 100 [Teep] 
, ((CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[IntervalTeepSeconds]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 1 [TeepDecimal] 
, ((CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalIntervalTeepCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 100 [Teep2] 
, ((CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalIntervalTeepCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 1 [Teep2Decimal] 
, (CAST(SUM(m.[MtbfProductionSeconds]) AS FLOAT) / NULLIF(CAST((SUM(m.[MtbfFailureCount]) + 0) AS FLOAT), 0)) / 1 [MtbfSeconds] 
, (CAST(SUM(m.[MtbfProductionSeconds]) AS FLOAT) / NULLIF(CAST((SUM(m.[MtbfFailureCount]) + 0) AS FLOAT), 0)) / 60 [MtbfMinutes] 
, (CAST(SUM(m.[MtbfProductionSeconds]) AS FLOAT) / NULLIF(CAST((SUM(m.[MtbfFailureCount]) + 0) AS FLOAT), 0)) / 3600 [MtbfHours] 
, (CAST(SUM(m.[MtbfRunningSeconds]) AS FLOAT) / NULLIF(CAST((SUM(m.[MtbfFailureCount]) + 0) AS FLOAT), 0)) / 1 [MtrbfSeconds] 
, (CAST(SUM(m.[MtbfRunningSeconds]) AS FLOAT) / NULLIF(CAST((SUM(m.[MtbfFailureCount]) + 0) AS FLOAT), 0)) / 60 [MtrbfMinutes] 
, (CAST(SUM(m.[MtbfRunningSeconds]) AS FLOAT) / NULLIF(CAST((SUM(m.[MtbfFailureCount]) + 0) AS FLOAT), 0)) / 3600 [MtrbfHours] 
, (CAST(SUM(m.[MtbfFailureSeconds]) AS FLOAT) / NULLIF(CAST((SUM(m.[MtbfFailureCount]) + 0) AS FLOAT), 0)) / 1 [MttrSeconds] 
, (CAST(SUM(m.[MtbfFailureSeconds]) AS FLOAT) / NULLIF(CAST((SUM(m.[MtbfFailureCount]) + 0) AS FLOAT), 0)) / 60 [MttrMinutes] 
, (CAST(SUM(m.[MtbfFailureSeconds]) AS FLOAT) / NULLIF(CAST((SUM(m.[MtbfFailureCount]) + 0) AS FLOAT), 0)) / 3600 [MttrHours] 
, SUM(m.[IntervalSeconds]) [IntervalSeconds], SUM(m.[LegalLossSeconds]) [LegalLossSeconds], SUM(m.[IntervalTeepSeconds]) [IntervalTeepSeconds], SUM(m.[SystemNotScheduledSeconds]) [SystemNotScheduledSeconds], SUM(m.[NetOperationSeconds]) [NetOperationSeconds], SUM(m.[AvailabilityLossSeconds]) [AvailabilityLossSeconds], SUM(m.[AvailabilityLossTeepSeconds]) [AvailabilityLossTeepSeconds]
, SUM(m.[ProductionSeconds]) [ProductionSeconds]
, SUM(m.[PerformanceLossSeconds]) [PerformanceLossSeconds]
, SUM(m.[RunTimeSeconds]) [RunTimeSeconds], SUM(m.[RateLossSeconds]) [RateLossSeconds]
, SUM(m.[TotalCalculationUnits]) [TotalCalculationUnits]
, SUM(m.[GoodCalculationUnits]) [GoodCalculationUnits], SUM(m.[BadCalculationUnits]) [BadCalculationUnits]
, SUM(m.[TotalDisplayUnits]) [TotalDisplayUnits], SUM(m.[GoodDisplayUnits]) [GoodDisplayUnits], SUM(m.[BadDisplayUnits]) [BadDisplayUnits]
, SUM(m.[TheoreticalProductionCalculationUnits]) [TheoreticalProductionCalculationUnits]
, SUM(m.[TheoreticalNetOperationCalculationUnits]) [TheoreticalNetOperationCalculationUnits]
, SUM(m.[TheoreticalIntervalCalculationUnits]) [TheoreticalIntervalCalculationUnits]
, SUM(m.[TheoreticalIntervalTeepCalculationUnits]) [TheoreticalIntervalTeepCalculationUnits]
, SUM(m.[TargetProductionCalculationUnits]) [TargetProductionCalculationUnits]
, MAX(m.[CalculationUnitsName]) [CalculationUnitsName]
, MAX(m.[DisplayUnitsName]) [DisplayUnitsName]
, SUM(m.[MtbfFailureSeconds]) [MtbfFailureSeconds]
, SUM(m.[MtbfFailureCount]) [MtbfFailureCount]
, SUM(m.[MtbfExcludedSeconds]) [MtbfExcludedSeconds]
, SUM(m.[MtbfProductionSeconds]) [MtbfProductionSeconds]
, SUM(m.[MtbfRunningSeconds]) [MtbfRunningSeconds]

FROM dbo.[viewOeeInterval] m
 INNER JOIN dbo.[tSystem] j ON j.[ID] = m.SystemID 
 INNER JOIN viewCustomPropertySystem vcps ON vcps.ID = m.SystemID 
 INNER JOIN tArea a ON a.ID = j.AreaID
 LEFT JOIN tProduct p ON p.ID = m.ProductID
WHERE 
(m.[Date] BETWEEN @SDT AND @EDT) 
AND (j.[AreaID] = @AreaID OR j.AreaID IN (SELECT a0.ID FROM tArea a0 WHERE a0.ParentAreaID = @AreaID) )
AND vcps.[SystemCustomProperties.IsKeyEquipment] = 1 --Key Systems Only
AND (m.JobID = @JobID OR @JobID = -1)
AND (p.ProductCode = @ProductCode OR @ProductCode = '')
AND (m.ShiftID = @ShiftID OR @ShiftID = -1)
GROUP BY
m.ShiftName
ORDER BY Value desc