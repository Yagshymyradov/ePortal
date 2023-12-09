import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../screens/category_screen/category_screen.dart';
import '../utils/extensions.dart';
import '../utils/theme.dart';
import 'buttons.dart';


final categoryProvider = FutureProvider.autoDispose((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return apiClient.getCategories();
});

class FilterById extends ConsumerStatefulWidget {
  const FilterById({
    super.key,
  });

  @override
  ConsumerState<FilterById> createState() => _FilterByStatusState();
}

class _FilterByStatusState extends ConsumerState<FilterById> {
  final controller = ScrollController();
  int selectedType = 0;

  void onTypeSelected(BuildContext context, int i) {
    ref.read(selectedCategoryProvider.notifier).state = i;

    if (i == selectedType) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 300),
      alignment: 0.5,
    );

    selectedType = i;
    setState(() {
      //no-op
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = ref.watch(categoryProvider);
    return category.when(
      data: (data) => SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: data.mapIndexed((e, i) {
            final isSelected = selectedType == i;
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Builder(
                builder: (context) => SmallButton(
                  onTap: () => onTypeSelected(context, i),
                  title: e.name,
                  textColor: AppColors.whiteColor,
                  backgroundColor: isSelected ? AppColors.primaryColor : AppColors.hardDarkColor,
                  borderColor: isSelected ? null : AppColors.greyColor,
                ),
              ),
            );
          }).toList(),
        ),
      ),
      error: (error, stack) =>Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
