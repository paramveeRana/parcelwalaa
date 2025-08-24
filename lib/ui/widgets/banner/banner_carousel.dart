import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcelwalaa/framework/provider/banner/banner_provider.dart';
import 'package:parcelwalaa/ui/utils/extensions/widget_extensions.dart';
import 'package:parcelwalaa/ui/utils/theme/app_theme.dart';

class BannerCarousel extends ConsumerStatefulWidget {
  const BannerCarousel({super.key});

  @override
  ConsumerState<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends ConsumerState<BannerCarousel> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bannerControllerProvider).startAutoScroll();
    });
  }

  @override
  void dispose() {
    ref.read(bannerControllerProvider).stopAutoScroll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(bannerControllerProvider);

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            itemCount: controller.banners.length,
            itemBuilder: (context, index) {
              final banner = controller.banners[index];
              return GestureDetector(
                onTap: () => controller.onBannerTap(banner.id),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: AppTheme.paddingM),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white, AppTheme.primaryLight],
                    ),
                    borderRadius: BorderRadius.circular(AppTheme.radiusM),
                    boxShadow: [AppTheme.shadowMedium],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  banner.title,
                                  style: AppTheme.headingMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ).paddingSymmetric(
                                  horizontal: AppTheme.paddingL,
                                ),
                                Text(
                                  banner.discount,
                                  style: AppTheme.headingLarge.copyWith(
                                    color: AppTheme.primary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ).paddingSymmetric(
                                  horizontal: AppTheme.paddingL,
                                ),
                                Text(
                                  banner.subtitle,
                                  style: AppTheme.bodyLarge.copyWith(
                                    color: AppTheme.textLight,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ).paddingSymmetric(
                                  horizontal: AppTheme.paddingL,
                                  vertical: AppTheme.paddingXS,
                                ),
                                ElevatedButton(
                                  onPressed:
                                      () => controller.onBannerTap(banner.id),
                                  style: AppTheme.primaryButton,
                                  child: Text(
                                    banner.buttonText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ).paddingSymmetric(
                                  horizontal: AppTheme.paddingL,
                                  vertical: AppTheme.paddingS,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppTheme.radiusS),
                          boxShadow: [AppTheme.shadowSmall],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppTheme.radiusS),
                          child: Image.network(
                            banner.imageUrl,
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                width: 140,
                                height: 140,
                                color: AppTheme.primaryLight,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: AppTheme.primary,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 140,
                                height: 140,
                                color: AppTheme.primaryLight,
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: AppTheme.textLight,
                                  size: 32,
                                ),
                              );
                            },
                          ),
                        ),
                      ).paddingAll(AppTheme.paddingM),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            controller.banners.length,
            (index) => Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(
                horizontal: AppTheme.paddingXS,
                vertical: AppTheme.paddingM,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    controller.currentPage == index
                        ? AppTheme.primary
                        : AppTheme.divider,
                boxShadow:
                    controller.currentPage == index
                        ? [AppTheme.shadowSmall]
                        : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
