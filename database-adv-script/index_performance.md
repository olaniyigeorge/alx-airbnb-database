# Index Performance

## Context

I already created indexes on high-usage columns (mostly for `JOIN`, `WHERE`, and `ORDER BY`). But I'm now updating with new indexes for some timestamps I might use in filtering — like `start_date` in the `booking` table.

Example:

```sql
SELECT * FROM booking WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';


alx_airbnb_database=> EXPLAIN ANALYZE SELECT * FROM booking WHERE start_date='2025-07-10';

```Seq Scan on booking  (cost=0.00..17.88 rows=3 width=100) (actual time=0.012..0.013 rows=1 loops=1)
  Filter: (start_date = '2025-07-10'::date)
  Rows Removed by Filter: 1
Planning Time: 0.113 ms
Execution Time: 0.030 ms    ```



CREATE INDEX idx_booking_start_date ON booking(start_date);





#### After Adding Index

alx_airbnb_database=> EXPLAIN ANALYZE SELECT * FROM booking WHERE start_date='2025-07-10';

```Seq Scan on booking  (cost=0.00..1.02 rows=1 width=100) (actual time=0.030..0.033 rows=1 loops=1)
  Filter: (start_date = '2025-07-10'::date)
  Rows Removed by Filter: 1
Planning Time: 0.230 ms
Execution Time: 0.068 ms```





-- User
CREATE INDEX idx_users_email ON users(email);

-- Booking
CREATE INDEX idx_bookings_user_id ON booking(user_id);
CREATE INDEX idx_bookings_property_id ON booking(property_id);
CREATE INDEX idx_bookings_booking_date ON booking(booking_date);
CREATE INDEX idx_booking_start_date ON booking(start_date); -- newly added

-- Property
CREATE INDEX idx_properties_city ON property(city);
CREATE INDEX idx_properties_host_id ON property(host_id);
