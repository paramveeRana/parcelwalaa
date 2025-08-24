import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcelwalaa/ui/widgets/category/category_grid.dart';
import 'package:parcelwalaa/ui/widgets/navigation/custom_bottom_navigation_bar.dart';
import 'package:parcelwalaa/ui/widgets/search/search_bar.dart';
import 'package:parcelwalaa/ui/widgets/search/search_results.dart';
import 'package:parcelwalaa/ui/widgets/banner/banner_carousel.dart';
import 'package:parcelwalaa/framework/provider/navigation/bottom_navigation_provider.dart';
import 'package:parcelwalaa/ui/utils/extensions/widget_extensions.dart';
import 'package:parcelwalaa/ui/utils/theme/app_theme.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(selectedNavItemProvider);
    
    // Debug print to help identify the issue
    debugPrint('MainScreen: selectedItem = ${selectedItem?.id}');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          selectedItem != null ? _buildBody(selectedItem.id) : _buildHomeScreen(),
          Positioned(
            top: 16,
            right: 16,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  // TODO: Show profile dialog
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xFF666666),
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildLoadingScreen() {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildBody(String selectedTabId) {
    switch (selectedTabId) {
      case 'home':
        return _buildHomeScreen();
      case 'order_again':
        return _buildOrderAgainScreen();
      case 'offers':
        return _buildOffersScreen();
      case 'cart':
        return _buildCartScreen();
      default:
        return _buildHomeScreen();
    }
  }

  Widget _buildHomeScreen() {
    debugPrint('MainScreen: Building home screen');
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppTheme.primary.withOpacity(0.1),
                            Colors.white,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(AppTheme.radiusL),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(AppTheme.paddingS),
                                decoration: BoxDecoration(
                                  color: AppTheme.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(AppTheme.radiusS),
                                ),
                                child: const Icon(
                                  Icons.delivery_dining,
                                  color: AppTheme.primary,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: AppTheme.paddingM),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Delivery in',
                                    style: AppTheme.bodyMedium,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        '30 min',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: AppTheme.primary,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: AppTheme.paddingS),
                                        width: 4,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: AppTheme.textLight.withOpacity(0.5),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const Text(
                                        'Express',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.textLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ).paddingAll(AppTheme.paddingM),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(AppTheme.radiusM),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppTheme.primary,
                                  size: 20,
                                ).paddingAll(AppTheme.paddingS),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'HOME',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: AppTheme.primary,
                                            ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppTheme.textLight.withOpacity(0.5),
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Arjun Apartment, Block A, Floor 3',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.textLight.withOpacity(0.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(AppTheme.paddingXS),
                                  decoration: BoxDecoration(
                                    color: AppTheme.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(AppTheme.radiusS),
                                  ),
                                  child: const Icon(
                                    Icons.edit_location_alt_outlined,
                                    color: AppTheme.primary,
                                    size: 18,
                                  ),
                                ).paddingAll(AppTheme.paddingS),
                              ],
                            ),
                          ).paddingSymmetric(horizontal: AppTheme.paddingM, vertical: AppTheme.paddingS),
                        ],
                      ),
                    ).paddingAll(AppTheme.paddingM),
                    // const CustomSearchBar().paddingSymmetric(vertical: 12),
                    const BannerCarousel().paddingSymmetric(vertical: 16),
                    // const CategoryGrid(),
                                      ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderAgainScreen() {
    return Container(
      color: Colors.white,
    );
  }

  Widget _buildOffersScreen() {
    return Container(
      color: Colors.white,
    );
  }

  Widget _buildCartScreen() {
    return Container(
      color: Colors.white,
    );
  }
}
