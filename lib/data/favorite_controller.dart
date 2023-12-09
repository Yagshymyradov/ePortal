import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'response.dart';
import 'service/locale_storage_repo.dart';

final favoritesRepositoryProvider = Provider<LocaleStorageRepo>((ref) => LocaleStorageRepo());

final favoriteStorageDataProvider = StateNotifierProvider<FavoritePostsController, List<ItemPost>?>(
  FavoritePostsController.new,
);

class FavoritePostsController extends StateNotifier<List<ItemPost>?> {
  LocaleStorageRepo? storageRepo;

  final StateNotifierProviderRef<dynamic, dynamic> ref;

  FavoritePostsController(this.ref) : super(null) {
    storageRepo = ref.read(favoritesRepositoryProvider);
    getFavorite();
  }

  void getFavorite() {
    state = storageRepo!.getFavoriteList();
  }

  void addFavorite(ItemPost post) {
    state = storageRepo!.addPostToFavoriteList(post);
  }

  void updateFavorite(ItemPost post) {
    state = storageRepo!.updateFavoriteList(post);
  }

  void removeFavorite(String id) {
    state = storageRepo!.removePostFromFavoriteList(id);
  }
}
