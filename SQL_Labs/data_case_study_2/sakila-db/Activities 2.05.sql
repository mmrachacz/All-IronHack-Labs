USE bank;
SELECT * FROM bank.account;
SELECT * FROM card;
SELECT * FROM disp;

SELECT * 
FROM bank.order
WHERE amount > 10000;

SELECT * 
FROM bank.order
WHERE k_symbol = 'SIPO';

SELECT account_id, amount, k_symbol
FROM bank.order
WHERE k_symbol = 'SIPO';

SELECT account_id AS 'Account', amount AS 'Amount', k_symbol AS 'Type of Payment'
FROM bank.order
WHERE (k_symbol = 'SIPO') AND (amount > 10000);

SELECT account_id AS 'Account', amount AS 'Amount', k_symbol AS 'Type of Payment'
FROM bank.order
WHERE (k_symbol = 'SIPO') AND NOT (amount > 10000);

SELECT account_id AS 'Account', amount AS 'Amount', k_symbol AS 'Type of Payment'
FROM bank.order
WHERE (k_symbol IN ('SIPO', 'LEASING', 'UVER')) AND (amount > 1000);

SELECT * FROM bank.loan;

SELECT *, amount-payments AS balance, round((amount-payments)/1000,2) AS 'balance in thousands'
FROM bank.loan;

SELECT * FROM bank.account
ORDER BY account_id DESC
LIMIT 10;

SELECT DISTINCT frequency FROM bank.account;

SELECT * FROM bank.district;

SELECT A2 AS district_name, A11 as average_salary
FROM bank.district
WHERE A11 > 10000;

SELECT * FROM loan
WHERE (status = 'B');

SELECT * FROM bank.card
WHERE type = 'junior'
ORDER BY issued ASC
LIMIT 10;

SELECT loan_id, account_id, amount-(duration*payments) AS debt_value 
FROM loan
WHERE (status = 'B');

SELECT A2 AS district, round(A4*(A10/100),0) AS 'urban population' 
FROM bank.district;

SELECT A2 AS district, round(A4*(A10/100),0) AS 'urban population' 
FROM district
WHERE A10 >= 50;

SELECT COUNT(DISTINCT account_id) FROM bank.order;

SELECT AVG(amount) FROM bank.order;

SELECT MAX(amount) FROM bank.order;

SELECT MIN(amount) FROM bank.order;

SELECT *, concat(order_id, account_id) AS 'concat'
FROM bank.order;

SELECT *, 	
	concat(order_id, account_id) AS 'concat', 
	concat(left(k_symbol,2), right(k_symbol,1)) AS 'standardized_k_symbol'
FROM bank.order;

SELECT * FROM bank.loan;

SELECT loan_id, account_id, 
CASE
WHEN status = 'B' then 'Defaulter - contract finished' 
WHEN (status = 'A') AND (amount > 100000) then 'Great - contract finished' 
WHEN (status = 'A') AND (amount <= 100000) then 'Good - contract finished'
WHEN status = 'C' then 'Good - contract ongoing' 
WHEN status = 'D' then 'In Debt - contract ongoing' 
ELSE 'No Status'
END AS 'Status Description',
status AS 'previous status'
FROM bank.loan;

SELECT * FROM card
WHERE (type = 'junior') AND (issued > 980000);

SELECT * FROM bank.trans
WHERE operation != 'VYBER'
ORDER BY date DESC
LIMIT 10;

SELECT * FROM loan;

SELECT loan_id, account_id, amount-payments AS debt_value 
FROM loan
WHERE (status = 'B') AND (amount-payments) > 1000
ORDER BY amount-payments DESC;

SELECT MAX(amount), MIN(amount) 
FROM trans
WHERE amount > 0;

SELECT *, left(date,2) as year FROM account;
SELECT *, CONVERT(date,DATE) FROM bank.account;
SELECT *, CONVERT(date,DATETIME) FROM bank.account;

SELECT *, DATE_FORMAT(CONVERT(LEFT(issued,6),DATE), '%D-%M-%Y') as 'issue_date' FROM bank.card;
SELECT *, DATE_FORMAT(CONVERT(LEFT(issued,6),DATE), '%d-%m-%y') as 'issue_date' FROM bank.card;




