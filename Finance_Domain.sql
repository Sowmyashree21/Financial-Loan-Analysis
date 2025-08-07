CREATE DATABASE financial_domain;
USE financial_domain;

SELECT * FROM loan_data LIMIT 5;

SELECT COUNT(id) AS Total_Loan_Applications FROM loan_data;

SELECT COUNT(id) AS MTD_Total_Loan_Applications 
FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

SELECT COUNT(id) AS PMTD_Total_Loan_Applications 
FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11 AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11 AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

SELECT ROUND(AVG(int_rate)*100,2) AS MTD_Average_Interest_Rate FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

SELECT ROUND(AVG(int_rate)*100,2) AS PTD_Average_Interest_Rate FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11 AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

SELECT ROUND(AVG(dti)*100,2) AS MTD_Average_DTI FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

SELECT ROUND(AVG(dti)*100,2) AS PTD_Average_DTI FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11 AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

-- DASHBOARD 1
-- Good Loan KPIs:
-- Good Loan Application Percentage  
SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id  END)* 100)
	/
	COUNT(id) AS Good_Loan_Percentage
FROM loan_data;

-- Good Loan Applications
SELECT Count(id) AS  Good_Loan_Applications FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS  Good_Loan_Funded_Amount FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Total Received Amount
SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


-- Bad Loan KPIs:
-- Bad Loan Application Percentage 
SELECT 
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id  END)* 100)
	/
	COUNT(id) AS Bad_Loan_Percentage
FROM loan_data;

-- Bad Loan Applications
SELECT Count(id) AS Bad_Loan_Applications FROM loan_data
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS  Bad_Loan_Funded_Amount FROM loan_data
WHERE loan_status = 'Charged Off';

-- Bad Loan Total Received Amount
SELECT SUM(total_payment) AS Bad_Loan_Received_Amount FROM loan_data
WHERE loan_status = 'Charged Off';


-- Loan Status
SELECT
	loan_status,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interest_Rate,
	AVG(dti * 100) AS DTI
FROM
	loan_data
GROUP BY
	loan_status;
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM loan_data
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 
GROUP BY loan_status;



-- DASHBOARD 2
-- Monthly Trends by Issue Date
SELECT 
    Month_Number, Month_Name, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM (
    SELECT 
        id,
        loan_amount,
        total_payment,
        STR_TO_DATE(issue_date, '%d-%m-%Y') AS parsed_date,
        MONTHNAME(STR_TO_DATE(issue_date, '%d-%m-%Y')) AS Month_Name,
        MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) AS Month_Number
    FROM loan_data
) AS sub
GROUP BY Month_Name, Month_Number
ORDER BY Month_Number;

-- Regional Analysis by State
SELECT 
    address_state, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM loan_data
GROUP BY address_state
ORDER BY address_state;

-- Loan Term Analysis
SELECT 
    term, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM loan_data
GROUP BY term
ORDER BY term;

-- Employee Length Analysis
SELECT 
    emp_length, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM loan_data
GROUP BY emp_length
ORDER BY emp_length;

-- Loan Purpose Breakdown
SELECT 
    purpose, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM loan_data
GROUP BY purpose
ORDER BY purpose;

-- Home ownership analysis
SELECT 
    home_ownership, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM loan_data
GROUP BY home_ownership
ORDER BY home_ownership;



