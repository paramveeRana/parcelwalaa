import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parcelwalaa/framework/model/banner/banner_item.dart';

class BannerController extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int get currentPage => _currentPage;
  Timer? _autoScrollTimer;

  void startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_currentPage < banners.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void stopAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
  }

  void onBannerTap(String id) {
    final banner = banners.firstWhere((b) => b.id == id);
    // Handle banner tap based on ID
    switch (id) {
      case '1':
        // Navigate to groceries page
        break;
      case '2':
        // Navigate to fruits page
        break;
      case '3':
        // Navigate to essentials page
        break;
    }
  }

  final List<BannerItem> banners = [
    const BannerItem(
      id: '1',
      title: 'UPTO',
      subtitle: 'On Groceries',
      discount: '25% OFF',
      buttonText: 'Shop Now',
      imageUrl: 'https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=400&h=300&fit=crop',
    ),
    const BannerItem(
      id: '2',
      title: 'FLAT',
      subtitle: 'On Fresh Fruits',
      discount: '30% OFF',
      buttonText: 'Order Now',
      imageUrl: 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?q=80&w=400&h=300&fit=crop',
    ),
    const BannerItem(
      id: '3',
      title: 'SAVE',
      subtitle: 'On Daily Essentials',
      discount: '20% OFF',
      buttonText: 'Buy Now',
      imageUrl: 'https://images.unsplash.com/photo-1579113800032-c38bd7635818?q=80&w=400&h=300&fit=crop',
    ),
  ];

  void onPageChanged(int page) {
    _currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
