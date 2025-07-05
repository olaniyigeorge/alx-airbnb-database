
-- Initial query: Get all bookings with user, property, and payment details
EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status AS booking_status,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON pay.booking_id = b.booking_id;





-- Optimized version (filter recent, fewer fields, still joins all tables)
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name || ' ' || u.last_name AS guest_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_method
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.created_at >= NOW() - INTERVAL '30 days'
ORDER BY b.start_date DESC;
