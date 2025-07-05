



-- Booking table
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);



-- Monitoring the performance of the index on Booking table
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
