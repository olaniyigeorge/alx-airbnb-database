# Partitioning Performance Report

## Goal

Improve query performance on the large `Booking` table using range-based partitioning by `start_date`.

---

## Partitioning Strategy

- Partitioned `Booking` by quarter using `start_date` column.
- Parent table is `Booking`
- Child partitions: `Booking_2025_Q1` to `Booking_2025_Q4`

---

## Test Query

```sql
SELECT * FROM Booking
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
