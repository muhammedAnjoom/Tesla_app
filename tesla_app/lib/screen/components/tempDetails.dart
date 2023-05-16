import 'package:flutter/material.dart';

import '../../constanis.dart';
import '../../controller/home_controller.dart';
import 'TempButton.dart';

class TempDetailis extends StatelessWidget {
  const TempDetailis({
    super.key,
    required HomeController controller,
  }) : _controller = controller;

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                const SizedBox(
                  width: defaultPadding,
                ),
                TempBtn(
                  isActive: _controller.isCoolSelected,
                  svgSrc: "assets/icons/coolShape.svg",
                  title: "Cool",
                  press: _controller.updateCoolSelectTap,
                  activeColor: primaryColor,
                  // isActive: true,
                ),
                const SizedBox(
                  width: defaultPadding,
                ),
                TempBtn(
                  isActive: !_controller.isCoolSelected,
                  svgSrc: "assets/icons/heatShape.svg",
                  title: "Hot",
                  press: _controller.updateCoolSelectTap,
                  activeColor: redColor,
                  // isActive: true,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _controller.tempCountAdd();
                },
                icon: const Icon(
                  Icons.arrow_drop_up,
                  size: 48,
                ),
              ),
               Text(
                "${_controller.count.toString()}" "\u2103",
                style: const TextStyle(fontSize: 86),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _controller.tempCountDown();
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 48,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text("CURRENT TEMPERATUE"),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Inside".toUpperCase()),
                  Text(
                    "20" "\u2103",
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "outside".toUpperCase(),
                    style: const TextStyle(color: Colors.white54),
                  ),
                  Text(
                    "35" "\u2103",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white54,
                        ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}