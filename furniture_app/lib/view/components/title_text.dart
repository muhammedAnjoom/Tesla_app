import 'package:flutter/material.dart';

import '../../size_config.dart';

class TitleText extends StatelessWidget {
  TitleText({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return Text(
      title,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: defaultSize * 1.6),
    );
  }
}
