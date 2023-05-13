import 'package:flutter/material.dart';
import 'package:gronik/views/widgets/shimmers/shimmer_container.dart';

import '../../../constants/app_sizes.dart';

class ShimmerSingleProduct extends StatelessWidget {
  const ShimmerSingleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerContainer(
          height: 170,
          width: 150,
        ),
        AppSizes.hGap15,
        ShimmerContainer(
          height: 15,
          width: 100,
          borderRadius: 0,
        ),
        AppSizes.hGap5,
        SizedBox(
          width: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(
                    height: 10,
                    width: 70,
                    borderRadius: 0,
                  ),
                  AppSizes.hGap5,
                  ShimmerContainer(
                    height: 10,
                    width: 40,
                    borderRadius: 0,
                  ),
                ],
              ),
              ShimmerContainer(
                height: 35,
                width: 35,
                borderRadius: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
