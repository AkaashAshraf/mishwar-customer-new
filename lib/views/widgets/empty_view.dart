import 'package:flutter/material.dart';
import 'package:gronik/views/theme/text_theme.dart';

class EmptyView extends StatelessWidget {
  final String text;
  const EmptyView({Key? key, this.text = 'No item found!'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Text(
          text,
          style: AppText.placeholder1,
        ),
      ),
    );
  }
}
