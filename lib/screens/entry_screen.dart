import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/journal_entry.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _saveEntry() async {
    final title = _titleController.text;
    final body = _bodyController.text;
    if (title.isEmpty || body.isEmpty) return;

    final newEntry = JournalEntry(
      title: title,
      body: body,
      date: DateTime.now(),
    );

    try {
      final box = Hive.box<JournalEntry>('journalBox');
      await box.add(newEntry);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "🌟The best way to predict the future is to create it.",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Entry")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: "Body"),
              maxLines: 6,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _saveEntry,
              icon: const Icon(Icons.save),
              label: const Text("Save Entry"),
            ),
          ],
        ),
      ),
    );
  }
}
