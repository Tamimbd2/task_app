# Theory Test App

A Flutter mobile application demonstrating multiple assignments including authentication, offline capabilities, state management with GetX, REST API integration, and local database usage (SQLite/Hive).  



## Features
- Splash screen with GetX bindings
- Onboarding screens for first-time users
- Authentication: Login, Registration, Forgot Password, OTP verification, Reset Password
- Language selection and localized widgets
- Map screen integration
- REST API integration for data fetching
- Offline caching using SQLite
- Connectivity detection using GetX and `connectivity_plus`
- Modular code structure for easy maintenance

---

## Folder Structure


lib/
│
├── main.dart
│
├── core/
│   ├── constants/
│   │   └── app_colors.dart
│   │
│   └── service/
│       └── connectivity_service.dart
│
├── modules/
│   │
│   ├── assignment1/
│   │   ├── auth/
│   │   │   ├── forgot_password/
│   │   │   │   ├── forgot_pass.dart
│   │   │   │   ├── otp.dart
│   │   │   │   └── reset_password.dart
│   │   │   │
│   │   │   ├── login/
│   │   │   │   └── login.dart
│   │   │   │
│   │   │   └── registration/
│   │   │       └── reg.dart
│   │   │
│   │   ├── language/
│   │   │   ├── language.dart
│   │   │   └── widgets.dart
│   │   │
│   │   ├── map/
│   │   │   └── map.dart
│   │   │
│   │   ├── on_boarding/
│   │   │   └── onboard_screen.dart
│   │   │
│   │   └── splash_screen/
│   │       ├── splash_screen.dart
│   │       ├── splash_controller.dart
│   │       └── splash_binding.dart
│   │
│   ├── assignment2/
│   │   ├── controllers/
│   │   │   └── product_controller.dart
│   │   │
│   │   ├── models/
│   │   │   └── product_model.dart
│   │   │
│   │   └── views/
│   │       └── product_screen.dart
│   │
│   └── assignment3/
│       ├── database_helper.dart
│       ├── controllers/
│       │   └── offline_controller.dart
│       ├── models/
│       │   └── offline_model.dart
│       └── views/
│           └── offline_screen.dart
│
├── routes/
│   ├── app_pages.dart
│   └── app_routes.dart
│
└── widgets/
    ├── button.dart
    ├── text_edit_box.dart
    ├── custom_appbar.dart
    └── loading_indicator.dart
