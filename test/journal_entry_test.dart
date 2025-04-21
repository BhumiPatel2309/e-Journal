import 'package:flutter_test/flutter_test.dart';
import 'package:journaling_app/models/journal_entry.dart';

void main() {
  test('JournalEntry creates correct fields', () {
    final entry = JournalEntry(
      title: 'Test',
      body: 'Hello world',
      date: DateTime(2024),
    );
    expect(entry.title, 'Test');
    expect(entry.body, 'Hello world');
    expect(entry.date.year, 2024);
  });
}
