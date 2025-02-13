-- QUESTION 1 What Media Type did customers prefer buy?

SELECT mt.name, COUNT(DISTINCT c.customerid) Customers
FROM customer c
JOIN invoice i
ON c.customerid = i.customerid
JOIN invoiceline iv
ON i.invoiceid = iv.invoiceid
JOIN Track t
ON iv.trackid = t.trackid
JOIN MediaType mt
ON mt.mediatypeid = t.mediatypeid
GROUP BY mt.name
ORDER BY c.customerid DESC;

-- QUESTION 2 Number of Tracks Sold by Genre?

SELECT g.name, COUNT(t.trackid) AS No_Tracks_Sold
FROM genre g
JOIN Track t
ON g.genreid = t.genreid
JOIN InvoiceLine iv
ON iv.trackid = t.trackid
GROUP BY g.name
ORDER BY No_Tracks Sold DESC;

-- QUESTION 3 Total Spent Per Country Compared with Number of Tracks Sold?

SELECT i.billingcountry AS Country, SUM(iv.unitprice * iv.quantity) AS Sales, COUNT(t.trackid) AS No_Tracks
FROM Invoice i
JOIN InvoiceLine iv
ON i.invoiceid = iv.invoiceid
JOIN track t
ON t.trackid = iv.trackid
GROUP BY i.billingcountry
ORDER BY sales DESC;

-- QUESTION 4 Top 10 Albums based on sales?

SELECT a.albumid, a.title, ar.name AS Artist_Name, SUM(iv.unitprice * iv.quantity) AS Sales
FROM Artist ar
JOIN Album a
ON ar.artistid = a.artistid
JOIN Track t
ON a.albumid = t.albumid
JOIN InvoiceLine iv
ON iv.trackid = t.trackid
GROUP BY a.albumid
ORDER BY Sales DESC
LIMIT 10;