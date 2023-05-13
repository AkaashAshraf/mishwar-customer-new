import 'package:flutter/material.dart';
import 'package:gronik/config/api_urls.dart';

class CustomImageView extends StatelessWidget {
  final String image;
  final String type;
  final BoxFit fit;
  const CustomImageView(
    this.image, {
    Key? key,
    this.fit = BoxFit.fill,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = "${URLs.imageBaseUrl}$type/$image";
    return FadeInImage(
      image: NetworkImage(url),
      placeholder: AssetImage('assets/images/others/image.png'),
      fit: fit,
      // progressIndicatorBuilder: (context, url, downloadProgress) =>
      //     ShimmerImage(),
      // errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
