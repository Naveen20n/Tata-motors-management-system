# Software Requirement Analysis (SRA)
## Project Title: Smart Tata Automotive Digital Showroom and Online Vehicle Booking System

### Technology Stack

| Layer | Technology |
|---|---|
| Frontend | React.js |
| UI | HTML5, CSS3, Bootstrap 5 |
| Backend | Django + Django REST Framework |
| Database | MySQL |
| Authentication | JWT / Django Authentication |
| API | REST API |
| Version Control | Git & GitHub |
| Deployment | AWS / Render / Railway / Vercel |
| Payment | Razorpay / Payment Gateway |
| Maps | Google Maps API |

---

## 1. Introduction

The **Smart Tata Automotive Digital Showroom and Online Vehicle Booking System** is a full-stack web application that provides customers with a digital platform to explore Tata vehicles and interact with a showroom online.

Customers can browse vehicles, view specifications, compare models, configure vehicles, book test drives, calculate EMI, view offers, make bookings, submit enquiries, locate dealerships, and track booking status.

Showroom administrators can manage vehicles, variants, customers, bookings, test drives, payments, offers, dealerships, accessories, enquiries, and reports.

---

## 2. Problem Statement

Traditional vehicle showroom systems require customers to physically visit the showroom to view vehicles, compare models, check prices, enquire about offers, schedule test drives, and begin the purchasing process.

The proposed system provides a **24/7 digital showroom** that reduces these limitations and allows customers to complete most vehicle-discovery and initial purchase activities online.

---

## 3. Objectives

1. Develop a user-friendly online Tata showroom.
2. Display Tata vehicles with complete specifications.
3. Allow customers to compare multiple vehicles.
4. Provide vehicle configuration/customization.
5. Enable online test-drive booking.
6. Provide EMI and finance calculation.
7. Enable online vehicle booking.
8. Display current offers and discounts.
9. Provide EV-specific information.
10. Provide charging-station information.
11. Provide dealership location services.
12. Allow customers to track bookings.
13. Provide an admin dashboard.
14. Maintain customer and vehicle information securely.
15. Provide showroom analytics.
16. Provide AI-based vehicle recommendations.
17. Provide an AI chatbot for customer assistance.
18. Provide a modern 360-degree/3D vehicle experience.

---

## 4. Scope of the Project

### 4.1 Customer Side

Customers can:

- Register and login.
- Browse vehicles.
- Search vehicles.
- Filter vehicles.
- View vehicle details.
- Compare vehicles.
- Select variants.
- Select colors.
- Configure vehicles.
- View images and videos.
- Check specifications.
- Calculate EMI.
- View offers.
- Book test drives.
- Locate dealerships.
- Book vehicles.
- Make online payments.
- Track bookings.
- Submit enquiries.
- Request callbacks.
- View booking history.
- Save vehicles to a wishlist.
- Receive personalized recommendations.

### 4.2 Admin Side

Administrators can:

- Manage vehicles.
- Manage variants.
- Manage specifications.
- Manage colors.
- Manage prices.
- Manage customers.
- Manage test drives.
- Manage bookings.
- Manage payments.
- Manage offers.
- Manage dealerships.
- Manage enquiries.
- Manage accessories.
- Manage service requests.
- Manage charging stations.
- Generate reports.
- View sales analytics.

---

# 5. Functional Requirements

## FR-01: User Registration

The system shall allow customers to create an account using:

- Name
- Email
- Mobile number
- Password
- City/location

The system shall validate customer information before account creation.

## FR-02: User Login

Customers shall be able to login using registered credentials.

The system shall provide:

- Login
- Logout
- Forgot password
- Password reset
- Session management

The system shall support role-based access for:

- Customer
- Sales Executive
- Administrator

---

## FR-03: Vehicle Management

The system shall display vehicle information including:

- Vehicle name
- Category
- Fuel type
- EV/Petrol/Diesel/CNG
- Starting price
- Variants
- Engine/motor
- Power
- Torque
- Mileage/range
- Battery capacity
- Charging information
- Safety features
- Infotainment
- Dimensions
- Colors
- Accessories
- Images
- Videos

---

## FR-04: Vehicle Search

Customers shall be able to search vehicles using:

- Vehicle name
- Price
- Category
- Fuel type
- Transmission
- Seating capacity
- Mileage/range
- Body type

Example:

> Search for SUVs under ₹20 lakh.

---

## FR-05: Advanced Vehicle Filtering

Customers shall be able to filter vehicles by:

### Budget

- Under ₹10 lakh
- ₹10–15 lakh
- ₹15–20 lakh
- Above ₹20 lakh

### Fuel

- Petrol
- Diesel
- CNG
- EV

### Body Type

- Hatchback
- Sedan
- SUV

### Transmission

- Manual
- Automatic

### Usage

- City
- Family
- Long-distance
- Performance

---

## FR-06: Vehicle Comparison

Customers shall be able to compare 2–4 vehicles.

The comparison should include:

| Feature | Vehicle A | Vehicle B |
|---|---|---|
| Price | Yes | Yes |
| Engine | Yes | Yes |
| Mileage | Yes | Yes |
| Power | Yes | Yes |
| Safety | Yes | Yes |
| Features | Yes | Yes |
| Boot Space | Yes | Yes |
| Warranty | Yes | Yes |

---

## FR-07: Build Your Car / Vehicle Customization

Customers shall be able to configure a vehicle by selecting:

- Model
- Variant
- Exterior color
- Interior
- Accessories
- Wheels
- Optional features

The system shall automatically calculate the updated estimated price.

---

## FR-08: 360-Degree / Virtual Showroom

The system can provide an immersive vehicle viewer.

Customers can:

- Rotate the vehicle.
- View exterior.
- View interior.
- Zoom images.
- View different colors.
- Explore features.
- Watch vehicle videos.

Possible technologies:

- Three.js
- React Three Fiber
- 360-degree images

---

## FR-09: Test Drive Booking

Customers shall be able to schedule a test drive by providing:

- Customer name
- Mobile number
- Vehicle
- Variant
- Preferred date
- Preferred time
- Dealership
- Address

The system shall generate a unique test-drive booking ID.

---

## FR-10: Home Test Drive

The system can allow eligible customers to request a home test drive.

Process:

1. Obtain customer location.
2. Find nearby dealerships.
3. Check service radius.
4. Display available slots.
5. Allow test-drive booking.

---

## FR-11: EMI Calculator

Customers shall be able to calculate estimated monthly EMI.

### Inputs

- Vehicle price
- Down payment
- Loan amount
- Interest rate
- Loan duration

### Outputs

- Monthly EMI
- Total interest
- Total payable amount

---

## FR-12: Finance Options

The system can provide:

- Loan amount
- Interest rate
- Loan tenure
- Down payment
- Estimated EMI
- Finance partner information

Customers can submit finance enquiries.

---

## FR-13: Online Vehicle Booking

Customers shall be able to book a selected vehicle.

### Booking Process

```text
Select Vehicle
      ↓
Select Variant
      ↓
Select Color
      ↓
Add Accessories
      ↓
Select Dealership
      ↓
Enter Customer Details
      ↓
Select Payment Method
      ↓
Make Booking Payment
      ↓
Booking Confirmation
```

---

## FR-14: Payment Management

The system can integrate an online payment gateway.

Supported payment methods:

- UPI
- Debit Card
- Credit Card
- Net Banking

The system shall maintain:

- Transaction ID
- Payment amount
- Payment date
- Payment status
- Booking ID

---

## FR-15: Offers and Discounts

Administrators can create:

- Festival offers
- Exchange bonuses
- Corporate offers
- Finance offers
- Accessories offers
- EV offers
- Limited-time discounts

Customers can view eligible offers while configuring or booking a vehicle.

---

## FR-16: Vehicle Exchange

Customers can submit information about their existing vehicle:

- Existing vehicle
- Registration year
- Brand
- Model
- Fuel type
- Approximate kilometres
- Vehicle condition

The system can generate an estimated exchange value or exchange enquiry.

---

## FR-17: EV Module

The system shall provide an EV-specific module containing:

- EV vehicle list
- Battery capacity
- Estimated range
- Charging time
- Charging type
- Home charging information
- Public charging locations
- Charging cost calculator
- Running-cost comparison
- EV EMI calculator
- EV test-drive booking

---

## FR-18: Charging Station Locator

EV customers can find nearby charging stations.

```text
Current Location
       ↓
Find Nearby Chargers
       ↓
Display Charging Stations
       ↓
Distance
       ↓
Charging Type
       ↓
Availability
```

The project can integrate a map API.

---

## FR-19: Service Cost Calculator

Customers can select:

- Vehicle
- Model
- Service type
- Kilometres/months
- Location

The system shall calculate an estimated service cost.

---

## FR-20: Dealer Locator

Customers shall be able to search dealerships by:

- City
- State
- PIN code
- Current location

The system can display:

- Dealership name
- Address
- Phone number
- Working hours
- Available vehicles
- Test-drive availability
- Map location

---

## FR-21: Customer Enquiry / Lead Management

Customers can submit:

- General enquiry
- Vehicle enquiry
- Price enquiry
- Finance enquiry
- Test-drive enquiry
- Exchange enquiry

Administrators can assign enquiries to sales executives.

---

## FR-22: AI Vehicle Recommendation

The system shall recommend suitable vehicles based on customer preferences.

Possible inputs:

- Budget
- Number of passengers
- Fuel preference
- Usage
- Body type
- Required range
- Feature preferences

Example:

```text
Budget: ₹15 lakh
Usage: City
Passengers: 4
Fuel: EV

        ↓

Recommended Vehicles
1. Suitable Tata EV
2. Suitable Tata EV
```

The initial implementation can use a rule-based recommendation engine and can later be upgraded to machine learning.

---

## FR-23: AI Chatbot

The chatbot can answer:

- Vehicle prices
- Vehicle specifications
- EV range
- Test-drive information
- Booking procedure
- Required documents
- Dealership locations
- Current offers
- Finance information
- Service information

---

## FR-24: Personalized Customer Dashboard

After login, customers shall see:

- Recommended vehicles
- Recently viewed vehicles
- Saved vehicles
- Comparison list
- Upcoming test drive
- Booking status
- Offers
- Enquiries
- Payment history

---

## FR-25: Wishlist

Customers shall be able to save vehicles to a wishlist.

Example:

```text
Nexon EV
Punch EV
Curvv EV
```

---

## FR-26: Booking Tracking

Customers shall be able to track booking status.

```text
Booking Confirmed
       ↓
Payment Completed
       ↓
Vehicle Allocated
       ↓
Vehicle Preparation
       ↓
Delivery Scheduled
       ↓
Vehicle Delivered
```

---

## FR-27: Admin Dashboard

The administrator dashboard shall display:

- Total vehicles
- Total customers
- Total bookings
- Pending bookings
- Test drives
- Total enquiries
- Revenue
- EV bookings

### Analytics

- Monthly bookings
- Vehicle popularity
- Fuel-type demand
- EV vs ICE bookings
- Revenue
- Test-drive conversion

---

## FR-28: Vehicle CRUD Management

Administrators shall be able to:

### Create
Add new vehicle.

### Read
View vehicle information.

### Update
Update vehicle information.

### Delete
Remove vehicle information.

CRUD operations should also be available for:

- Variants
- Colors
- Accessories
- Offers
- Dealerships

---

# 6. Current-Trend Functional Requirements

| Feature | Priority |
|---|---|
| Online vehicle showroom | Must Have |
| Vehicle search/filter | Must Have |
| Vehicle comparison | Must Have |
| Build Your Car | Must Have |
| Test-drive booking | Must Have |
| Online booking | Must Have |
| EMI calculator | Must Have |
| Dealer locator | Must Have |
| EV module | Must Have |
| Charging station locator | High |
| AI vehicle recommendation | High |
| AI chatbot | High |
| 360°/3D vehicle viewer | High |
| Personalized dashboard | High |
| Exchange valuation | High |
| Digital payment | High |
| WhatsApp notifications | High |
| Push notifications | Medium |
| Voice search | Medium |
| AR vehicle visualization | Advanced |
| Predictive lead scoring | Advanced |

---

# 7. Non-Functional Requirements

## 7.1 Performance

- Pages should load quickly.
- APIs should provide responses within a few seconds under normal load.
- Images should be optimized.
- Database queries should use appropriate indexes.
- Frequently accessed data can use caching.

## 7.2 Security

The system shall implement:

- Password hashing
- JWT authentication
- Role-based authorization
- HTTPS
- Input validation
- SQL injection protection
- CSRF protection
- Secure payment processing
- API authentication
- Rate limiting for sensitive APIs

## 7.3 Scalability

The architecture should support increasing:

- Customers
- Vehicles
- Bookings
- Dealerships
- Transactions
- Enquiries

## 7.4 Availability

The system should be available 24/7 except during planned maintenance.

## 7.5 Usability

The website should be:

- Responsive
- Mobile-friendly
- Easy to navigate
- Accessible
- Simple for first-time users

## 7.6 Maintainability

The application should use:

- Modular React components
- Django applications
- REST APIs
- Proper database relationships
- Clear naming conventions
- Git version control
- Environment variables for secrets

---

# 8. System Architecture

```text
                    CUSTOMER
                       |
                       v
              +------------------+
              |  React Frontend  |
              |                  |
              | HTML/CSS/Bootstrap|
              +--------+---------+
                       |
                    REST API
                       |
                       v
              +------------------+
              | Django Backend   |
              | Django REST API  |
              | Authentication   |
              | Business Logic   |
              +--------+---------+
                       |
                       v
              +------------------+
              |      MySQL       |
              |                  |
              | Customers        |
              | Vehicles         |
              | Variants         |
              | Bookings         |
              | Payments         |
              | Test Drives      |
              | Offers           |
              +------------------+
```

---

# 9. Database Requirements

Recommended database tables:

1. `users`
2. `customers`
3. `admins`
4. `sales_executives`
5. `vehicles`
6. `vehicle_variants`
7. `vehicle_colors`
8. `vehicle_images`
9. `vehicle_features`
10. `vehicle_specifications`
11. `accessories`
12. `vehicle_accessories`
13. `dealerships`
14. `test_drives`
15. `bookings`
16. `booking_items`
17. `payments`
18. `offers`
19. `vehicle_offers`
20. `enquiries`
21. `wishlists`
22. `comparisons`
23. `finance_applications`
24. `exchange_vehicles`
25. `service_requests`
26. `charging_stations`
27. `notifications`
28. `reviews`

---

# 10. React Frontend Structure

```text
src/
│
├── components/
│   ├── Navbar.jsx
│   ├── Footer.jsx
│   ├── VehicleCard.jsx
│   ├── SearchBar.jsx
│   └── VehicleFilter.jsx
│
├── pages/
│   ├── Home.jsx
│   ├── Vehicles.jsx
│   ├── VehicleDetails.jsx
│   ├── Compare.jsx
│   ├── BuildCar.jsx
│   ├── TestDrive.jsx
│   ├── Booking.jsx
│   ├── EMI.jsx
│   ├── Dealers.jsx
│   ├── EV.jsx
│   ├── ChargingStations.jsx
│   ├── Login.jsx
│   └── Dashboard.jsx
│
├── admin/
│   ├── AdminDashboard.jsx
│   ├── VehicleManagement.jsx
│   ├── BookingManagement.jsx
│   ├── CustomerManagement.jsx
│   └── OfferManagement.jsx
│
└── services/
    └── api.js
```

---

# 11. Django Backend Structure

```text
tata_showroom/
│
├── manage.py
│
├── showroom/
│   ├── models.py
│   ├── serializers.py
│   ├── views.py
│   ├── urls.py
│   └── admin.py
│
├── users/
├── vehicles/
├── bookings/
├── testdrives/
├── payments/
├── dealerships/
├── offers/
├── services/
└── requirements.txt
```

---

# 12. Important API Endpoints

```text
POST   /api/register/
POST   /api/login/

GET    /api/vehicles/
GET    /api/vehicles/{id}/
POST   /api/vehicles/
PUT    /api/vehicles/{id}/
DELETE /api/vehicles/{id}/

GET    /api/vehicles/compare/

POST   /api/test-drives/
GET    /api/test-drives/

POST   /api/bookings/
GET    /api/bookings/
GET    /api/bookings/{id}/

POST   /api/payments/

GET    /api/dealers/
GET    /api/offers/

POST   /api/enquiries/

GET    /api/charging-stations/

POST   /api/recommendations/
POST   /api/chatbot/
```

---

# 13. Major Project Modules

The system can be divided into the following modules:

1. **User & Authentication Module**
2. **Vehicle Management Module**
3. **Vehicle Comparison Module**
4. **Vehicle Configuration Module**
5. **Test Drive Module**
6. **Online Booking & Payment Module**
7. **Finance & EMI Module**
8. **EV & Charging Module**
9. **AI Recommendation & Chatbot Module**
10. **Admin & Analytics Module**

---

# 14. Recommended Final Project Title

**Smart Tata Automotive Digital Showroom and Online Vehicle Booking System using React, Django and MySQL**

### Key Innovative Features

The strongest features for making this a modern full-stack project are:

- AI vehicle recommendations
- AI chatbot
- 360°/3D vehicle visualization
- Online vehicle configuration
- Online vehicle booking
- EV charging-station locator
- Test-drive booking
- EMI and finance module
- Vehicle exchange module
- Personalized customer dashboard
- Real-time booking tracking
- Admin analytics dashboard
