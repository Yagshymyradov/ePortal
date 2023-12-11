import 'json_http_client.dart';
import 'response.dart';

extension Endpoint on Never {
  static const String news = 'api/v1/news';

  static const String newsTrend = 'api/v1/news/trend';

  static String newsByCategoriesName(String categoryName) => 'api/v1/news?category=$categoryName';

  static const String categories = 'api/v1/categories';

  static String updateView(String id) => 'api/v1/news/updateView/$id';
}

class ApiClient {
  final JsonHttpClient _httpClient;

  ApiClient(this._httpClient);

  Future<Posts> getPosts() {
    return _httpClient.get(
      Endpoint.news,
      mapper: (dynamic data) => Posts.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<List<ItemPost>> getTrendPosts() {
    return _httpClient.get(
      Endpoint.newsTrend,
      mapper: (dynamic data) => (data as List<dynamic>)
          .map((dynamic e) => ItemPost.fromJson(e as Map<String, dynamic>))
          .toList(growable: false),
    );
  }

  Future<Posts> getPostsByCategoryName(String categoryName) {
    return _httpClient.get(
      Endpoint.newsByCategoriesName(categoryName),
      mapper: (dynamic data) => Posts.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<List<Categories>> getCategories() {
    return _httpClient.get(
      Endpoint.categories,
      mapper: (dynamic data) => (data as List<dynamic>)
          .map((dynamic e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(growable: false),
    );
  }

  Future<void> updatePostView(String id) {
    return _httpClient.put<void>(
      Endpoint.updateView(id),
      needDecodeBody: false,
      mapper: (dynamic data) {
        //no-op
      },
    );
  }
}
