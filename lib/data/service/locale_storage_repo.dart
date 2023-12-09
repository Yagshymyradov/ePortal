import 'package:hive/hive.dart';

import '../response.dart';

class LocaleStorageRepo {
  String FavoritePost = 'favorite_post';

  final _hive = Hive.box<ItemPost>('favorite_post');


  LocaleStorageRepo();

  List<ItemPost> getFavoriteList() {
    return _hive.values.toList();
  }

  List<ItemPost> addPostToFavoriteList(ItemPost post) {
    _hive.add(post);
    return _hive.values.toList();
  }

  List<ItemPost> removePostFromFavoriteList(String id) {
    _hive.deleteAt(
      _hive.values.toList().indexWhere((element) => element.id == id),
    );
    return _hive.values.toList();
  }

  List<ItemPost> updateFavoriteList(ItemPost post) {
    _hive.put(FavoritePost, post);
    return _hive.values.toList();
  }

  void deleteAll() {
    _hive.clear();
  }
}
