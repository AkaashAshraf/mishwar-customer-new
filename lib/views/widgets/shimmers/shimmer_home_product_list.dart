import 'package:flutter/material.dart';
import 'package:gronik/views/widgets/shimmers/shimmer_container.dart';

class ShimmerHomeProductList extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const ShimmerHomeProductList(
      {Key? key, required this.isLoading, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, i) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: ShimmerContainer(
            borderRadius: 20,
            height: 120,
            width: 120,
          ),
        );
      },
    );
  }
}
