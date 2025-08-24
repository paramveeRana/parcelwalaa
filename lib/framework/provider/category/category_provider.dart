import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcelwalaa/framework/controller/category/category_controller.dart';

final categoryControllerProvider = ChangeNotifierProvider<CategoryController>((ref) {
  return CategoryController.instance;
});
