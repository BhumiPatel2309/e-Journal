import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import '../models/journal_entry.dart';
import '../screens/entry_screen.dart';
import '../widgets/journal_card.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<JournalEntry> journalBox;

  @override
  void initState() {
    super.initState();
    journalBox = Hive.box<JournalEntry>('journalBox');
  }

  Future<String> fetchQuote() async {
    try {
      final response = await http.get(
        Uri.parse('https://zenquotes.io/api/random'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return '${data[0]['q']} — ${data[0]['a']}';
      }
    } catch (_) {}
    return '🌟 The best way to predict the future is to create it.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${widget.userName}!"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder<String>(
            future: fetchQuote(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox();
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '"${snapshot.data}"',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: journalBox.listenable(),
              builder: (context, Box<JournalEntry> box, _) {
                if (box.isEmpty)
                  return const Center(child: Text("No entries yet."));
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final entry = box.getAt(index);
                    return JournalCard(entry: entry!);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EntryScreen()),
            ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
