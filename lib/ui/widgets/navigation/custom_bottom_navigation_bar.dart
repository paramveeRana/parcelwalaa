import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcelwalaa/framework/provider/navigation/bottom_navigation_provider.dart';
import 'package:parcelwalaa/ui/utils/helpers/icon_helper.dart';
import 'package:parcelwalaa/ui/utils/extensions/widget_extensions.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  ConsumerState<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends ConsumerState<CustomBottomNavigationBar>
    with TickerProviderStateMixin {
  late AnimationController _rippleController;
  late Animation<double> _rippleAnimation;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _rippleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rippleController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bottomNavigationStateProvider);
    final controller = ref.read(bottomNavigationControllerProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: state.navItems.map((item) {
            return _buildNavItem(
              context: context,
              item: item,
              onTap: () => controller.selectTab(item.index),
            );
          }).toList(),
        ).paddingSymmetric(vertical: 12),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required dynamic item,
    required VoidCallback onTap,
  }) {
    final isSelected = item.isSelected;

    return SizedBox(
      width: 80,
      child: GestureDetector(
        onTap: () {
          _rippleController.reset();
          _rippleController.forward();
          onTap();
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              transform: Matrix4.identity()
                ..scale(isSelected ? 1.1 : 1.0),
              child: _buildAnimatedIcon(item, isSelected),
            ).paddingSymmetric(vertical: 8),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected 
                    ? const Color(0xFFFFCA26)
                    : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon(dynamic item, bool isSelected) {
    return IconHelper.getIcon(
      iconPath: item.iconPath,
      isSelected: isSelected,
      size: 24.0,
      selectedColor: const Color(0xFFFFCA26),
      unselectedColor: Colors.grey[400],
    );
  }


}
