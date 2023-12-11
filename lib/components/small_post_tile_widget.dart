import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/favorite_controller.dart';
import '../data/response.dart';
import '../providers.dart';
import '../screens/home_screen/post_details.dart';
import '../utils/assets.dart';
import '../utils/extensions.dart';
import '../utils/navigation.dart';
import '../utils/theme.dart';
import 'optimized_image.dart';

class SmallPostTileWidget extends ConsumerWidget {
  final ItemPost post;

  const SmallPostTileWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = post;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        navigateToScreen(context, PostDetails(post: item));
        final apiClient = ref.read(apiClientProvider);
        apiClient.updatePostView(post.id);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        style: appThemeData.textTheme.displayMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item.description,
                        style: appThemeData.textTheme.bodySmall,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 120,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: OptimizedImage(
                      imageUrl: 'https://repo.gozle.com.tm/eportalback/${item.image}',
                      width: 269,
                      fit: BoxFit.cover,
                      placeholderBuilder: (c) => const DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          // shape: BoxShape.circle,
                        ),
                      ),
                      imageBuilder: (context, child) => child,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  setTime(post.createdAt ?? DateTime.now(), context),
                  style: appThemeData.textTheme.bodySmall,
                ),
                Text(
                  '${post.readTime} min read',
                  style: appThemeData.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
