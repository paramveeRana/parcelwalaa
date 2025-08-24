import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcelwalaa/framework/controller/navigation/bottom_navigation_controller.dart';

final bottomNavigationControllerProvider = ChangeNotifierProvider<BottomNavigationController>((ref) {
  return BottomNavigationController.instance;
});

final bottomNavigationStateProvider = Provider((ref) {
  final controller = ref.watch(bottomNavigationControllerProvider);
  return controller.state;
});

final selectedNavItemProvider = Provider((ref) {
  final state = ref.watch(bottomNavigationStateProvider);
  if (state.navItems.isEmpty) return null;
  return state.navItems.firstWhere((item) => item.isSelected, orElse: () => state.navItems.first);
});
