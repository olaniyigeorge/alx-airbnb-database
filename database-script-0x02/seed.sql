


-- Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('11111111-aaaa-4aaa-bbbb-111111111111', 'Chinaza', 'Okoro', 'chinaza.okoro@example.com', 'hashed_pw_chinaza', '08012345678', 'guest'),
  ('22222222-bbbb-4bbb-cccc-222222222222', 'Tunde', 'Adebayo', 'tunde.adebayo@example.com', 'hashed_pw_tunde', '08023456789', 'host'),
  ('33333333-cccc-4ccc-dddd-333333333333', 'Amaka', 'Nwosu', 'amaka.nwosu@example.com', 'hashed_pw_amaka', '08034567890', 'guest'),
  ('44444444-dddd-4ddd-eeee-444444444444', 'Ibrahim', 'Garba', 'ibrahim.garba@example.com', 'hashed_pw_ibrahim', '08045678901', 'admin');

-- Properties by host: Tunde
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('aaaa1111-aaaa-4aaa-aaaa-aaaaaaaaaaaa', '22222222-bbbb-4bbb-cccc-222222222222', 'Lekki Waterfront Apartment', 'Modern 2-bedroom apartment with ocean view in Lekki Phase 1.', 'Lagos, Nigeria', 250.00),
  ('bbbb2222-bbbb-4bbb-bbbb-bbbbbbbbbbbb', '22222222-bbbb-4bbb-cccc-222222222222', 'Tranquil Getaway Cabin', 'Peaceful wood-finished cabin perfect for retreats in Obudu.', 'Cross River, Nigeria', 120.00);

-- Bookings by guests: Chinaza and Amaka
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('550e8400-e29b-41d4-a716-446655440001', 'aaaa1111-aaaa-4aaa-aaaa-aaaaaaaaaaaa', '11111111-aaaa-4aaa-bbbb-111111111111', '2025-07-10', '2025-07-15', 1250.00, 'confirmed'),
  ('550e8400-e29b-41d4-a716-446655440002', 'bbbb2222-bbbb-4bbb-bbbb-bbbbbbbbbbbb', '33333333-cccc-4ccc-dddd-333333333333', '2025-08-01', '2025-08-03', 240.00, 'pending');
-- Payments for bookings
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('550e8400-e29b-41d4-a716-pay000000001', '550e8400-e29b-41d4-a716-446655440001', 1250.00, 'credit_card');

-- Reviews left by guests
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('550e8400-e29b-41d4-a716-rev000000001', 'aaaa1111-aaaa-4aaa-aaaa-aaaaaaaaaaaa', '11111111-aaaa-4aaa-bbbb-111111111111', 5, 'Beautiful apartment! Host was very responsive. Highly recommend.'),
  ('550e8400-e29b-41d4-a716-rev000000002', 'bbbb2222-bbbb-4bbb-bbbb-bbbbbbbbbbbb', '33333333-cccc-4ccc-dddd-333333333333', 4, 'Great escape from the city. Peaceful and well-kept.');

-- Messages exchanged between guest and host
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('550e8400-e29b-41d4-a716-msg000000001', '11111111-aaaa-4aaa-bbbb-111111111111', '22222222-bbbb-4bbb-cccc-222222222222', 'Hi Tunde, Im interested in your Lekki apartment. Is it available next weekend?'),
  ('550e8400-e29b-41d4-a716-msg000000002', '22222222-bbbb-4bbb-cccc-222222222222', '11111111-aaaa-4aaa-bbbb-111111111111', 'Hi Chinaza, yes it is! Let me know if you need anything before booking.'),
  ('550e8400-e29b-41d4-a716-msg000000003', '33333333-cccc-4ccc-dddd-333333333333', '22222222-bbbb-4bbb-cccc-222222222222', 'Tunde, your cabin looks amazing. Can I bring pets?');