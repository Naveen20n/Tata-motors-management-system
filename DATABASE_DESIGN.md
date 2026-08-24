# Database Design — Smart Tata Automotive Digital Showroom

## Database
MySQL

## Main Tables
1. users
2. customers
3. admins
4. sales_executives
5. vehicles
6. vehicle_variants
7. vehicle_colors
8. vehicle_images
9. vehicle_features
10. vehicle_specifications
11. accessories
12. vehicle_accessories
13. dealerships
14. test_drives
15. bookings
16. booking_items
17. payments
18. offers
19. vehicle_offers
20. enquiries
21. wishlists
22. comparisons
23. finance_applications
24. exchange_vehicles
25. service_requests
26. charging_stations
27. notifications
28. reviews

## Core Relationships
```text
User 1 ─── 1 Customer
User 1 ─── 1 Sales Executive
Vehicle 1 ─── N Variants
Vehicle 1 ─── N Colors
Vehicle 1 ─── N Images
Vehicle 1 ─── N Features
Customer 1 ─── N Test Drives
Customer 1 ─── N Bookings
Customer 1 ─── N Enquiries
Customer 1 ─── N Wishlist Items
Booking 1 ─── N Booking Items
Booking 1 ─── N Payments
Dealership 1 ─── N Test Drives
Dealership 1 ─── N Bookings
```

## Important Columns

### users
`id PK, username, email, password_hash, role, is_active, created_at, updated_at`

### customers
`id PK, user_id FK, full_name, mobile, city, address, created_at`

### sales_executives
`id PK, user_id FK, employee_code, dealership_id FK`

### dealerships
`id PK, name, address, city, state, pincode, phone, email, latitude, longitude, opening_time, closing_time, status`

### vehicles
`id PK, name, category, fuel_type, body_type, starting_price, description, status, created_at, updated_at`

### vehicle_variants
`id PK, vehicle_id FK, name, price, engine, power, torque, mileage, battery_capacity, range_km, transmission, seating_capacity, boot_space, warranty`

### vehicle_colors
`id PK, vehicle_id FK, color_name, color_code, additional_price`

### vehicle_images
`id PK, vehicle_id FK, image_url, image_type, sort_order`

### vehicle_features
`id PK, vehicle_id FK, feature_name, description`

### vehicle_specifications
`id PK, vehicle_id FK, specification_name, specification_value`

### accessories
`id PK, name, description, price, status`

### vehicle_accessories
`id PK, vehicle_id FK, accessory_id FK`

### test_drives
`id PK, customer_id FK, vehicle_id FK, variant_id FK, dealership_id FK, test_drive_date, test_drive_time, address, status, notes, created_at`

### bookings
`id PK, booking_number, customer_id FK, vehicle_id FK, variant_id FK, color_id FK, dealership_id FK, sales_executive_id FK, booking_amount, total_amount, status, delivery_date, created_at, updated_at`

### booking_items
`id PK, booking_id FK, accessory_id FK, quantity, unit_price, total_price`

### payments
`id PK, booking_id FK, transaction_id, amount, payment_method, payment_status, payment_date`

### offers
`id PK, title, description, offer_type, discount_value, start_date, end_date, status`

### vehicle_offers
`id PK, vehicle_id FK, offer_id FK`

### enquiries
`id PK, customer_id FK, vehicle_id FK nullable, enquiry_type, subject, message, assigned_to FK nullable, status, created_at`

### wishlists
`id PK, customer_id FK, vehicle_id FK, created_at`

### comparisons
`id PK, customer_id FK nullable, vehicle_id FK, created_at`

### finance_applications
`id PK, customer_id FK, booking_id FK nullable, loan_amount, down_payment, interest_rate, tenure_months, estimated_emi, status, created_at`

### exchange_vehicles
`id PK, customer_id FK, booking_id FK nullable, brand, model, registration_year, fuel_type, kilometers, condition, estimated_value, status`

### service_requests
`id PK, customer_id FK, vehicle_id FK nullable, service_type, preferred_date, dealership_id FK, estimated_cost, status, created_at`

### charging_stations
`id PK, name, address, city, state, latitude, longitude, connector_type, charging_speed, availability, operating_hours`

### notifications
`id PK, customer_id FK, title, message, notification_type, is_read, created_at`

### reviews
`id PK, customer_id FK, vehicle_id FK, rating, review_text, status, created_at`

## Database Rules
- Use normalized relational design.
- Use foreign keys for relationships.
- Add indexes to search/filter fields.
- Use timestamps on important records.
- Never store raw payment credentials.
- Use Django authentication for password storage.
