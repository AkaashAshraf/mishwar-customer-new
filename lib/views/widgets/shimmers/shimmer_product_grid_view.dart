import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gronik/views/widgets/shimmers/shimmer_single_product.dart';

import '../empty_view.dart';

class ShimmerProductGridView extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final List<dynamic> list;
  const ShimmerProductGridView(
      {Key? key,
      required this.isLoading,
      required this.child,
      required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      if (list.isEmpty) {
        return EmptyView();
      }
      return child;
    }
    return Container(
      color: Colors.white,
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          staggeredTileBuilder: (ti) => StaggeredTile.fit(2),
          itemCount: 8,
          itemBuilder: (context, index) {
            return ShimmerSingleProduct();
          }),
    );
  }
}
