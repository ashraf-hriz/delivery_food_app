import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FoodSearchBox extends StatelessWidget {
  const FoodSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Text(
                  'What would you like to eat?',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Spacer(),
                Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          width: 50,
          height: 43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white
          ),
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu,color: Theme.of(context).colorScheme.primary,),
          ),
        ),
      ],
    ).paddingAll(8);
  }
}
