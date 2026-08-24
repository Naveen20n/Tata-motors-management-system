# API Documentation — Smart Tata Automotive Digital Showroom

## Base URL
```text
/api/
```

## Authentication
```http
POST /api/auth/register/
POST /api/auth/login/
POST /api/auth/token/refresh/
```

## Vehicles
```http
GET    /api/vehicles/
GET    /api/vehicles/{id}/
POST   /api/vehicles/
PUT    /api/vehicles/{id}/
DELETE /api/vehicles/{id}/
```

### Search and Filtering
```http
GET /api/vehicles/?search=nexon
GET /api/vehicles/?fuel_type=EV
GET /api/vehicles/?body_type=SUV
GET /api/vehicles/?min_price=500000&max_price=2000000
```

## Comparison
```http
POST   /api/comparisons/
GET    /api/comparisons/
DELETE /api/comparisons/{id}/
```

## Wishlist
```http
POST   /api/wishlist/
GET    /api/wishlist/
DELETE /api/wishlist/{id}/
```

## Test Drives
```http
POST   /api/test-drives/
GET    /api/test-drives/
GET    /api/test-drives/{id}/
PUT    /api/test-drives/{id}/
DELETE /api/test-drives/{id}/
```

Example:
```json
{
  "vehicle_id": 1,
  "variant_id": 2,
  "dealership_id": 1,
  "test_drive_date": "2026-09-10",
  "test_drive_time": "10:30"
}
```

## Bookings
```http
POST /api/bookings/
GET  /api/bookings/
GET  /api/bookings/{id}/
PUT  /api/bookings/{id}/
```

## Payments
```http
POST /api/payments/create/
POST /api/payments/verify/
GET  /api/payments/{id}/
```

## Dealerships
```http
GET /api/dealerships/
GET /api/dealerships/{id}/
```

## Offers
```http
GET /api/offers/
GET /api/offers/{id}/
```

## Enquiries
```http
POST /api/enquiries/
GET  /api/enquiries/
PUT  /api/enquiries/{id}/
```

## Finance
```http
POST /api/finance/applications/
GET  /api/finance/applications/
```

## Exchange
```http
POST /api/exchange/
GET  /api/exchange/
```

## Charging Stations
```http
GET /api/charging-stations/
```

## Recommendations
```http
POST /api/recommendations/
```

Example:
```json
{
  "budget": 1500000,
  "fuel_type": "EV",
  "usage": "city",
  "passengers": 4
}
```

## Chatbot
```http
POST /api/chatbot/
```

## Status Codes
| Code | Meaning |
|---|---|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 409 | Conflict |
| 500 | Server Error |
