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
- All contributors and open-source packages used in this project

## License
This project is licensed under the MIT License - see the LICENSE file for details.
