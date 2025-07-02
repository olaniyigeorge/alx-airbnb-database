# Database Requirements Specification - AirBnB Clone

## Overview
This document outlines the database requirements and relationships for the ALX Airbnb-clone project. It defines all major entities, their attributes, and the constraints governing their behavior.

---

## Entities and Attributes

### **User**
- `user_id`: Primary Key, UUID, Indexed
- `first_name`: VARCHAR, NOT NULL  
- `last_name`: VARCHAR, NOT NULL  
- `email`: VARCHAR, UNIQUE, NOT NULL  
- `password_hash`: VARCHAR, NOT NULL  
- `phone_number`: VARCHAR, NULL  
- `role`: ENUM (`guest`, `host`, `admin`), NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### **Property**
- `property_id`: Primary Key, UUID, Indexed  
- `host_id`: Foreign Key, references `User(user_id)`  
- `name`: VARCHAR, NOT NULL  
- `description`: TEXT, NOT NULL  
- `location`: VARCHAR, NOT NULL  
- `pricepernight`: DECIMAL, NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP  

### **Booking**
- `booking_id`: Primary Key, UUID, Indexed  
- `property_id`: Foreign Key, references `Property(property_id)`  
- `user_id`: Foreign Key, references `User(user_id)`  
- `start_date`: DATE, NOT NULL  
- `end_date`: DATE, NOT NULL  
- `total_price`: DECIMAL, NOT NULL  
- `status`: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### **Payment**
- `payment_id`: Primary Key, UUID, Indexed  
- `booking_id`: Foreign Key, references `Booking(booking_id)`  
- `amount`: DECIMAL, NOT NULL  
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- `payment_method`: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL  

### **Review**
- `review_id`: Primary Key, UUID, Indexed  
- `property_id`: Foreign Key, references `Property(property_id)`  
- `user_id`: Foreign Key, references `User(user_id)`  
- `rating`: INTEGER, CHECK: `rating >= 1 AND rating <= 5`, NOT NULL  
- `comment`: TEXT, NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### **Message**
- `message_id`: Primary Key, UUID, Indexed  
- `sender_id`: Foreign Key, references `User(user_id)`  
- `recipient_id`: Foreign Key, references `User(user_id)`  
- `message_body`: TEXT, NOT NULL  
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

---

## Constraints

### **User Table**
- Unique constraint on `email`
- Non-null constraints on: `first_name`, `last_name`, `email`, `password_hash`, `role`

### **Property Table**
- Foreign key constraint on `host_id` referencing `User(user_id)`
- All fields required except `updated_at` (auto-managed)

### **Booking Table**
- Foreign key constraints on `property_id` and `user_id`
- `status` must be one of: `pending`, `confirmed`, `canceled`
- `start_date` and `end_date` must be valid and not null

### **Payment Table**
- Foreign key constraint on `booking_id`
- Ensures payments are tied to valid bookings

### **Review Table**
- Foreign key constraints on `property_id` and `user_id`
- `rating` must be an integer between 1 and 5

### **Message Table**
- Foreign key constraints on `sender_id` and `recipient_id`

---

## Indexing

- **Primary Keys**: Automatically indexed
- **Additional Indexes**:
  - `email` in the **User** table
  - `property_id` in **Property** and **Booking**
  - `booking_id` in **Booking** and **Payment**
