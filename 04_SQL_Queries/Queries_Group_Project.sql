/*
Group 16:Hiking Events Organizer Company 
Yujie Peng (MySQL Expert) ypeng24@mylangara.ca 
Trung Hieu Phan (MS SQL Server Expert) tphan30@mylangara.ca 
Step5 SQL Queries
*/

-- 1. Display the customer's name whose payment is full paid
SELECT CONCAT(FirstName,' ',LastName) AS CName
FROM Customers c
WHERE c.CustomerID IN (
	SELECT p.CustomerID
    FROM Payments p,Full_Payments fp,Installment_Payments ip
    WHERE (p.TransactionID = fp.TransactionID AND PaymentStatus = 'DONE') OR (p.TransactionID = ip.TransactionID AND InstallmentStatus = 'DONE') 
    );


-- 2. Display the hiking place with name begining with 'b'
SELECT Address
FROM Hiking_Places
WHERE Address LIKE 'B%';


-- 3. Display event id and date and address of hiking event which does not require any equipment
SELECT EventID,EventDate,Address
FROM Hiking_Events
WHERE RequiredEquipment IS NULL;


-- 4. Display the price per hiking of each package
SELECT PackageID, Fee / NumberOfHikesPerYear AS "Unit Price"
FROM Packages;


-- 5. Display the number of photos in each event(use count)
SELECT EventID, COUNT(PhotoID) AS NoOfPhotos
FROM Events_Photos
GROUP BY EventId;


-- 6. Display the easy hiking events
SELECT EventID,EventDate,he.Address
FROM Hiking_Events he, Hiking_Places hp
WHERE he.Address = hp.Address AND hp.Hardness = "Easy";


-- 7. Display the employee who sepcializes in first-aid and has taken the role of first-aid(nested)
SELECT CONCAT(FirstName," ",LastName) AS EName
FROM Employees e
WHERE e.Expertise = "First Aid" 
	AND e.SIN IN (
		SELECT SIN 
        FROM Employees_Events 
        WHERE Roles = "First-aid"
		);


-- 8. Display the employee's name and the times of hiking events(nested quert and join)
SELECT CONCAT(e.FirstName,' ',e.LastName) AS EName, JoinTimes
FROM (
    SELECT SIN, COUNT(DISTINCT EventID) AS JoinTimes
    FROM Employees_Events
    GROUP BY SIN
) ee
JOIN Employees e ON e.SIN = ee.SIN;


-- 9. Display the member who has joined more times than the average(create view)
CREATE VIEW HikingCount AS
SELECT CustomerID, COUNT(DISTINCT EventID) AS Times
FROM Customers_Events
GROUP BY CustomerID;

SELECT CONCAT(FirstName,' ',LastName) AS CName
FROM Customers c
LEFT JOIN HikingCount hc
ON c.CustomerID = hc.CustomerID
WHERE hc.Times > (SELECT AVG(Times) FROM HikingCount);


-- 10. Display the place which takas more time than the average time of events(create view)
CREATE VIEW AverageDuration AS
SELECT AVG(Duration) AS Hours
FROM Hiking_Events;

SELECT Address
FROM Hiking_Places hp, AverageDuration ad
WHERE hp.Hours > ad.Hours;

-- 13. Display the employees' name in every event(use join)
SELECT EventID, Roles, CONCAT(FirstName,' ',LastName) AS EName
FROM Employees_Events ee
JOIN Employees e
ON ee.SIN = e.SIN
ORDER BY EventID;


-- 14. Display the employee who has taken photos in hiking events(use join)
SELECT DISTINCT CONCAT(FirstName,' ',LastName) AS EName
FROM Employees e
JOIN Employee_Photos ep
ON e.SIN = ep.AuthorSIN;

-- 15. Display the number of persons(employees and customers) in every event(use count, union)
SELECT NoOfPeople.EventID, SUM(NoOfPeople.Numbers)
FROM (
	SELECT EventID, COUNT(CustomerID) AS Numbers
	FROM Customers_Events
    GROUP BY EventID
    UNION
    SELECT EventID, COUNT(SIN) AS Numbers
    FROM Employees_Events
    GROUP BY EventID
    ) AS NoOfPeople
GROUP BY NoOfPeople.EventID;


-- 16. Display the hiking event with the shortest duration(use min)
SELECT EventID, Duration
FROM Hiking_Events
WHERE Duration = (SELECT MIN(Duration) FROM Hiking_Events);


-- 17. Update the hiking places table(Change the hardness)
UPDATE Hiking_Places
SET Hardness = "Moderate"
WHERE Address = "Burnaby Lake Park Trail";


-- 18. Update the hiking events table(change the equipments)
UPDATE Hiking_Events
SET RequiredEquipment = "GPS"
WHERE EventID = 111;


-- 19. Delete the person who has used up all the hiking times
DELETE FROM Customers
WHERE CustomerID IN (
	SELECT ce.CustomerID
	FROM Customers_Events ce
	JOIN (
		SELECT ce.CustomerID, COUNT(ce.EventID) AS HikingCount
		FROM Customers_Events ce
		GROUP BY ce.CustomerID
	) AS ce_count ON ce.CustomerID = ce_count.CustomerID
	JOIN Packages p ON ce_count.HikingCount >= p.NumberOfHikesPerYear
	WHERE Customers.CustomerID = ce.CustomerID
);


-- 20. Delete the customer who is not the member
DELETE FROM Customers
WHERE (CustomerID > 0  AND Membership = "No");




