import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/indicators.dart';
import '../../components/large_post_tile_widget.dart';
import '../../components/small_post_tile_widget.dart';
import '../../providers.dart';
import '../../utils/extensions.dart';
import '../../utils/theme.dart';

final postsProvider = FutureProvider((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return apiClient.getPosts();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(postsProvider);
        },
        child: items.when(
          skipLoadingOnRefresh: false,
          data: (data) {
            //TODO fix it
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Top',
                      style: appThemeData.textTheme.displayLarge,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 6, 0),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: data.news
                          .mapIndexed(
                            (e, i) => LargePostTileWidget(
                              post: data,
                              index: i,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'All',
                      style: appThemeData.textTheme.displayLarge,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  sliver: SliverList.separated(
                    itemCount: data.news.length,
                    itemBuilder: (context, index) {
                      return SmallPostTileWidget(post: data.news[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          error: (error, stack) => NoConnectionIndicator(
            onRefreshButtonTab: () => ref.invalidate(postsProvider),
          ),
          loading: () => const HomePageLoadingIndicator(),
        ),
      ),
    );
  }
}
