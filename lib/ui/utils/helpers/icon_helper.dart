import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconHelper {
  static Widget getIcon({
    required String iconPath,
    required bool isSelected,
    double size = 24.0,
    Color? selectedColor,
    Color? unselectedColor,
  }) {
    final color = isSelected 
        ? (selectedColor ?? const Color(0xFFFFCA26))
        : (unselectedColor ?? Colors.grey);

    if (iconPath.endsWith('.svg')) {
      return SvgPicture.asset(
        iconPath,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    } else {
      return Icon(
        _getIconData(iconPath),
        size: size,
        color: color,
      );
    }
  }

  static IconData _getIconData(String iconPath) {
    switch (iconPath) {
      case 'assets/icons/home.svg':
        return Icons.home;
      case 'assets/icons/order_again.svg':
        return Icons.shopping_basket;
      case 'assets/icons/offers.svg':
        return Icons.local_offer;
      case 'assets/icons/cart.svg':
        return Icons.shopping_cart;
      default:
        return Icons.home;
    }
  }
}
