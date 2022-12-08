import 'package:dartz/dartz.dart';
import 'package:design_test_app/features/home/domain/entities/restaurant_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantBox extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantBox({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: Get.width,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(restaurant.imageUrl),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    '${restaurant.deliveryTime} min',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 5,),
            Row(
              children: restaurant.tags
                  .map((tag) =>
                      restaurant.tags.indexOf(tag) == restaurant.tags.length - 1
                          ? Text(
                              tag,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          : Text(
                              '$tag, ',
                              style: Theme.of(context).textTheme.bodyText1,
                            ))
                  .toList(),
            ),
            const SizedBox(height: 5,),
            Text(
              '${restaurant.distance}km - \$${restaurant.deliveryFee} delivery fee',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        )
      ],
    ).paddingAll(8);
  }
}
