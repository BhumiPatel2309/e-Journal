import 'package:hive_flutter/hive_flutter.dart';
import '../models/user.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  
  factory AuthService() => _instance;
  
  AuthService._internal();
  
  late Box<User> _userBox;
  User? _currentUser;
  
  Future<void> init() async {
    if (!Hive.isBoxOpen('userBox')) {
      _userBox = await Hive.openBox<User>('userBox');
    } else {
      _userBox = Hive.box<User>('userBox');
    }
  }
  
  Future<User> register({
    required String username,
    required String email,
    required String password,
  }) async {
    await init();
    
    // Check if email already exists
    final existingUser = _userBox.values.any((user) => user.email == email);
    if (existingUser) {
      throw Exception('Email already registered');
    }
    
    // Create and save new user
    final newUser = User(
      username: username,
      email: email,
      password: password,
    );
    
    await _userBox.add(newUser);
    _currentUser = newUser;
    return newUser;
  }
  
  Future<User> login({
    required String email,
    required String password,
  }) async {
    await init();
    
    try {
      final user = _userBox.values.firstWhere(
        (user) => user.email == email && user.password == password,
      );
      
      _currentUser = user;
      return user;
    } catch (e) {
      throw Exception('Invalid credentials');
    }
  }
  
  void logout() {
    _currentUser = null;
  }
  
  User? get currentUser => _currentUser;
  
  bool get isLoggedIn => _currentUser != null;
}
