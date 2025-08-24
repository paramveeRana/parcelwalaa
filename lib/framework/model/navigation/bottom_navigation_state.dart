import 'package:freezed_annotation/freezed_annotation.dart';
import 'bottom_nav_item.dart';

part 'bottom_navigation_state.freezed.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState({
    required List<BottomNavItem> navItems,
    required int selectedIndex,
    required bool isLoading,
  }) = _BottomNavigationState;
}
