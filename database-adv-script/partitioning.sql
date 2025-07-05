-- Step 1: Rename original table
ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create new partitioned parent table
CREATE TABLE Booking (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 3: Create child partitions
CREATE TABLE Booking_2025_Q1 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE Booking_2025_Q2 PARTITION OF Booking
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE Booking_2025_Q3 PARTITION OF Booking
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE Booking_2025_Q4 PARTITION OF Booking
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');

-- Step 4: Recreate foreign keys (if needed)
ALTER TABLE Booking
    ADD CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES "User"(user_id),
    ADD CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Property(property_id);

-- Step 5: Copy data into partitioned table (optional)
INSERT INTO Booking
SELECT * FROM Booking_old;

-- Step 6: Drop old table (optional after confirming data)
DROP TABLE Booking_old;
