import 'package:flutter/material.dart';
import 'package:parcelwalaa/framework/model/category/category_item.dart';

class CategoryController extends ChangeNotifier {
  static CategoryController? _instance;
  static CategoryController get instance {
    _instance ??= CategoryController._internal();
    return _instance!;
  }

  CategoryController._internal();

  final List<CategoryItem> categories = [
    const CategoryItem(
      id: 'pick_drop',
      title: 'Pick and Drop',
      subtitle: 'Service',
      iconPath: 'assets/icons/categories/pick_drop.svg',
      isEnabled: true,
    ),
    const CategoryItem(
      id: 'laundry',
      title: 'Laundry',
      subtitle: 'Service',
      iconPath: 'assets/icons/categories/laundry.svg',
      isEnabled: true,
    ),
    const CategoryItem(
      id: 'groceries',
      title: 'Groceries &',
      subtitle: 'Essentials',
      iconPath: 'assets/icons/categories/groceries.svg',
      isEnabled: true,
    ),
    const CategoryItem(
      id: 'food',
      title: 'Food',
      subtitle: 'Delivery',
      iconPath: 'assets/icons/categories/food.svg',
      isEnabled: true,
    ),
    const CategoryItem(
      id: 'fruits',
      title: 'Fruits &',
      subtitle: 'Vegetables',
      iconPath: 'assets/icons/categories/fruits.svg',
      isEnabled: true,
    ),
    const CategoryItem(
      id: 'medical',
      title: 'Medical',
      subtitle: '',
      iconPath: 'assets/icons/categories/medical.svg',
      isEnabled: true,
    ),
  ];

  void onCategoryTap(String id) {
    // Handle category tap
    debugPrint('Category tapped: $id');
  }
}
