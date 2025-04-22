# e-Journal: Digital Journaling App

A modern digital journaling application built with Flutter that allows users to capture their thoughts, memories, and experiences in a secure and organized manner.

## Features

### User Authentication
- Secure email/password registration and login
- Google Sign-In integration
- Session management and secure data storage

### Journal Management
- Create, edit, and delete journal entries
- Rich text formatting support
- Date-wise organization of entries
- Mood tracking with each entry

### User Experience
- Clean and intuitive user interface
- Dark/Light theme support
- Smooth animations and transitions
- Responsive design for all screen sizes

### Security
- End-to-end encryption for journal entries
- Secure authentication using Firebase
- Private and protected user data

## Technical Implementation

### Frontend
- Flutter (Dart)
- Material Design components
- Custom widgets for journal entries
- Responsive layouts

### Backend
- Firebase Authentication
- Cloud Firestore for data storage
- Secure data encryption

## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^latest_version
  firebase_auth: ^latest_version
  cloud_firestore: ^latest_version
  google_sign_in: ^latest_version
  shared_preferences: ^latest_version
```

## Project Structure
```
lib/
├── models/
│   ├── user.dart
│   └── journal_entry.dart
├── screens/
│   ├── home_screen.dart
│   ├── login_screen.dart
│   └── register_screen.dart
├── services/
│   └── auth_service.dart
├── widgets/
│   └── custom_widgets.dart
└── main.dart
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/BhumiPatel2309/e-Journal.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Create a new Firebase project
   - Add your Firebase configuration files
   - Enable Authentication and Firestore

4. Run the app:
```bash
flutter run
```
## Screens
Here are the app's screenshots showcasing various screens:

![Register Screen](https://github.com/user-attachments/assets/8d1d8502-6972-43b8-a765-a8f8ca117df5)
![Login Screen](https://github.com/user-attachments/assets/116c9ae9-5a7c-4d38-9471-4a7658113529)
![Home Screen](https://github.com/user-attachments/assets/ad5ea08d-47cf-4d2e-b3c4-fc4a5c80ebd3)
![Entry Screen](https://github.com/user-attachments/assets/c134065d-a13c-4d5b-85e0-9b4892bef3e7)
![Entry List Screen](https://github.com/user-attachments/assets/7d674d1b-64c0-4e45-8294-e73deab4fad8)
![Logout Screen](https://github.com/user-attachments/assets/72fcea38-6eb0-43dc-87b8-a1cf29eb5903)


## Future Enhancements
- Cloud sync across devices
- Journal templates
- Media attachments (photos, audio)
- Export functionality
- Tags and categories
- Search functionality
- Sharing capabilities

## Contributors
- Bhumi Patel

## Acknowledgments
- Flutter team for the amazing framework
- Firebase for backend services
- Open-source packages used in this project
