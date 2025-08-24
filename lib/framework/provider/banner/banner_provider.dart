import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcelwalaa/framework/controller/banner/banner_controller.dart';

final bannerControllerProvider = ChangeNotifierProvider<BannerController>((ref) {
  return BannerController();
});
