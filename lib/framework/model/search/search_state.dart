import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required String query,
    required bool isSearching,
    required bool showVoiceSearch,
    @Default(false) bool hasFocus,
    @Default(false) bool isListening,
    @Default([]) List<String> suggestions,
    @Default([]) List<String> searchHistory,
    @Default(false) bool showResults,
    @Default(false) bool isLoading,
  }) = _SearchState;
}
