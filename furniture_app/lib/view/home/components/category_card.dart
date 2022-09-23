import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/categories.dart';
import '../../../size_config.dart';
import '../../components/title_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: defaultSize * 20.5,
        height: 230,
        child: AspectRatio(
          aspectRatio: 0.04,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // This is custom shape that why we need to use clippath
              ClipPath(
                clipper: CategoryCustomShap(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondaryColor,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TitleText(
                            title: category.title!,
                          ),
                          SizedBox(
                            height: defaultSize,
                          ),
                          Text(
                            "${category.numOfProducts}+ products",
                            style:
                                TextStyle(color: kTextColor.withOpacity(0.6)),
                          )
                        ]),
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 1.15,
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/icons/loading.gif",
                      image: category.image!,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Text("error image");
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShap extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);

    // path.lineTo(width, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
