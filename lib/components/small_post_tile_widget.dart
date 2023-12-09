import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/response.dart';
import '../providers.dart';
import '../screens/home_screen/post_details.dart';
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.description,
                  maxLines: 2,
                  style: appThemeData.textTheme.bodyLarge,
                ),
                Text(
                  item.title,
                  style: appThemeData.textTheme.bodySmall,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 120,
            height: 80,
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
    );
  }
}
