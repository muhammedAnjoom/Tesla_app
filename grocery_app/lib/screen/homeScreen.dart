import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/constanis.dart';

import '../bottomNavigationBar.dart';
import '../controller/home_controller.dart';
import 'door_lock.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,

  }) : super(key: key);

  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        // this animation need listenable
        animation: _controller,
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigatorBar(
              onTap: (index){},
              selectedTap: 0,
            ),
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
                      child: DoorLock(
                        press: _controller.updateRightDoorLock,
                        isLock: _controller.isRightDoorLock,
                      ),
                    ),
                    Positioned(
                      left: constrains.maxWidth * 0.04,
                      child: DoorLock(
                        press: _controller.updateLeftDoorLock,
                        isLock: _controller.isLeftDoorLock,
                      ),
                    ),
                    Positioned(
                      top: constrains.maxHeight * 0.13,
                      child: DoorLock(
                        press: _controller.updateTopDoorLock,
                        isLock: _controller.isTopDoorLock,
                      ),
                    ),
                    Positioned(
                      bottom: constrains.maxHeight * 0.17,
                      child: DoorLock(
                        press: _controller.updateBottomDoorLock,
                        isLock: _controller.isBottomDoorLock,
                      ),
                    )
                  ],
                );
              }),
            ),
          );
        });
  }
}
