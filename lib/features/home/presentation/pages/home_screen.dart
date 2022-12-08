import 'package:design_test_app/features/home/domain/entities/category_entity.dart';
import 'package:design_test_app/features/home/domain/entities/restaurant_entity.dart';
import 'package:design_test_app/features/home/presentation/widgets/category_box.dart';
import 'package:design_test_app/features/home/presentation/widgets/custome_app_bar.dart';
import 'package:design_test_app/features/home/presentation/widgets/food_search_box.dart';
import 'package:design_test_app/features/home/presentation/widgets/promo_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../widgets/restaurant_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: Category.categories.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryBox(category: Category.categories[index]);
                },
              ),
            ).paddingAll(8.0),
            SizedBox(
              height: 125,
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PromoBox();
                },
              ),
            ).paddingAll(8.0),
            FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Top Rated',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: Restaurant.restaurants.length,
                itemBuilder: (context, index) {
              return RestaurantBox(restaurant: Restaurant.restaurants[index]);
            }),
          ],
        ),
      ),
    );
  }
}
