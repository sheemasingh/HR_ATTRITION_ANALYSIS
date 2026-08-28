HR Attrition Analysis 📊

An end-to-end HR analytics project that explores why employees leave, using Python for data cleaning/feature engineering, SQL for aggregate analysis, and Power BI for an interactive attrition dashboard.

Dataset: IBM HR Analytics Employee Attrition dataset (1,470 employee records).

🎯 Project Objective

HR wants to understand which factors are most strongly associated with employee attrition — department, overtime, income, tenure, promotion history — so leadership can prioritize retention efforts where they'll have the most impact.

This project answers:

What is the overall attrition rate, and how does it vary by department, age, and tenure?
Does working overtime increase the likelihood of leaving?
Does income level affect attrition?
Are newer employees more likely to leave than tenured ones?
Does promotion stagnation correlate with attrition?
🗂️ Repository Structure
├── employee_attrition_rawdata.csv       # Original, unprocessed dataset
├── employee_attrition_cleaned.csv       # Cleaned dataset with engineered features
├── IBM_HR_analytics.ipynb               # Python notebook: cleaning + feature engineering
├── IBM_hr_analysis.sql                  # SQL queries for aggregate attrition analysis
├── HR_Attrition_Dashboard.pbix          # Power BI dashboard (interactive report)
└── README.md                            # Project documentation (this file)
🧹 Data Cleaning & Feature Engineering

Performed in IBM_HR_analytics.ipynb using pandas and numpy. Steps applied to the raw data:

Deduplication — checked and removed duplicate rows.
Missing value check — confirmed no nulls in the source dataset.
Flag encoding
Attrition_Flag: Yes → 1, No → 0
OverTime_Flag: Yes → 1, No → 0
Binned/derived categorical features
AgeGroup: 18-25, 26-35, 36-45, 46+
TenureBand: New (0-2 Yrs), Mid (3-6 Yrs), Senior (7+ Yrs) — based on YearsAtCompany
IncomeBand: Low / Medium / High / Very High — quartile split of MonthlyIncome
ExperienceBand: 0-5, 6-10, 11-20, 20+ years — based on TotalWorkingYears
Composite/ratio metrics
SatisfactionScore: average of Environment, Job, Relationship, and Work-Life Balance satisfaction scores
PromotionStagnant: 1 if YearsSinceLastPromotion > 3, else 0
ManagerStabilityRatio: YearsWithCurrManager / YearsAtCompany
PromotionDelayRatio: YearsSinceLastPromotion / YearsAtCompany
IncomePerJobLevel: MonthlyIncome / JobLevel
LongDistanceEmployee: 1 if DistanceFromHome ≥ 20
FrequentTraveller: 1 if BusinessTravel == "Travel_Frequently"
HighSalaryHike: 1 if PercentSalaryHike ≥ 20

Final cleaned dataset (employee_attrition_cleaned.csv) retains all original columns plus the engineered features above, and is the source table used for both SQL analysis and the Power BI dashboard.

🗄️ SQL Analysis

IBM_hr_analysis.sql contains exploratory aggregate queries run against the cleaned dataset (hr_analytics.hr_attrition), including:

Overall headcount and attrition rate
Attrition rate by Department and by Job Role
Attrition rate by Overtime status
Attrition rate by Tenure Band
Average monthly income by Job Level split by attrition status
Attrition rate by Promotion Stagnation
Average satisfaction and work-life balance scores, by attrition status
Cross-tab of Department × Overtime attrition rate (segments with ≥20 employees, top 5 riskiest)
Attrition rate by Business Travel frequency

These queries validate and quantify the patterns later visualized in the dashboard.

📈 Power BI Dashboard

The dashboard (HR_Attrition_Dashboard.pbix) provides an interactive view of the analysis with filters for Department, Gender, Age Group, and Overtime.

KPI Summary
Metric	Value
Total Employees	1.47K
Attrition Rate	16.12%
Average Tenure	7.01 years
Average Monthly Income	7K
Key Visuals
Attrition Rate by Department — Sales (20.63%) > HR (19.05%) > R&D (13.84%)
Overtime vs Attrition Rate — 30.53% (Overtime = Yes) vs 10.44% (Overtime = No)
Income Band vs Attrition Rate — Low (29.27%) steadily declines to Very High (10.33%)
Tenure Band vs Attrition Rate — New hires (0-2 yrs) account for 55.2% of attrition; Mid (3-6 yrs) 25.04%; Senior (7+ yrs) 19.76%
Employee Distribution by Age Group — headcount split by attrition status across age brackets
Promotion Stagnation vs Attrition Rate — stagnant-promotion group shows higher attrition (16.97% vs 13.08%)
🔑 Key Insights
Overtime is the single strongest attrition signal — employees working overtime leave nearly 3x more often than those who don't.
Compensation matters — attrition falls consistently as income band rises.
New hires are the most at-risk group — over half of all attrition happens within the first 2 years.
Sales has the highest departmental attrition, suggesting workload or role-specific pressures worth investigating further.
Promotion stagnation (no promotion in 3+ years) is mildly associated with higher attrition.
🛠️ Tools & Tech Stack
Stage	Tool
Data Cleaning & Feature Engineering	Python (pandas, numpy) — Jupyter Notebook
Aggregate Analysis	SQL
Dashboard & Visualization	Power BI
▶️ How to Reproduce
Clone/download this repository.
Run the notebook: Open IBM_HR_analytics.ipynb, update the input file path to your local copy of the raw dataset, and run all cells. This regenerates employee_attrition_cleaned.csv.
Load into your database: Import employee_attrition_cleaned.csv into a table named hr_analytics.hr_attrition (or update the table name in the SQL file), then run IBM_hr_analysis.sql to reproduce the aggregate analysis.
Open the dashboard: Open HR_Attrition_Dashboard.pbix in Power BI Desktop, and point the data source to your cleaned CSV or database table if paths have changed. Refresh to load the latest data.
📌 Recommendations for HR
Investigate overtime policies in high-attrition departments (especially Sales) — consider workload redistribution or overtime caps.
Review compensation bands for Low/Medium income employees, where attrition risk is highest.
Strengthen onboarding and early-tenure engagement programs, since new hires (0-2 yrs) drive the majority of attrition.
Revisit promotion cadence for employees who haven't been promoted in 3+ years.
📄 Data Source

IBM HR Analytics Employee Attrition & Performance dataset (publicly available sample dataset, commonly used for HR analytics practice).

👤 Author

Prepared as part of an HR Attrition analytics project — data cleaning, SQL analysis, and Power BI dashboard design.
