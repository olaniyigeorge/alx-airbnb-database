-- Total bookings per user
SELECT
    u.user_id,
    u.first_name,
    COUNT(b.booking_id) AS total_bookings
FROM "User" u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name;



-- Rank properties by total bookings 
SELECT
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;