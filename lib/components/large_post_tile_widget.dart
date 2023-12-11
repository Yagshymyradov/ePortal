import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/response.dart';
import '../providers.dart';
import '../screens/home_screen/post_details.dart';
import '../utils/assets.dart';
import '../utils/extensions.dart';
import '../utils/navigation.dart';
import '../utils/theme.dart';
import 'optimized_image.dart';

class LargePostTileWidget extends ConsumerWidget {
  final ItemPost post;
  final int index;

  const LargePostTileWidget({
    super.key,
    required this.post,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        navigateToScreen(context, PostDetails(post: post));
        final apiClient = ref.read(apiClientProvider);
        apiClient.updatePostView(post.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 250,
          height: 362,
          decoration:
          BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 230,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: OptimizedImage(
                    imageUrl: 'https://repo.gozle.com.tm/eportalback/${post.image}',
                    width: 269,
                    fit: BoxFit.cover,
                    placeholderBuilder: (c) =>
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                      ),
                    ),
                    imageBuilder: (context, child) => child,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(post.categoryName, style: appThemeData.textTheme.displaySmall,),
                  const SizedBox(width: 5),
                  Container(
                    width: 3,
                    height: 3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColorWO,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text('${post.readTime} мин',
                    style: appThemeData.textTheme.displaySmall,),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                post.title,
                style: appThemeData.textTheme.displayLarge,
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Text(
                setTime(post.createdAt ?? DateTime.now(), context),
                style: appThemeData.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
