import 'package:design_test_app/core/icons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String description;

  final String imageUrl;
  final int index;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.index,
  });

  @override
  List<Object?> get props => [id, name, description, imageUrl, index];

  static List<Category> categories = [
    Category(
      id: 1,
      name: 'Drinks',
      description: 'This is test description',
      imageUrl: AppIcons.juiceIcon,
      index: 0,
    ),
    Category(
      id: 2,
      name: 'Pizza',
      description: 'This is test description',
      imageUrl: AppIcons.pizzaIcon,
      index: 1,
    ),
    Category(
      id: 3,
      name: 'Burgers',
      description: 'This is test description',
      imageUrl: AppIcons.burgerIcon,
      index: 2,
    ),
    Category(
      id: 4,
      name: 'Desserts',
      description: 'This is test description',
      imageUrl: AppIcons.pancakeIcon,
      index: 3,
    ),
    Category(
      id: 5,
      name: 'Salads',
      description: 'This is test description',
      imageUrl: AppIcons.avocadoIcon,
      index: 4,
    ),
  ];
}
