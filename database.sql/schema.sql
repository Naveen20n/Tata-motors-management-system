-- MySQL schema for Tata Motors Showroom Management System
-- Generated from DATABASE_DESIGN.md

CREATE TABLE users (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('customer', 'sales_executive', 'admin', 'super_admin') NOT NULL,
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_users_username (username),
    UNIQUE KEY uq_users_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE customers (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id BIGINT UNSIGNED NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    city VARCHAR(100) DEFAULT NULL,
    address TEXT DEFAULT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_customers_user (user_id),
    KEY idx_customers_mobile (mobile),
    KEY idx_customers_city (city),
    CONSTRAINT fk_customers_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE admins (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id BIGINT UNSIGNED NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    employee_code VARCHAR(50) NOT NULL,
    designation VARCHAR(100) DEFAULT NULL,
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_admins_user (user_id),
    UNIQUE KEY uq_admins_employee_code (employee_code),
    CONSTRAINT fk_admins_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE dealerships (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    pincode VARCHAR(20) DEFAULT NULL,
    phone VARCHAR(30) DEFAULT NULL,
    email VARCHAR(255) DEFAULT NULL,
    latitude DECIMAL(10,8) DEFAULT NULL,
    longitude DECIMAL(11,8) DEFAULT NULL,
    opening_time TIME DEFAULT NULL,
    closing_time TIME DEFAULT NULL,
    status ENUM('active', 'inactive', 'maintenance') NOT NULL DEFAULT 'active',
    PRIMARY KEY (id),
    KEY idx_dealerships_city (city),
    KEY idx_dealerships_state (state),
    KEY idx_dealerships_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE sales_executives (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id BIGINT UNSIGNED NOT NULL,
    employee_code VARCHAR(50) NOT NULL,
    dealership_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_sales_executives_user (user_id),
    UNIQUE KEY uq_sales_executives_employee_code (employee_code),
    KEY idx_sales_executives_dealership (dealership_id),
    CONSTRAINT fk_sales_executives_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_sales_executives_dealership FOREIGN KEY (dealership_id) REFERENCES dealerships (id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE vehicles (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    fuel_type VARCHAR(50) NOT NULL,
    body_type VARCHAR(80) DEFAULT NULL,
    starting_price DECIMAL(12,2) NOT NULL,
    description TEXT DEFAULT NULL,
    status ENUM('active', 'inactive', 'coming_soon', 'discontinued') NOT NULL DEFAULT 'active',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_vehicles_category (category),
    KEY idx_vehicles_fuel_type (fuel_type),
    KEY idx_vehicles_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE vehicle_variants (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(120) NOT NULL,
    price DECIMAL(12,2) NOT NULL,
    engine VARCHAR(100) DEFAULT NULL,
    power VARCHAR(80) DEFAULT NULL,
    torque VARCHAR(80) DEFAULT NULL,
    mileage VARCHAR(80) DEFAULT NULL,
    battery_capacity VARCHAR(80) DEFAULT NULL,
    range_km VARCHAR(80) DEFAULT NULL,
    transmission VARCHAR(80) DEFAULT NULL,
    seating_capacity INT UNSIGNED DEFAULT NULL,
    boot_space VARCHAR(80) DEFAULT NULL,
    warranty VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (id),
    KEY idx_vehicle_variants_vehicle (vehicle_id),
    CONSTRAINT fk_vehicle_variants_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE vehicle_colors (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    color_name VARCHAR(80) NOT NULL,
    color_code VARCHAR(20) DEFAULT NULL,
    additional_price DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (id),
    KEY idx_vehicle_colors_vehicle (vehicle_id),
    CONSTRAINT fk_vehicle_colors_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE vehicle_images (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    image_url VARCHAR(500) NOT NULL,
    image_type ENUM('exterior', 'interior', 'gallery', 'banner') NOT NULL DEFAULT 'gallery',
    sort_order INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    KEY idx_vehicle_images_vehicle (vehicle_id),
    KEY idx_vehicle_images_sort (vehicle_id, sort_order),
    CONSTRAINT fk_vehicle_images_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE vehicle_features (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    feature_name VARCHAR(150) NOT NULL,
    description TEXT DEFAULT NULL,
    PRIMARY KEY (id),
    KEY idx_vehicle_features_vehicle (vehicle_id),
    CONSTRAINT fk_vehicle_features_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE vehicle_specifications (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    specification_name VARCHAR(150) NOT NULL,
    specification_value VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id),
    KEY idx_vehicle_specifications_vehicle (vehicle_id),
    CONSTRAINT fk_vehicle_specifications_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE accessories (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    description TEXT DEFAULT NULL,
    price DECIMAL(12,2) NOT NULL,
    status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    PRIMARY KEY (id),
    KEY idx_accessories_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE vehicle_accessories (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    accessory_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_vehicle_accessories (vehicle_id, accessory_id),
    KEY idx_vehicle_accessories_accessory (accessory_id),
    CONSTRAINT fk_vehicle_accessories_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE,
    CONSTRAINT fk_vehicle_accessories_accessory FOREIGN KEY (accessory_id) REFERENCES accessories (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE test_drives (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NOT NULL,
    dealership_id BIGINT UNSIGNED NOT NULL,
    test_drive_date DATE NOT NULL,
    test_drive_time TIME NOT NULL,
    address TEXT DEFAULT NULL,
    status ENUM('pending', 'approved', 'completed', 'cancelled', 'rejected') NOT NULL DEFAULT 'pending',
    notes TEXT DEFAULT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_test_drives_customer (customer_id),
    KEY idx_test_drives_vehicle (vehicle_id),
    KEY idx_test_drives_dealership (dealership_id),
    KEY idx_test_drives_status (status),
    CONSTRAINT fk_test_drives_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    CONSTRAINT fk_test_drives_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE RESTRICT,
    CONSTRAINT fk_test_drives_variant FOREIGN KEY (variant_id) REFERENCES vehicle_variants (id) ON DELETE RESTRICT,
    CONSTRAINT fk_test_drives_dealership FOREIGN KEY (dealership_id) REFERENCES dealerships (id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE bookings (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    booking_number VARCHAR(50) NOT NULL,
    customer_id BIGINT UNSIGNED NOT NULL,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NOT NULL,
    color_id BIGINT UNSIGNED NOT NULL,
    dealership_id BIGINT UNSIGNED NOT NULL,
    sales_executive_id BIGINT UNSIGNED NOT NULL,
    booking_amount DECIMAL(12,2) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'paid', 'completed', 'cancelled', 'delivered') NOT NULL DEFAULT 'pending',
    delivery_date DATE DEFAULT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_bookings_number (booking_number),
    KEY idx_bookings_customer (customer_id),
    KEY idx_bookings_vehicle (vehicle_id),
    KEY idx_bookings_dealership (dealership_id),
    KEY idx_bookings_status (status),
    CONSTRAINT fk_bookings_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE RESTRICT,
    CONSTRAINT fk_bookings_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE RESTRICT,
    CONSTRAINT fk_bookings_variant FOREIGN KEY (variant_id) REFERENCES vehicle_variants (id) ON DELETE RESTRICT,
    CONSTRAINT fk_bookings_color FOREIGN KEY (color_id) REFERENCES vehicle_colors (id) ON DELETE RESTRICT,
    CONSTRAINT fk_bookings_dealership FOREIGN KEY (dealership_id) REFERENCES dealerships (id) ON DELETE RESTRICT,
    CONSTRAINT fk_bookings_sales_executive FOREIGN KEY (sales_executive_id) REFERENCES sales_executives (id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE booking_items (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    booking_id BIGINT UNSIGNED NOT NULL,
    accessory_id BIGINT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    total_price DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_booking_items (booking_id, accessory_id),
    KEY idx_booking_items_booking (booking_id),
    KEY idx_booking_items_accessory (accessory_id),
    CONSTRAINT fk_booking_items_booking FOREIGN KEY (booking_id) REFERENCES bookings (id) ON DELETE CASCADE,
    CONSTRAINT fk_booking_items_accessory FOREIGN KEY (accessory_id) REFERENCES accessories (id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE payments (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    booking_id BIGINT UNSIGNED NOT NULL,
    transaction_id VARCHAR(100) DEFAULT NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_method ENUM('card', 'upi', 'net_banking', 'cash', 'finance') NOT NULL,
    payment_status ENUM('pending', 'paid', 'failed', 'refunded', 'partial') NOT NULL DEFAULT 'pending',
    payment_date DATETIME DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_payments_transaction (transaction_id),
    KEY idx_payments_booking (booking_id),
    KEY idx_payments_status (payment_status),
    CONSTRAINT fk_payments_booking FOREIGN KEY (booking_id) REFERENCES bookings (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE offers (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT DEFAULT NULL,
    offer_type ENUM('discount', 'cashback', 'exchange', 'finance', 'seasonal') NOT NULL,
    discount_value DECIMAL(12,2) DEFAULT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('active', 'inactive', 'expired') NOT NULL DEFAULT 'active',
    PRIMARY KEY (id),
    KEY idx_offers_status (status),
    KEY idx_offers_dates (start_date, end_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE vehicle_offers (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    offer_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_vehicle_offers (vehicle_id, offer_id),
    KEY idx_vehicle_offers_offer (offer_id),
    CONSTRAINT fk_vehicle_offers_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE,
    CONSTRAINT fk_vehicle_offers_offer FOREIGN KEY (offer_id) REFERENCES offers (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE enquiries (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    vehicle_id BIGINT UNSIGNED DEFAULT NULL,
    enquiry_type ENUM('test_drive', 'booking', 'finance', 'service', 'general', 'support') NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    assigned_to BIGINT UNSIGNED DEFAULT NULL,
    status ENUM('new', 'in_progress', 'resolved', 'closed') NOT NULL DEFAULT 'new',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_enquiries_customer (customer_id),
    KEY idx_enquiries_vehicle (vehicle_id),
    KEY idx_enquiries_status (status),
    KEY idx_enquiries_assigned_to (assigned_to),
    CONSTRAINT fk_enquiries_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    CONSTRAINT fk_enquiries_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE SET NULL,
    CONSTRAINT fk_enquiries_assigned FOREIGN KEY (assigned_to) REFERENCES sales_executives (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE wishlists (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_wishlists_customer_vehicle (customer_id, vehicle_id),
    KEY idx_wishlists_customer (customer_id),
    KEY idx_wishlists_vehicle (vehicle_id),
    CONSTRAINT fk_wishlists_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    CONSTRAINT fk_wishlists_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE comparisons (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED DEFAULT NULL,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_comparisons_customer (customer_id),
    KEY idx_comparisons_vehicle (vehicle_id),
    CONSTRAINT fk_comparisons_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE SET NULL,
    CONSTRAINT fk_comparisons_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE finance_applications (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    booking_id BIGINT UNSIGNED DEFAULT NULL,
    loan_amount DECIMAL(12,2) NOT NULL,
    down_payment DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    tenure_months INT UNSIGNED NOT NULL,
    estimated_emi DECIMAL(12,2) NOT NULL,
    status ENUM('draft', 'submitted', 'approved', 'rejected', 'pending') NOT NULL DEFAULT 'draft',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_finance_applications_customer (customer_id),
    KEY idx_finance_applications_booking (booking_id),
    KEY idx_finance_applications_status (status),
    CONSTRAINT fk_finance_applications_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    CONSTRAINT fk_finance_applications_booking FOREIGN KEY (booking_id) REFERENCES bookings (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE exchange_vehicles (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    booking_id BIGINT UNSIGNED DEFAULT NULL,
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(120) NOT NULL,
    registration_year YEAR NOT NULL,
    fuel_type VARCHAR(50) DEFAULT NULL,
    kilometers INT UNSIGNED DEFAULT NULL,
    condition ENUM('excellent', 'good', 'fair', 'poor') NOT NULL,
    estimated_value DECIMAL(12,2) NOT NULL,
    status ENUM('pending', 'evaluated', 'accepted', 'rejected') NOT NULL DEFAULT 'pending',
    PRIMARY KEY (id),
    KEY idx_exchange_vehicles_customer (customer_id),
    KEY idx_exchange_vehicles_booking (booking_id),
    KEY idx_exchange_vehicles_status (status),
    CONSTRAINT fk_exchange_vehicles_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    CONSTRAINT fk_exchange_vehicles_booking FOREIGN KEY (booking_id) REFERENCES bookings (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE service_requests (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    vehicle_id BIGINT UNSIGNED DEFAULT NULL,
    service_type VARCHAR(100) NOT NULL,
    preferred_date DATE NOT NULL,
    dealership_id BIGINT UNSIGNED NOT NULL,
    estimated_cost DECIMAL(12,2) DEFAULT NULL,
    status ENUM('pending', 'scheduled', 'in_progress', 'completed', 'cancelled') NOT NULL DEFAULT 'pending',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_service_requests_customer (customer_id),
    KEY idx_service_requests_vehicle (vehicle_id),
    KEY idx_service_requests_dealership (dealership_id),
    KEY idx_service_requests_status (status),
    CONSTRAINT fk_service_requests_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    CONSTRAINT fk_service_requests_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE SET NULL,
    CONSTRAINT fk_service_requests_dealership FOREIGN KEY (dealership_id) REFERENCES dealerships (id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE charging_stations (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    latitude DECIMAL(10,8) DEFAULT NULL,
    longitude DECIMAL(11,8) DEFAULT NULL,
    connector_type VARCHAR(100) NOT NULL,
    charging_speed VARCHAR(80) DEFAULT NULL,
    availability ENUM('available', 'busy', 'offline') NOT NULL DEFAULT 'available',
    operating_hours VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (id),
    KEY idx_charging_stations_city (city),
    KEY idx_charging_stations_availability (availability)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE notifications (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    notification_type ENUM('booking', 'test_drive', 'offer', 'service', 'general') NOT NULL,
    is_read TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_notifications_customer (customer_id),
    KEY idx_notifications_is_read (is_read),
    CONSTRAINT fk_notifications_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE reviews (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    vehicle_id BIGINT UNSIGNED NOT NULL,
    rating TINYINT UNSIGNED NOT NULL,
    review_text TEXT DEFAULT NULL,
    status ENUM('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_reviews_vehicle (vehicle_id),
    KEY idx_reviews_customer (customer_id),
    KEY idx_reviews_status (status),
    CONSTRAINT fk_reviews_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    CONSTRAINT fk_reviews_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_users_role ON users (role);
CREATE INDEX idx_customers_full_name ON customers (full_name);
CREATE INDEX idx_vehicles_name ON vehicles (name);
CREATE INDEX idx_vehicles_price ON vehicles (starting_price);
CREATE INDEX idx_variants_price ON vehicle_variants (price);
CREATE INDEX idx_accessories_name ON accessories (name);
CREATE INDEX idx_offers_type ON offers (offer_type);
CREATE INDEX idx_reviews_rating ON reviews (rating);
