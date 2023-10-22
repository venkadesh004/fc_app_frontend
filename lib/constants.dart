import 'package:flutter/cupertino.dart';

class Items {
  String itemName;
  String itemImg;
  bool offer;
  int discount;
  int price;
  String storeName;

  Items({required this.itemImg, required this.itemName, required this.price, this.offer = false, this.discount = 0, required this.storeName});
}

List<Items> specials = [
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 1'),
  Items(itemImg: 'assets/images/food-image-2.png', itemName: 'Single Burger', price: 20, storeName: 'Store 2'),
  Items(itemImg: 'assets/images/food-image-2.png', itemName: 'Single Burger', offer: true, discount: 10, price: 20, storeName: 'Store 1'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 1'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 2'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', offer: true, discount: 20, price: 20, storeName: 'Store 1'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 2'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 2'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 3'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 3'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 3'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 3'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20, storeName: 'Store 3'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Single Burger', price: 20, storeName: 'Store 3'),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', offer: true, discount: 20, price: 20, storeName: 'Store 1'),
];

class SelectedItems extends Items {
  int quantity;

  SelectedItems({required this.quantity, required super.itemImg, required super.itemName, required super.price, required super.storeName});
}

List<SelectedItems> orders = [];
int orderPrice = 0;

const String storeNumber = '1234567890';
const String storePassword = '1234';

String userNumber = '8610475929';
String userPassword = '1234';
