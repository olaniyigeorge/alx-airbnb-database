# Airbnb Clone – Database Schema

This project defines the database schema for an Airbnb-like booking platform using PostgreSQL. The schema is implemented in `schema.sql`, which creates the necessary tables, relationships, constraints, and indexes for managing users, properties, bookings, reviews, payments, and messaging.

---

## 🗃️ Overview

The schema includes the following entities:

1. **User** – Manages guests, hosts, and admins.
2. **Property** – Listings created by hosts.
3. **Booking** – Guest bookings for properties.
4. **Payment** – Payment details per booking.
5. **Review** – Guest feedback for properties.
6. **Message** – User-to-user communication.

It uses `UUID` as the primary key type for all tables and defines enum types for role, booking status, and payment method.

---

## 🧱 Schema Details

### 1. `User`

Stores platform users with roles:

- Fields: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`
- Constraints:
  - `email` must be unique
  - `role` must be one of: `guest`, `host`, `admin`
  - `created_at` defaults to current timestamp

---

### 2. `Property`

Represents properties listed by hosts.

- Fields: `property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`
- Constraints:
  - `host_id` references `User(user_id)`
  - All fields are required

---

### 3. `Booking`

Stores reservations made by users.

- Fields: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`
- Constraints:
  - Foreign keys: `property_id`, `user_id`
  - `status` must be one of: `pending`, `confirmed`, `canceled`

---

### 4. `Payment`

Handles payment records for bookings.

- Fields: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`
- Constraints:
  - Foreign key: `booking_id`
  - `payment_method` must be one of: `credit_card`, `paypal`, `stripe`

---

### 5. `Review`

Guests can rate and review properties they've booked.

- Fields: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`
- Constraints:
  - Foreign keys: `property_id`, `user_id`
  - `rating` must be between 1 and 5

---

### 6. `Message`

Enables messaging between users.

- Fields: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`
- Constraints:
  - Foreign keys: `sender_id`, `recipient_id`

---

## 📌 Indexes

- Auto-indexed: All primary keys
- Additional indexes:
  - `email` on `User`
  - Foreign keys on all tables
  - `property_id`, `booking_id`, etc., for performance optimization

