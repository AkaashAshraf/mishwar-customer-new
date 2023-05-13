import 'package:flutter/material.dart';
import 'package:gronik/constants/app_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  const ShimmerContainer({
    Key? key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Shimmer(
        duration: Duration(seconds: 1), //Default value
        interval: Duration(seconds: 1), //Default value: Duration(seconds: 0)
        color: Colors.black, //Default value
        colorOpacity: 0, //Default value
        enabled: true, //Default value
        direction: ShimmerDirection.fromLTRB(), //Default Value
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.PRIMARY_COLOR_LIGHT.withOpacity(.1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

class ShimmerImage extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  const ShimmerImage({
    Key? key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Shimmer(
        duration: Duration(seconds: 1), //Default value
        interval: Duration(seconds: 1), //Default value: Duration(seconds: 0)
        color: Colors.black, //Default value
        colorOpacity: 0, //Default value
        enabled: true, //Default value
        direction: ShimmerDirection.fromLTRB(), //Default Value
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.PRIMARY_COLOR_LIGHT.withOpacity(.1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Image.asset('assets/images/categories/bakery.png'),
        ),
      ),
    );
  }
}
