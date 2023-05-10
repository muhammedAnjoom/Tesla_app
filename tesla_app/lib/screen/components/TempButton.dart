import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constanis.dart';

class TempBtn extends StatelessWidget {
  const TempBtn(
      {super.key,
      this.isActive = false,
      required this.press,
      required this.svgSrc,
      required this.title});

  final String svgSrc, title;
  final bool isActive;
  final press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInBack,
            width: isActive ? 76 : 50,
            height: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              color: isActive ? primaryColor : Colors.white38,
            ),
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
                fontSize: 16,
                color: Colors.white30,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
            child: Text(
              title.toUpperCase(),
            ),
          )
        ],
      ),
    );
  }
}