import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/constanis.dart';

import '../bottomNavigationBar.dart';
import '../controller/home_controller.dart';
import 'door_lock.dart';

class HomeScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  void setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0.0, 0.5),
    );
  }

  @override
  void initState() {
    setupBatteryAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        // this animation need listenable
        animation: Listenable.merge([_controller, _batteryAnimationController]),
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigatorBar(
              onTap: (index) {
                if (index == 1)
                  _batteryAnimationController.forward();
                else if (_controller.selectedBottomTab == 1 && index != 1)
                  _batteryAnimationController.reverse(from: 0.7);
                _controller.onBottomNavigationTabChanges(index);
              },
              selectedTap: _controller.selectedBottomTab,
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
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.04
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updateRightDoorLock,
                          isLock: _controller.isRightDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.04
                          : constrains.maxWidth / 2.5,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updateLeftDoorLock,
                          isLock: _controller.isLeftDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: _controller.selectedBottomTab == 0
                          ? constrains.maxHeight * 0.13
                          : constrains.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updateTopDoorLock,
                          isLock: _controller.isTopDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: _controller.selectedBottomTab == 0
                          ? constrains.maxHeight * 0.17
                          : constrains.maxHeight / 2.3,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updateBottomDoorLock,
                          isLock: _controller.isBottomDoorLock,
                        ),
                      ),
                    ),
                    // Battery
                    Opacity(
                      opacity: _animationBattery.value,
                      child: SvgPicture.asset(
                        "assets/icons/Battery.svg",
                        width: constrains.maxWidth * 0.45,
                      ),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "220 mi",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.white),
                        ),
                        const Text(
                          "62%",
                          style: TextStyle(fontSize: 24),
                        ),
                        const Spacer(),
                        Text(
                          "Charging".toUpperCase(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Text(
                          "18 min remaining",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: constrains.maxHeight * 0.14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [Text("22 mi/hr"), Text("232 v")],
                          ),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        )
                      ],
                    )
                  ],
                );
              }),
            ),
          );
        });
  }
}
