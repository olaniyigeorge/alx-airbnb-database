# SQL Joins Query Documentation

## INNER JOIN - Valid Bookings with Users
```sql
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;
```
I used an INNER JOIN to select bookings that have valid users and retrieved specific fields that I might need for an endpoint like `/api/bookings` where I want to fetch all valid bookings and its attached user.

## LEFT JOIN - All Properties with Optional Reviews
```sql
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;
```
I used a LEFT JOIN to retrieve all properties regardless of whether they have reviews or not. This is useful for endpoints like `/api/properties` where I want to display all properties, but also show review information when available.

I could also do `SELECT p.*, r.*` to retrieve all fields from both tables if fetching all properties and only when the review is a valid one.

## FULL OUTER JOIN - Complete User and Booking Data
```sql
FROM "User" u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
```
I used a FULL OUTER JOIN to get a complete picture of both users and bookings. This returns all users (even those who haven't made any bookings) and all bookings (even orphaned ones without valid users). Useful for data analysis endpoints where I need to see the complete relationship.

## Quick Reference
- **INNER JOIN**: Only records that exist in both tables
- **LEFT JOIN**: All records from left table, matching records from right table (NULL if no match)
- **FULL OUTER JOIN**: All records from both tables, with NULLs where there's no match



### Joins Queries

1. **INNER JOIN (Booking ↔ User):**
   Retrieves only bookings that have corresponding user records.

2. **LEFT JOIN (Property ↔ Review):**
   Retrieves all properties and any reviews they may have. Properties with no reviews are still listed.

3. **FULL OUTER JOIN (User ↔ Booking):**
   Retrieves all users and all bookings, showing unmatched data on either side to check for inconsistencies.



### Subqueries

1. **Properties with average rating > 4.0 (Non-Correlated):**
   Finds properties where the average of all review ratings is above 4.0 using a GROUP BY and HAVING clause.

2. **Users with more than 3 bookings (Correlated):**
   For each user, counts their bookings using a subquery that references the outer query's `user_id`.

"User" is wrapped in quotes to differentiate it from the reserved word User in SQL 



### Aggregations and Window Functions

1. **Total bookings per user:**
   Uses COUNT + GROUP BY to show how many bookings each user has made.

2. **Ranking properties by bookings:**
   Uses RANK() OVER (...) to rank properties by total bookings. Helps identify most popular listings.



Objective: Write both correlated and non-correlated subqueries.

Instructions:

Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

Write a correlated subquery to find users who have made more than 3 bookings.



Objective: Use SQL aggregation and window functions to analyze data.

Instructions:

Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.