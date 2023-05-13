import 'package:flutter/material.dart';

import 'shimmer_container.dart';

class ShimmerBinnerList extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const ShimmerBinnerList(
      {Key? key, required this.child, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (c, i) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ShimmerContainer(
            borderRadius: 20,
            width: MediaQuery.of(context).size.width * 0.75,
            height: double.infinity,
          ),
        );
      },
    );
  }
}
