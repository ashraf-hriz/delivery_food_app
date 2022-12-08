import 'package:design_test_app/features/home/domain/entities/menu_items_entity.dart';
import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;

  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  Restaurant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.distance,
    required this.menuItems,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, imageUrl, name, tags, deliveryTime, deliveryFee, distance,menuItems];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      imageUrl:
          'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      name: 'Golden Ice Gelato Artigianale',
      tags: const ['Italian', 'Dessert', 'Ice Cream'],
      menuItems: MenuItem.menuItems.where((item) => item.restaurantId==1).toList(),
      deliveryFee: 2.99,
      deliveryTime: 30,
      distance: 0.1,
    ),
    Restaurant(
      id: 2,
      imageUrl:
          'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      name: 'Golden Ice Gelato Artigianale',
      tags: const ['Italian', 'Dessert', 'Ice Cream'],
      menuItems: MenuItem.menuItems.where((item) => item.restaurantId==2).toList(),
      deliveryFee: 2.99,
      deliveryTime: 30,
      distance: 0.1,
    ),
    Restaurant(
      id: 3,
      imageUrl:
          'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      name: 'Golden Ice Gelato Artigianale',
      tags: const ['Italian', 'Dessert', 'Ice Cream'],
      menuItems: MenuItem.menuItems.where((item) => item.restaurantId==3).toList(),
      deliveryFee: 2.99,
      deliveryTime: 30,
      distance: 0.1,
    ),
    Restaurant(
      id: 4,
      imageUrl:
      'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      name: 'Golden Ice Gelato Artigianale',
      tags: const ['Italian', 'Dessert', 'Ice Cream'],
      menuItems: MenuItem.menuItems.where((item) => item.restaurantId==4).toList(),
      deliveryFee: 2.99,
      deliveryTime: 30,
      distance: 0.1,
    ),
  ];
}
