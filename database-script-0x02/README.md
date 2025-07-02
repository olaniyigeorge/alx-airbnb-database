# ALX Airbnb-Clone Seed Script

This script populates the Airbnb Clone PostgreSQL schema with realistic sample data for testing and development.

## Structure

### Users
- 4 users created:
  - 2 guests: Chinaza Okoro, Amaka Nwosu
  - 1 host: Tunde Adebayo
  - 1 admin: Ibrahim Garba
- UUIDs are predefined.
- Used in downstream relationships (FKs).

### Properties
- 2 properties owned by host Tunde:
  - Lekki Waterfront Apartment (₦250/night)
  - Tranquil Getaway Cabin (₦120/night)

### Bookings
- Chinaza books Lekki apartment (confirmed)
- Amaka books Obudu cabin (pending)
- References valid `user_id` and `property_id`

### Payments
- 1 payment (₦1250) linked to Chinaza’s confirmed booking
- Method: `credit_card`

### Reviews
- 2 reviews by guests for their respective bookings
- Ratings: 5 (Chinaza), 4 (Amaka)

### Messages
- 3 messages exchanged between guests and host
- Simulates pre-booking communication

## Usage

Ensure the schema is initialized (`schema.sql`) before running:



#### How I would run this script
```bash
psql -d airbnb_clone -f seed.sql
