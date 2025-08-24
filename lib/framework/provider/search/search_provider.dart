import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcelwalaa/framework/controller/search/search_controller.dart';

final searchControllerProvider = ChangeNotifierProvider<SearchController>((ref) {
  return SearchController.instance;
});

final searchStateProvider = Provider((ref) {
  final controller = ref.watch(searchControllerProvider);
  return controller.state;
});
