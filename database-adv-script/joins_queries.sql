-- Get all bookings and the respective users who made them
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  u.user_id,
  u.first_name,
  u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;


-- Get all properties and any reviews if they exist
SELECT
    p.property_id,
    p.name,
    p.description,
    p.pricepernight,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;

-- Retrieve all users and all bookings even if they have no bookings or no users
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.total_price,
    b.status,
    b.start_date,
    b.end_date
FROM "User" u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;