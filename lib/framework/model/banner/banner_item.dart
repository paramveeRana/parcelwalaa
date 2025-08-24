import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_item.freezed.dart';

@freezed
class BannerItem with _$BannerItem {
  const factory BannerItem({
    required String id,
    required String title,
    required String subtitle,
    required String discount,
    required String buttonText,
    required String imageUrl,
  }) = _BannerItem;
}
