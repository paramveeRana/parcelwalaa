import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcelwalaa/framework/provider/search/search_provider.dart';
import 'package:parcelwalaa/ui/utils/extensions/widget_extensions.dart';

class CustomSearchBar extends ConsumerWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchStateProvider);
    final controller = ref.read(searchControllerProvider);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFEEEEEE),
            ),
            boxShadow: state.hasFocus ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ] : null,
          ),
          child: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: state.isListening
                    ? const Icon(
                        Icons.mic,
                        color: Color(0xFF40BFFF),
                        key: ValueKey('mic_active'),
                      ).paddingSymmetric(horizontal: 12)
                    : const Icon(
                        Icons.search,
                        color: Color(0xFF666666),
                        key: ValueKey('search'),
                      ).paddingSymmetric(horizontal: 12),
              ),
              Expanded(
                child: Focus(
                  onFocusChange: controller.onFocusChanged,
                  child: TextField(
                    focusNode: controller.focusNode,
                    onChanged: controller.onQueryChanged,
                    onSubmitted: (_) => controller.onSearchSubmitted(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2D2D2D),
                    ),
                    decoration: InputDecoration(
                      hintText: state.isListening ? 'Listening...' : 'Search "stapler"',
                      hintStyle: TextStyle(
                        color: state.isListening ? const Color(0xFF40BFFF) : const Color(0xFF999999),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ),
              if (state.showVoiceSearch)
                IconButton(
                  onPressed: state.isListening ? controller.stopVoiceSearch : controller.startVoiceSearch,
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.isListening
                        ? const Icon(
                            Icons.close,
                            color: Color(0xFF40BFFF),
                            key: ValueKey('stop'),
                          )
                        : const Icon(
                            Icons.mic,
                            color: Color(0xFF666666),
                            key: ValueKey('mic'),
                          ),
                  ),
                ).paddingSymmetric(horizontal: 4)
              else if (state.isSearching)
                IconButton(
                  onPressed: controller.clearSearch,
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF666666),
                  ),
                ).paddingSymmetric(horizontal: 4),
            ],
          ),
        ).paddingSymmetric(horizontal: 16),
        if (state.hasFocus && (state.suggestions.isNotEmpty || state.searchHistory.isNotEmpty))
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.suggestions.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Suggestions',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                        if (state.suggestions.isNotEmpty)
                          GestureDetector(
                            onTap: controller.clearHistory,
                            child: const Text(
                              'Clear All',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF40BFFF),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  ...state.suggestions.map((suggestion) => ListTile(
                    leading: const Icon(Icons.history, color: Color(0xFF666666)),
                    title: Text(suggestion),
                    onTap: () => controller.selectSuggestion(suggestion),
                  )),
                ] else if (state.searchHistory.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Searches',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.clearHistory,
                          child: const Text(
                            'Clear All',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF40BFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...state.searchHistory.map((query) => ListTile(
                    leading: const Icon(Icons.history, color: Color(0xFF666666)),
                    title: Text(query),
                    onTap: () => controller.selectSuggestion(query),
                  )),
                ],
              ],
            ),
          ),
      ],
    );
  }
}