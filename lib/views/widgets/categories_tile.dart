import 'package:flutter/material.dart';
import 'package:gronik/config/api_urls.dart';
import 'package:gronik/model/category.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../theme/text_theme.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({
    Key? key,
    required this.category,
    // required this.categoryName,
    // required this.imageLocation,
    this.onTap,
  });
  final Category category;
  // final String categoryName;
  // final String imageLocation;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            /* <---- Image ----> */
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 21),
              decoration: BoxDecoration(
                color: AppColors.APP_GREEN,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "${imageBaseUrl}category/${category.image}",
                    fit: BoxFit.cover,
                  )),
            ),
            /* <---- Text ----> */
            AppSizes.hGap5,
            Expanded(
              child: Text(
                category.name ?? "",
                style: AppText.paragraph1.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
