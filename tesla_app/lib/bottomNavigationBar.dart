import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/constanis.dart';

class TeslaBottomNavigatorBar extends StatelessWidget {
  const TeslaBottomNavigatorBar({
    super.key,
    required this.selectedTap,
    required this.onTap,
  });
  final int selectedTap;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      currentIndex: selectedTap,
      backgroundColor: Colors.black,
      items: List.generate(
        newIconSrc.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            newIconSrc[index],
            color: index == selectedTap ? primaryColor : Colors.white54,
          ),
          label: "",
        ),
      ),
    );
  }
}

List<String> newIconSrc = [
  "assets/icons/Lock.svg",
  "assets/icons/Charge.svg",
  "assets/icons/Temp.svg",
  "assets/icons/Tyre.svg",
];
