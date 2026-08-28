SELECT * FROM hr_analytics.hr_attrition;

SELECT
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS employees_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_analytics.hr_attrition;

SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS left_count,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_analytics.hr_attrition
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS left_count,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_analytics.hr_attrition
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS left_count,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_analytics.hr_attrition
GROUP BY OverTime;

SELECT
    TenureBand,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS left_count,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_analytics.hr_attrition
GROUP BY TenureBand
ORDER BY attrition_rate_pct DESC;

SELECT
    JobLevel,
    Attrition,
    ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income,
    COUNT(*) AS employee_count
FROM hr_analytics.hr_attrition
GROUP BY JobLevel, Attrition
ORDER BY JobLevel, Attrition;


SELECT
    PromotionStagnant,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS left_count,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_analytics.hr_attrition
GROUP BY PromotionStagnant;


SELECT
    Attrition,
    ROUND(AVG(SatisfactionScore), 2) AS avg_satisfaction_score,
    ROUND(AVG(WorkLifeBalance), 2) AS avg_work_life_balance
FROM hr_analytics.hr_attrition
GROUP BY Attrition;


SELECT
    Department,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS left_count,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_analytics.hr_attrition
GROUP BY Department, OverTime
HAVING COUNT(*) >= 20  -- filter out tiny segments for reliability
ORDER BY attrition_rate_pct DESC
LIMIT 5;


SELECT
    BusinessTravel,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS left_count,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_analytics.hr_attrition
GROUP BY BusinessTravel
ORDER BY attrition_rate_pct DESC;

