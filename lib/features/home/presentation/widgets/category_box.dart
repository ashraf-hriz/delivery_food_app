import 'package:design_test_app/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(
        right: 5,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 60,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Image.asset(category.imageUrl),
          ),
          const Spacer(),
          Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8,),
        ],
      ),
    );
  }
}
