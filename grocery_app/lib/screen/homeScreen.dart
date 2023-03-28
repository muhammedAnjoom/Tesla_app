import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        // this animation need listenable
        animation: _controller,
        builder: (context, _) {
          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.center,
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
                    Positioned(
                      right: constrains.maxWidth * 0.04,
                      child: GestureDetector(
                        onTap: _controller.updateRightDoorLock,
                        child: _controller.isRightDoorLock
                            ? SvgPicture.asset(
                                "assets/icons/door_lock.svg",
                              )
                            : SvgPicture.asset(
                                "assets/icons/door_unlock.svg",
                              ),
                      ),
                    ),
                    // Positioned(
                    //   left: constrains.maxWidth * 0.04,
                    //   child: GestureDetector(
                    //     onTap: _controller.updateLeftDoorLock,
                    //     child: _controller.isLeftDoorLock
                    //         ? SvgPicture.asset(
                    //             "assets/icons/door_lock.svg",
                    //           )
                    //         : SvgPicture.asset(
                    //             "assets/icons/door_unlock.svg",
                    //           ),
                    //   ),
                    // )
                  ],
                );
              }),
            ),
          );
        });
  }
}
