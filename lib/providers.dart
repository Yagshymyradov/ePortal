import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/api_client.dart';
import 'data/json_http_client.dart';
import 'data/service/preferences.dart';

/// It is an error to use this provider without overriding it's value.
final appPrefsServiceProvider = Provider<AppPrefsService>(
  (ref) => throw UnimplementedError("Can't use this provider without overriding it's value."),
);

// final apiBaseUrlProvider = Provider((ref) => 'http://45.146.167.233:4003/');
final apiBaseUrlProvider = Provider((ref) => 'https://repo.gozle.com.tm/eportalback/');

final httpClientProvider = Provider(
  (ref) {
    final httpClient = JsonHttpClient();

    ref.listen(
      apiBaseUrlProvider,
      (previous, next) {
        final apiBaseUrl = next;
        httpClient.dio.options.baseUrl = apiBaseUrl;
      },
      fireImmediately: true,
    );

    return httpClient;
  },
  dependencies: [
    apiBaseUrlProvider,
    appPrefsServiceProvider,
  ],
);


final apiClientProvider = Provider(
  (ref) => ApiClient(ref.watch(httpClientProvider)),
  dependencies: [httpClientProvider],
);
