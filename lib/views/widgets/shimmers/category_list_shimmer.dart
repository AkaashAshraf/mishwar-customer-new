import 'package:flutter/material.dart';
import 'package:gronik/views/widgets/shimmers/shimmer_container.dart';

import '../../../constants/app_sizes.dart';

class ShimmerCategoryList extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const ShimmerCategoryList(
      {Key? key, required this.child, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, i) {
        return SimmerCategoriesTile();
      },
    );
  }
}

class SimmerCategoriesTile extends StatelessWidget {
  const SimmerCategoriesTile({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          /* <---- Image ----> */
          ShimmerContainer(
            width: 100,
            height: 100,
            // padding: EdgeInsets.symmetric(vertical: 25, horizontal: 21),
            // decoration: BoxDecoration(
            //   color: AppColors.APP_GREEN,
            //   borderRadius: BorderRadius.circular(15),
            // ),
            // child: ClipRRect(
            //     borderRadius: BorderRadius.circular(8.0),
            //     child: Image.network(
            //       "${URLs.imageBaseUrl}category/${category.image}",
            //       fit: BoxFit.cover,
            //     )),
          ),
          /* <---- Text ----> */
          AppSizes.hGap5,
          ShimmerContainer(
            width: 80,
            height: 10,
          ),
        ],
      ),
    );
  }
}
