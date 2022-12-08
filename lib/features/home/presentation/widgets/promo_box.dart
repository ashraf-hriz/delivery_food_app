import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width - 40,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ClipPath(
          clipper: PromoCustomClipper(),
          child: Container(
            width: Get.width - 40,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Free Delivery on your first 3 order',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Place an order of \$10 or more and delivery fee is on us',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                )
              ],
            ).paddingOnly(left: 15, top: 10, right: 125),
          ),
        ),
      ],
    );
  }
}

class PromoCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(220, size.height);
    path.lineTo(270, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}