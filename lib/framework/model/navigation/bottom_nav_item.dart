import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_item.freezed.dart';

@freezed
class BottomNavItem with _$BottomNavItem {
  const factory BottomNavItem({
    required String id,
    required String title,
    required String iconPath,
    required bool isSelected,
    required int index,
  }) = _BottomNavItem;
}
