import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/journal_entry.dart';
import 'models/user.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  // Register adapters
  Hive.registerAdapter(JournalEntryAdapter());
  Hive.registerAdapter(UserAdapter());
  
  // Open boxes
  await Hive.openBox<JournalEntry>('journalBox');
  await Hive.openBox<User>('userBox');

  runApp(const JournalApp());
}

class JournalApp extends StatelessWidget {
  const JournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
