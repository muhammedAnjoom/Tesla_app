import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/size_config.dart';
import 'package:furniture_app/view/home/components/body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // it help us to make our ui resposive
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/menu.svg",height: 20,),
      ),
      actions: <Widget>[
        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/scan.svg",height: 24,),
        ),
        Center(child: Text("Scan",style: TextStyle(color: kTextColor,fontWeight: FontWeight.bold),)),
        SizedBox(width: SizeConfig.defaultSize,)
      ],
    );
  }
}
