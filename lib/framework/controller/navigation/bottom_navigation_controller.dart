import 'package:flutter/material.dart';
import 'package:parcelwalaa/framework/model/navigation/bottom_nav_item.dart';
import 'package:parcelwalaa/framework/model/navigation/bottom_navigation_state.dart';

class BottomNavigationController extends ChangeNotifier {
  BottomNavigationState _state = const BottomNavigationState(
    navItems: [],
    selectedIndex: 0,
    isLoading: true,
  );

  BottomNavigationState get state => _state;

  // Singleton pattern for controller instance
  static BottomNavigationController? _instance;
  
  static BottomNavigationController get instance {
    _instance ??= BottomNavigationController._internal();
    return _instance!;
  }

  BottomNavigationController._internal() {
    // Initialize navigation items immediately
    _initializeNavigationItems();
  }

  void _initializeNavigationItems() {
    final navItems = [
      const BottomNavItem(
        id: 'home',
        title: 'Home',
        iconPath: 'assets/icons/home.svg',
        isSelected: true,
        index: 0,
      ),
      const BottomNavItem(
        id: 'order_again',
        title: 'Order Again',
        iconPath: 'assets/icons/order_again.svg',
        isSelected: false,
        index: 1,
      ),
      const BottomNavItem(
        id: 'offers',
        title: 'Offers',
        iconPath: 'assets/icons/offers.svg',
        isSelected: false,
        index: 2,
      ),
      const BottomNavItem(
        id: 'cart',
        title: 'Cart',
        iconPath: 'assets/icons/cart.svg',
        isSelected: false,
        index: 3,
      ),
    ];

    _state = _state.copyWith(
      navItems: navItems,
      selectedIndex: 0,
      isLoading: false,
    );
    
    notifyListeners();
  }

  void selectTab(int index) {
    if (index == _state.selectedIndex) return;

    final updatedNavItems = _state.navItems.map((item) {
      return item.copyWith(isSelected: item.index == index);
    }).toList();

    _state = _state.copyWith(
      navItems: updatedNavItems,
      selectedIndex: index,
    );

    notifyListeners();
  }

  BottomNavItem getSelectedItem() {
    return _state.navItems.firstWhere((item) => item.isSelected);
  }

  void reset() {
    _initializeNavigationItems();
  }

  @override
  void dispose() {
    _instance = null;
    super.dispose();
  }
}
