import 'package:flutter/material.dart';
import 'package:gronik/views/widgets/shimmers/shimmer_single_product.dart';

import '../../../constants/app_sizes.dart';

class ShimmerProductHorizontalList extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const ShimmerProductHorizontalList(
      {Key? key, required this.isLoading, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }
    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, i) => AppSizes.wGap10,
        itemBuilder: (_, i) {
          return ShimmerSingleProduct();
        });
  }
}
