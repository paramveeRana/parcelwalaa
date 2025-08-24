import 'package:speech_to_text/speech_to_text.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SearchService {
  static SearchService? _instance;
  static SearchService get instance {
    _instance ??= SearchService._internal();
    return _instance!;
  }

  SearchService._internal();

  final SpeechToText _speechToText = SpeechToText();
  late Database _database;
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize speech recognition
    await _speechToText.initialize();

    // Initialize database
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'search_history.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE search_history(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            query TEXT NOT NULL,
            timestamp INTEGER NOT NULL
          )
        ''');
      },
    );

    _isInitialized = true;
  }

  Future<void> startListening(Function(String) onResult) async {
    if (!_isInitialized) await initialize();

    if (!_speechToText.isAvailable) return;

    await _speechToText.listen(
      onResult: (result) {
        if (result.finalResult) {
          onResult(result.recognizedWords);
        }
      },
      localeId: 'en_US',
    );
  }

  void stopListening() {
    _speechToText.stop();
  }

  bool get isListening => _speechToText.isListening;

  Future<void> addToHistory(String query) async {
    if (!_isInitialized) await initialize();

    await _database.insert(
      'search_history',
      {
        'query': query,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<List<String>> getSearchHistory() async {
    if (!_isInitialized) await initialize();

    final results = await _database.query(
      'search_history',
      orderBy: 'timestamp DESC',
      limit: 5,
    );

    return results.map((e) => e['query'] as String).toList();
  }

  Future<void> clearHistory() async {
    if (!_isInitialized) await initialize();
    await _database.delete('search_history');
  }

  Future<List<String>> getSuggestions(String query) async {
    if (query.isEmpty) return [];

    if (!_isInitialized) await initialize();

    final results = await _database.query(
      'search_history',
      where: 'query LIKE ?',
      whereArgs: ['%$query%'],
      orderBy: 'timestamp DESC',
      limit: 5,
    );

    return results.map((e) => e['query'] as String).toList();
  }
}
