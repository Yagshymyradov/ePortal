import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../components/fliter_by_status.dart';
import '../../components/indicators.dart';
import '../../components/small_post_tile_widget.dart';
import '../../data/response.dart';
import '../../providers.dart';
import '../../utils/theme.dart';

final selectedCategoryProvider = StateProvider((ref) => 0);

final postByIdProvider = FutureProvider.family.autoDispose((ref, String categoryName) {
  final apiClient = ref.watch(apiClientProvider);
  return apiClient.getPostsByCategoryName(categoryName);
});

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final category = ref.watch(categoryProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final categoryValue = category.asData?.value;

    if (categoryValue == null) {
      return const CategoryPageLoadingIndicator();
    }

    final postById = ref.watch(postByIdProvider(categoryValue[selectedCategory].name));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(postByIdProvider);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              titleSpacing: 0,
              stretch: true,
              backgroundColor: AppColors.hardDarkColor,
              snap: true,
              floating: true,
              title: category.when(
                data: (data) => const FilterById(),
                error: (error, stack) => Text(error.toString()),
                loading: () => const CategoryPageLoadingIndicator(),
              ),
            ),
            SliverToBoxAdapter(
              child: postById.when(
                skipLoadingOnRefresh: false,
                data: (data) => ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                error: (error, stack) => NoConnectionIndicator(
                  onRefreshButtonTab: () => ref.invalidate(postByIdProvider),
                ),
                loading: () => const SmallPostLoadingIndicator(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
