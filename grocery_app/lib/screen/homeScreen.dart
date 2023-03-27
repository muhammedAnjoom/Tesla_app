import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constrains) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: constrains.maxHeight * 0.1,
                ),
                child: SvgPicture.asset(
                  "assets/icons/Car.svg",
                  width: double.infinity,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
