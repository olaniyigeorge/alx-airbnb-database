



-- Booking table
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);

