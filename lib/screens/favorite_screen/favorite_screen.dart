import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../components/small_post_tile_widget.dart';
import '../../data/favorite_controller.dart';

final getAllFavoritesProvider = Provider((ref) {
  final storageData = ref.watch(favoriteStorageDataProvider);
  return storageData ?? [];
});

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(getAllFavoritesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? Text('Poka bos')
          : ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return SmallPostTileWidget(post: favorites[index]);
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                );
              },
            ),
    );
  }
}
