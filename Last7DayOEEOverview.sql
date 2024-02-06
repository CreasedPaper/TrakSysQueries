SELECT 
 Cast(Cast(DATEADD(DAY, DATEDIFF(DAY, 0, m.StartDateTimeOffset), 0) as date)as nvarchar) [GroupValue]
, Cast(Cast(DATEADD(DAY, DATEDIFF(DAY, 0, m.StartDateTimeOffset), 0) as date)as nvarchar) [GroupLabel]
, 1 [SeriesValue] 
, 1 [SeriesLabel] 
, 1 [SeriesDisplayOrder] 
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

, SUM(m.[IntervalSeconds]) [IntervalSeconds], SUM(m.[LegalLossSeconds]) [LegalLossSeconds], SUM(m.[IntervalTeepSeconds]) [IntervalTeepSeconds], SUM(m.[SystemNotScheduledSeconds]) [SystemNotScheduledSeconds], SUM(m.[NetOperationSeconds]) [NetOperationSeconds], SUM(m.[AvailabilityLossSeconds]) [AvailabilityLossSeconds], SUM(m.[AvailabilityLossTeepSeconds]) [AvailabilityLossTeepSeconds], SUM(m.[ProductionSeconds]) [ProductionSeconds], SUM(m.[PerformanceLossSeconds]) [PerformanceLossSeconds], SUM(m.[RunTimeSeconds]) [RunTimeSeconds], SUM(m.[RateLossSeconds]) [RateLossSeconds], SUM(m.[TotalCalculationUnits]) [TotalCalculationUnits], SUM(m.[GoodCalculationUnits]) [GoodCalculationUnits], SUM(m.[BadCalculationUnits]) [BadCalculationUnits], SUM(m.[TotalDisplayUnits]) [TotalDisplayUnits], SUM(m.[GoodDisplayUnits]) [GoodDisplayUnits], SUM(m.[BadDisplayUnits]) [BadDisplayUnits], SUM(m.[TheoreticalProductionCalculationUnits]) [TheoreticalProductionCalculationUnits], SUM(m.[TheoreticalNetOperationCalculationUnits]) [TheoreticalNetOperationCalculationUnits], SUM(m.[TheoreticalIntervalCalculationUnits]) [TheoreticalIntervalCalculationUnits], SUM(m.[TheoreticalIntervalTeepCalculationUnits]) [TheoreticalIntervalTeepCalculationUnits], SUM(m.[TargetProductionCalculationUnits]) [TargetProductionCalculationUnits], MAX(m.[CalculationUnitsName]) [CalculationUnitsName], MAX(m.[DisplayUnitsName]) [DisplayUnitsName], MAX(m.[DisplayUnitsDivisor]) [DisplayUnitsDivisor], SUM(m.[MtbfFailureSeconds]) [MtbfFailureSeconds], SUM(m.[MtbfFailureCount]) [MtbfFailureCount], SUM(m.[MtbfExcludedSeconds]) [MtbfExcludedSeconds], SUM(m.[MtbfProductionSeconds]) [MtbfProductionSeconds], SUM(m.[MtbfRunningSeconds]) [MtbfRunningSeconds]
, AVG(m.TargetTeep) as [TargetTeep]
, AVG(m.BaselineTeep) as [BaselineTeep]
, AVG(m.TargetOee) as [TargetOee]
, AVG(m.BaselineOee) as [BaselineOee]
, AVG(m.TargetAvailability) as [TargetAvailability]
, AVG(m.BaselineAvailability) as [BaselineAvailability]
, AVG(m.TargetPerformance) as [TargetPerformance]
, AVG(m.BaselinePerformance) as [BaselinePerformance]
, AVG(m.TargetQuality) as [TargetQuality]
, AVG(m.BaselineQuality) as [BaselineQuality]
, CASE
	WHEN (((CAST(SUM(m.[ProductionSeconds]) AS FLOAT) / NULLIF(CAST(SUM(m.[NetOperationSeconds]) AS FLOAT), 0)) * (CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TheoreticalProductionCalculationUnits]) AS FLOAT), 0)) * (CAST(SUM(m.[GoodCalculationUnits]) AS FLOAT) / NULLIF(CAST(SUM(m.[TotalCalculationUnits]) AS FLOAT), 0))) * 100) < 80 THEN '#D9534F'
	ELSE '#6CC14C'
END AS [Color]

FROM dbo.[viewOeeInterval] m
INNER JOIN dbo.[tSystem] j ON j.[ID] = m.SystemID
INNER JOIN tArea a ON a.ID = j.AreaID
WHERE 
(m.StartDateTimeOffset >= DATEADD(DAY, -6, SYSDATETIMEOFFSET() )) AND
(m.[SiteID] IN (-1, 1))
GROUP BY
 DATEADD(DAY, DATEDIFF(DAY, 0, m.StartDateTimeOffset), 0)
ORDER BY   DATEADD(DAY, DATEDIFF(DAY, 0, m.StartDateTimeOffset), 0)