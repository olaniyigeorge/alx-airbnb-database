
## 📚 Normalizing The ALX Airbnb-Clone Database
Ensure the Airbnb Clone database schema adheres to **Third Normal Form (3NF)** by removing redundancy, eliminating transitive dependencies, and maintaining relational integrity.

---

## ✅ Normalization Recap

To be in **3NF**, a schema must satisfy:

1. **1NF**: Atomic attribute values (no repeating groups).
2. **2NF**: Every non-key attribute is fully functionally dependent on the whole primary key.
3. **3NF**: No transitive dependencies — non-key attributes depend only on the primary key.

---

## 🔍 Schema Review & 3NF Validation

### 1. `User`

- **✅ 1NF**: All values atomic (first_name, role, etc.)
- **✅ 2NF**: Single-attribute PK (user_id), no partial dependencies
- **✅ 3NF**: No transitive dependencies (e.g., phone/email are not derivable from other fields)

➡️ **No changes needed**

---

### 2. `Property`

- **✅ 1NF**: Attributes are atomic
- **✅ 2NF**: All attributes directly depend on `property_id`
- **✅ 3NF**: No transitive dependency (e.g., pricepernight and location aren't derived from host)

➡️ **No changes needed**

---

### 3. `Booking`

- **✅ 1NF**: All values are atomic
- **✅ 2NF**: Composite dependency avoided due to UUID PK
- **✅ 3NF**: No transitive dependencies

➡️ **No changes needed**

---

### 4. `Payment`

- **⚠️ Note**: `amount` is derived from `Booking.total_price` in some systems.
- **Why it stays**: Including `amount` as an immutable record of the payment at the time it was made allows for future booking price changes without historical loss.

➡️ **Keep as-is for denormalized, immutable financial record. Documented decision.**

---

### 5. `Review`

- **✅ 1NF**: Atomic fields
- **✅ 2NF**: Proper FKs used (property_id, user_id)
- **✅ 3NF**: `rating` and `comment` depend solely on PK

➡️ **No changes needed**

---

### 6. `Message`

- **✅ 1NF**: Atomic values
- **✅ 2NF/3NF**: sender_id and recipient_id are well-scoped

➡️ **No changes needed**

---

## 🛠 Optional Improvements

| Suggestion | Rationale |
|-----------|-----------|
| Normalize `location` to a `Location` table | If properties reuse city/state entries, this can reduce redundancy and improve search performance |
| Normalize `payment_method` if extending payment processors | For now, ENUM is sufficient; externalize only if multiple gateway metadata needed |

---

## ✅ Summary

All tables in the Airbnb Clone schema satisfy **Third Normal Form (3NF)**.  
No functional or transitive dependency violations were found.  

Key decision:
- `Payment.amount` is intentionally preserved (not derived at runtime) to reflect historical payment data integrity.

---

## 📂 Version: 3NF-Verified
- [x] 1NF: Atomic values
- [x] 2NF: Full dependency on PK
- [x] 3NF: No transitive dependencies

