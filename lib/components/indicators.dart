import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/theme.dart';

class HomePageLoadingIndicator extends StatelessWidget {
  const HomePageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerLoading(height: 25, width: 50),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerLoading(
                        width: 250,
                        height: 260,
                      ),
                      SizedBox(height: 10),
                      ShimmerLoading(
                        height: 20,
                      ),
                      SizedBox(height: 10),
                      ShimmerLoading(
                        width: 250,
                        height: 20,
                      ),
                      SizedBox(height: 10),
                      ShimmerLoading(
                        width: 200,
                        height: 10,
                      ),
                      SizedBox(height: 10),
                      ShimmerLoading(
                        width: 250,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const ShimmerLoading(
            width: 50,
            height: 20,
          ),
          const SizedBox(height: 10),
          ...List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ShimmerLoading(
                          height: 10,
                        ),
                        const SizedBox(height: 10),
                        ShimmerLoading(
                          height: 10,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                        const SizedBox(height: 10),
                        ShimmerLoading(
                          height: 10,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: ShimmerLoading(
                      width: 120,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryPageLoadingIndicator extends StatelessWidget {
  const CategoryPageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerLoading(height: 25),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: ShimmerLoading(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ...List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ShimmerLoading(
                            height: 10,
                          ),
                          const SizedBox(height: 10),
                          ShimmerLoading(
                            height: 10,
                            width: MediaQuery.sizeOf(context).width,
                          ),
                          const SizedBox(height: 10),
                          ShimmerLoading(
                            height: 10,
                            width: MediaQuery.sizeOf(context).width,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: ShimmerLoading(
                        width: 120,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallPostLoadingIndicator extends StatelessWidget {
  const SmallPostLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ShimmerLoading(
                          height: 10,
                        ),
                        const SizedBox(height: 10),
                        ShimmerLoading(
                          height: 10,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                        const SizedBox(height: 10),
                        ShimmerLoading(
                          height: 10,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: ShimmerLoading(
                      width: 120,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  final double? width;
  final double? height;

  const ShimmerLoading({
    super.key,
    this.width = 100,
    this.height = 35,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
        colors: [
          AppColors.whiteColor,
          AppColors.primaryColor,
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.greyColor,
        ),
        width: width,
        height: height,
      ),
    );
  }
}

class NoConnectionIndicator extends StatelessWidget {
  final VoidCallback? onRefreshButtonTab;

  const NoConnectionIndicator({
    super.key,
    this.onRefreshButtonTab,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onRefreshButtonTab,
        child: const Text('Refresh'),
      ),
    );
  }
}
