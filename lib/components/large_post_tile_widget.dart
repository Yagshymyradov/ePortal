import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/response.dart';
import '../providers.dart';
import '../screens/home_screen/post_details.dart';
import '../utils/navigation.dart';
import '../utils/theme.dart';
import 'optimized_image.dart';

class LargePostTileWidget extends ConsumerWidget {
  final Posts post;
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
        navigateToScreen(context, PostDetails(post: post.news[index]));
        final apiClient = ref.read(apiClientProvider);
        apiClient.updatePostView(post.news[index].id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SizedBox(
          width: 250,
          height: 385,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 260,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: OptimizedImage(
                    imageUrl: 'https://repo.gozle.com.tm/eportalback/${post.news[index].image}',
                    width: 269,
                    fit: BoxFit.cover,
                    placeholderBuilder: (c) => const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                      ),
                    ),
                    imageBuilder: (context, child) => child,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  post.news[index].description,
                  maxLines: 2,
                  style: appThemeData.textTheme.displayLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  post.news[index].title,
                  style: appThemeData.textTheme.displaySmall,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
