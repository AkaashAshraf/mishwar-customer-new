import 'package:flutter/cupertino.dart';
import 'package:gronik/constants/app_colors.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: AppColors.PRIMARY_COLOR,
      ),
    );
  }
}
