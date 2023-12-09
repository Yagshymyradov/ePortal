import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/optimized_image.dart';
import '../../data/favorite_controller.dart';
import '../../data/response.dart';
import '../../utils/assets.dart';
import '../../utils/theme.dart';

class PostDetails extends ConsumerStatefulWidget {
  final ItemPost post;

  const PostDetails({super.key, required this.post});

  @override
  ConsumerState<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends ConsumerState<PostDetails> {
  bool saved = false;

  bool isFavoritePost() {
    final favorites = ref.read(favoriteStorageDataProvider);
    for (final e in favorites!) {
      if (e.id == widget.post.id) return true;
    }
    return false;
  }

  void updateUi() {
    setState(() {
      //no-op
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  child: OptimizedImage(
                    imageUrl: 'https://repo.gozle.com.tm/eportalback/${widget.post.image}',
                    width: double.infinity,
                    height: 325,
                    fit: BoxFit.cover,
                    placeholderBuilder: (c) => const DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 325,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.secondaryColor,
                        ),
                        child:  Text(
                          widget.post.categoryName,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.redColor,
                        ),
                        child: Row(
                          children: [
                            AppIcons.eye.svgPicture(
                              height: 16,
                              color: AppColors.whiteColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.post.view.toString(),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 15,
                  child: GestureDetector(
                    onTap: () {
                      if (isFavoritePost()) {
                        ref.read(favoriteStorageDataProvider.notifier).removeFavorite(widget.post.id);
                      } else {
                        ref.read(favoriteStorageDataProvider.notifier).addFavorite(widget.post);
                      }
                      saved = true;
                      updateUi();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                      child: AppIcons.bookmark.svgPicture(
                          height: 20,
                          color: isFavoritePost() ? AppColors.redColor : AppColors.whiteColor,),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.post.title,
                    style: appThemeData.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.post.description,
                    style: appThemeData.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      if (!await launchUrl(Uri.parse(widget.post.sourceLink))) {
                        throw Exception('Could not launch ${widget.post.sourceLink}');
                      }
                    },
                    child: Text(widget.post.sourceTitle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
