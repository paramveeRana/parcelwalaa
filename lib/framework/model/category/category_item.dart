import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_item.freezed.dart';

@freezed
class CategoryItem with _$CategoryItem {
  const factory CategoryItem({
    required String id,
    required String title,
    required String subtitle,
    required String iconPath,
    @Default(false) bool isEnabled,
  }) = _CategoryItem;
}
