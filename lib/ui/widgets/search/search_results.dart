import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcelwalaa/framework/provider/search/search_provider.dart';
import 'package:parcelwalaa/ui/utils/extensions/widget_extensions.dart';

class SearchResults extends ConsumerWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchStateProvider);

    if (!state.showResults) return const SizedBox.shrink();

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Results for "${state.query}"',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D2D2D),
              ),
            ),
          ),
          if (state.isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF40BFFF),
              ),
            ).paddingSymmetric(vertical: 32)
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 5, // Replace with actual results
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.description,
                      color: Color(0xFF666666),
                    ),
                  ),
                  title: Text(
                    'Sample Result ${index + 1}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                  subtitle: const Text(
                    'Sample description',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                  onTap: () {
                    // Handle result tap
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
