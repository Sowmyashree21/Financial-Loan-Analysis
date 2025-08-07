# Bank Loan Performance Analysis (SQL + Tableau)

## Overview

This project is a comprehensive loan analysis report built using SQL for backend data processing and Tableau for data visualization. The primary goal was to simulate a real-world scenario faced by banking analysts: tracking loan performance, customer profiles and repayment behavior to support lending decisions.

Designed as a portfolio project, it demonstrates how a data analyst can use SQL and Tableau to clean raw financial data, extract business-critical KPIs and build interactive dashboards for stakeholders.

---

## Project Objectives

- Understand overall loan health using clean metrics and visual dashboards.
- Separate performing (good) and non-performing (bad) loans based on status.
- Measure financial KPIs like funded amount, amount received, interest rate, and debt-to-income ratio.
- Analyze borrower attributes such as employment length, home ownership, and purpose of the loan.
- Create executive-level dashboards to track trends over time and across regions.

---

## Tools & Technologies

- **SQL (MySQL):** For data cleaning, date conversions, KPI calculations, and business logic.
- **Tableau:** For creating interactive dashboards and visual storytelling.
- **Excel:** Used to move query outputs from SQL to Tableau.
- **GitHub:** To document and share the project in a version-controlled repository.

---

## Dataset Summary

The dataset simulates real-world financial data from a bank’s loan portfolio. It includes fields such as:

- `loan_id` – Unique identifier for each loan.
- `loan_status` – Indicates if a loan is current, fully paid, or charged off.
- `loan_amount` – Total amount disbursed.
- `total_payment` – Amount repaid so far.
- `issue_date` – Date of loan origination.
- `int_rate` – Annual interest rate.
- `dti` – Debt-to-Income ratio.
- `term`, `emp_length`, `purpose`, `address_state`, `home_ownership`, etc.

These fields are commonly used in real financial institutions to evaluate customer creditworthiness and lending risks.

---

## SQL Analysis

### Core KPIs Calculated

- **Total Loan Applications**
- **Month-to-Date (MTD) and Previous MTD Loan Applications**
- **Total and MTD Funded Amount**
- **Total and MTD Received Amount**
- **Average Interest Rate**
- **Average DTI)**

### Loan Quality Classification

- **Good Loans:** Loans with status as *Fully Paid* or *Current*
- **Bad Loans:** Loans with status as *Charged Off*

For each category, the following were calculated:
- Loan Application Count
- Total Funded Amount
- Total Payment Received

### Segment-Based Analysis

These segments were analyzed using SQL aggregations and later visualized in Tableau:

- **Loan Status Summary Grid** (Total Applications, Funded Amount, Received Amount, Avg Interest, Avg DTI by Status)
- **Monthly Trend** of applications, funded amount and repayments
- **State-wise Loan Distribution**
- **Loan Term (duration) Patterns**
- **Employment Length Insights**
- **Loan Purpose Breakdown**
- **Home Ownership Trends**

---

## Tableau Dashboard Overview

### Dashboard 1: Summary Dashboard

This is the high-level overview built for executives and business leaders. It includes:

- KPI cards for MTD and PMTD comparisons
- Good vs. Bad loan distributions
- Total and average metrics
- Filters are available to view data by loan status and specific time periods.

<img width="1349" height="759" alt="SUMMARY" src="https://github.com/user-attachments/assets/d5cd481a-e7c0-4741-8ba6-0bc461100395" />

### Dashboard 2: Overview Dashboard

Focuses on visual trends and borrower behavior:

- **Line Charts** – Monthly trends of applications, funded amount, and repayments
- **Filled Maps** – Regional analysis by state
- **Donut Chart** – Loan term distribution (36, 60 months)
- **Bar Charts** – Insights based on employee length and loan purpose
- **Tree Map** – Breakdown by home ownership

<img width="1350" height="761" alt="OVERVIEW" src="https://github.com/user-attachments/assets/441c942e-09ff-4103-9f3a-c143ad2f286a" />

### Dashboard 3: Details Dashboard

Acts as a full snapshot of all key fields, including:

- Borrower profile metrics
- Loan-specific metrics
- Status flags
- Credit-related indicators (DTI, Interest Rate, Verification)

This dashboard supports loan officers and analysts looking for granular insights at a record level.

<img width="1347" height="757" alt="DETAILS" src="https://github.com/user-attachments/assets/c218fdbf-6944-4dee-b51e-cfbc61861f47" />

---

## Key Business Questions Answered

1. How many loans were issued in the current and previous month?
2. What percentage of loans are currently performing well vs. charged off?
3. How much has been funded vs. received from different borrower groups?
4. How does home ownership affect borrower performance?
5. How much money has been given out in total loans?
6. How much money has been received back from borrowers?
7. What are the most common reasons people take out loans?
8. How are loans performing based on their current status (like fully paid, current, or charged off)?
9. Are certain months showing more loans than others?

---

## Key Takeaways

As someone beginning a career in data analytics, this project gave me hands-on experience with both technical tools and business thinking. These are the main things I learned:

- Writing SQL queries to answer real business questions.
- Performing time-based comparisons like current vs. previous month metrics.
- Spotting useful patterns in loan data, such as repayment trends and loan status.
- Preparing data in SQL and using it in Tableau to build visual reports.
- Creating clear dashboards that highlight important insights for decision-makers.
- Understanding how financial institutions track loan performance and customer behavior.
- Gaining confidence in combining SQL and Tableau to solve real-world problems.

This project strengthened both my technical skills and my ability to think from a business perspective.

---

## About Me

I'm an aspiring data analyst with a strong interest in using data to solve real-world problems and drive better decision-making. I recently started building hands-on projects to strengthen my skills in SQL, Excel, and visualization tools like Tableau and Power BI.

This project is part of my learning journey where I’ve applied data analysis concepts to a business-like scenario. My focus is on building a solid foundation in data cleaning, querying, and storytelling with dashboards and I'm continuously working to improve both my technical skills and business understanding.

I'm excited to explore more real-world datasets, take on challenges and grow into a professional data analyst role. 

## Final Note

This project simulates how analysts work in a real-world financial environment — moving from raw dat
