-- Drop existing types if needed
DROP TYPE IF EXISTS user_role CASCADE;
DROP TYPE IF EXISTS booking_status CASCADE;
DROP TYPE IF EXISTS payment_method_enum CASCADE;

-- ENUM types
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TYPE payment_method_enum AS ENUM ('credit_card', 'paypal', 'stripe');

-- User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role user_role NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_property_host FOREIGN KEY (host_id) REFERENCES "User" (user_id)
);

-- Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Property (property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES "User" (user_id)
);

-- Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method payment_method_enum NOT NULL,

    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES Booking (booking_id)
);

-- Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES Property (property_id),
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES "User" (user_id)
);

-- Message Table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_message_sender FOREIGN KEY (sender_id) REFERENCES "User" (user_id),
    CONSTRAINT fk_message_recipient FOREIGN KEY (recipient_id) REFERENCES "User" (user_id)
);

-- Indexes (some are created implicitly, these are additional)
CREATE INDEX idx_user_email ON User (email);
CREATE INDEX idx_property_host_id ON Property (host_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_payment_booking_id ON Payment (booking_id);
CREATE INDEX idx_review_property_id ON Review (property_id);
CREATE INDEX idx_review_user_id ON Review (user_id);
CREATE INDEX idx_message_sender_id ON Message (sender_id);
CREATE INDEX idx_message_recipient_id ON Message (recipient_id);
