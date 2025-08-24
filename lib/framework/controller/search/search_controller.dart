import 'package:flutter/material.dart';
import 'package:parcelwalaa/framework/model/search/search_state.dart';
import 'package:parcelwalaa/framework/service/search/search_service.dart';

class SearchController extends ChangeNotifier {
  SearchState _state = const SearchState(
    query: '',
    isSearching: false,
    showVoiceSearch: true,
  );

  SearchState get state => _state;
  
  // Singleton pattern
  static SearchController? _instance;
  static SearchController get instance {
    _instance ??= SearchController._internal();
    return _instance!;
  }

  SearchController._internal() {
    _initialize();
  }

  final focusNode = FocusNode();
  final searchService = SearchService.instance;

  Future<void> _initialize() async {
    await searchService.initialize();
    _loadSearchHistory();
  }

  Future<void> _loadSearchHistory() async {
    final history = await searchService.getSearchHistory();
    _state = _state.copyWith(searchHistory: history);
    notifyListeners();
  }

  @override
  void dispose() {
    focusNode.dispose();
    _instance = null;
    super.dispose();
  }

  Future<void> onQueryChanged(String query) async {
    final suggestions = await searchService.getSuggestions(query);
    
    _state = _state.copyWith(
      query: query,
      isSearching: query.isNotEmpty,
      showVoiceSearch: query.isEmpty,
      suggestions: suggestions,
      showResults: query.isNotEmpty,
    );
    notifyListeners();
  }

  Future<void> clearSearch() async {
    await onQueryChanged('');
    _state = _state.copyWith(
      showResults: false,
      suggestions: [],
    );
    notifyListeners();
  }

  void onFocusChanged(bool focused) {
    _state = _state.copyWith(
      hasFocus: focused,
      showResults: focused && _state.query.isNotEmpty,
    );
    notifyListeners();
  }

  Future<void> startVoiceSearch() async {
    _state = _state.copyWith(isListening: true);
    notifyListeners();

    try {
      await searchService.startListening((result) async {
        await onQueryChanged(result);
        await searchService.addToHistory(result);
        await _loadSearchHistory();
        stopVoiceSearch();
      });
    } catch (e) {
      _state = _state.copyWith(isListening: false);
      notifyListeners();
    }
  }

  void stopVoiceSearch() {
    searchService.stopListening();
    _state = _state.copyWith(isListening: false);
    notifyListeners();
  }

  Future<void> onSearchSubmitted() async {
    if (_state.query.isEmpty) return;
    
    await searchService.addToHistory(_state.query);
    await _loadSearchHistory();
  }

  Future<void> clearHistory() async {
    await searchService.clearHistory();
    await _loadSearchHistory();
  }

  void selectSuggestion(String suggestion) {
    onQueryChanged(suggestion);
  }
}
