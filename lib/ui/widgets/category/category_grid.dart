import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parcelwalaa/framework/provider/category/category_provider.dart';
import 'package:parcelwalaa/ui/utils/theme/app_theme.dart';

class CategoryGrid extends ConsumerWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(categoryControllerProvider);
    final categories = controller.categories.where((c) => c.isEnabled).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.paddingM),
          child: const Text(
            'Categories',
            style: AppTheme.headingMedium,
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(AppTheme.paddingM),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.75,
            crossAxisSpacing: AppTheme.paddingM,
            mainAxisSpacing: AppTheme.paddingM,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () => controller.onCategoryTap(category.id),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppTheme.radiusM),
                  boxShadow: [AppTheme.shadowSmall],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.paddingS),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        padding: const EdgeInsets.all(AppTheme.paddingS),
                        margin: const EdgeInsets.only(bottom: AppTheme.paddingS),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withAlpha(25),
                          borderRadius: BorderRadius.circular(AppTheme.radiusM),
                        ),
                        child: SvgPicture.asset(
                          category.iconPath,
                          colorFilter: const ColorFilter.mode(
                            AppTheme.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Text(
                        category.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.text,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (category.subtitle.isNotEmpty)
                        Text(
                          category.subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textLight.withAlpha(204),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}