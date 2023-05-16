import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/constanis.dart';

import '../bottomNavigationBar.dart';
import '../controller/home_controller.dart';
import 'components/TempButton.dart';
import 'components/batteryStatus.dart';
import 'components/door_lock.dart';
import 'components/tempDetails.dart';
import 'components/tyres.dart';

class HomeScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;

  late AnimationController _tempAnimationController;
  late Animation<double> _animationCarShift;
  late Animation<double> _animationTempShowInfo;
  late Animation<double> _animationCoolColor;

  void setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0.0, 0.4),
    );
    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0.5, 1),
    );
  }

  void setupTempAnimation() {
    _tempAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animationCarShift = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.2, 0.4),
    );
    _animationTempShowInfo = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.45, 0.65),
    );
    _animationCoolColor = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.7, 1),
    );
  }

  @override
  void initState() {
    setupBatteryAnimation();
    setupTempAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _tempAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        // this animation need listenable
        animation: Listenable.merge([
          _controller,
          _batteryAnimationController,
          _tempAnimationController
        ]),
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigatorBar(
              onTap: (index) {
                if (index == 1) {
                  _batteryAnimationController.forward();
                } else if (_controller.selectedBottomTab == 1 && index != 1) {
                  _batteryAnimationController.reverse(from: 0.7);
                }

                if (index == 2) {
                  _tempAnimationController.forward();
                } else if (_controller.selectedBottomTab == 2 && index != 2) {
                  _tempAnimationController.reverse(from: 0.4);
                }
                _controller.showTyreController(index);
                _controller.onBottomNavigationTabChanges(index);
              },
              selectedTap: _controller.selectedBottomTab,
            ),
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                    ),
                    Positioned(
                      left: constrains.maxWidth / 2 * _animationCarShift.value,
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: constrains.maxHeight * 0.1,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Car.svg",
                          width: double.infinity,
                        ),
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
                    Positioned(
                      top: 50 * (1 - _animationBatteryStatus.value),
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Opacity(
                        opacity: _animationBatteryStatus.value,
                        child: BatteryStatus(
                          constraints: constrains,
                        ),
                      ),
                    ),
                    // tmep
                    Positioned(
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      top: 60 * (1 - _animationTempShowInfo.value),
                      child: Opacity(
                        opacity: _animationTempShowInfo.value,
                        child: TempDetailis(controller: _controller),
                      ),
                    ),
                    Positioned(
                      right: -180 * (1 - _animationCoolColor.value),
                      child: AnimatedSwitcher(
                        duration: defaultDuration,
                        child: _controller.isCoolSelected
                            ? Image.asset(
                                "assets/images/Cool_glow_2.png",
                                opacity: AnimationController(
                                    vsync: this, value: 0.5),
                                width: 180,
                                key: UniqueKey(),
                              )
                            : Image.asset(
                                "assets/images/Hot_glow_4.png",
                                width: 180,
                                key: UniqueKey(),
                              ),
                      ),
                    )
                    // tyre
                    ,
                    if (_controller.isShowTyre) ...tyres(constrains),
                    GridView.builder(
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: defaultPadding,
                          crossAxisSpacing: defaultPadding,
                          childAspectRatio:
                              constrains.maxWidth / constrains.maxHeight),
                      itemBuilder: (context, index) => TyrePicase(isBottomTwoTyre: index>2,),
                    )
                  ],
                );
              }),
            ),
          );
        });
  }
}

class TyrePicase extends StatelessWidget {
  const TyrePicase({
    super.key, required this.isBottomTwoTyre,
  });

  final bool isBottomTwoTyre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(color: primaryColor, width: 2),
          borderRadius:
              const BorderRadius.all(Radius.circular(6))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          psiText(context),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "41\u2103",
            style: TextStyle(fontSize: 16),
          ),
          const Spacer(),
          Text(
            "Low".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            "Pressure".toUpperCase(),
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  Text psiText(BuildContext context,{required String text}) {
    return Text.rich(
          TextSpan(
              text: "23.6",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
              children: const [
                TextSpan(
                    text: "psi",
                    style: TextStyle(fontSize: 24))
              ]),
        );
  }
}
