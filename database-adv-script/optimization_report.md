# Query Optimization Report

## Objective

Improve performance of a complex query fetching booking + user + property + payment details.

---

## Initial Query (Summary)

- Joins: `Booking`, `"User"`, `Property`, `Payment`
- No filters, all fields selected
- Ran: `EXPLAIN` → showed potential full table scans

```sql
-- joins without filter
SELECT ... FROM Booking b
JOIN "User" u ON ...
JOIN Property p ON ...
JOIN Payment pay ON ...
