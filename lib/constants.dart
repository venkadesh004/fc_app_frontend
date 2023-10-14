class Items {
  String itemName;
  String itemImg;
  bool offer;
  int discount;
  int price;

  Items({required this.itemImg, required this.itemName, required this.price, this.offer = false, this.discount = 0});
}

List<Items> specials = [
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20),
  Items(itemImg: 'assets/images/food-image-2.png', itemName: 'Single Burger', price: 20),
  Items(itemImg: 'assets/images/food-image-2.png', itemName: 'Single Burger', offer: true, discount: 10, price: 20),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', offer: true, discount: 20, price: 20),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20),
  Items(itemImg: 'assets/images/food-image-1.png', itemName: 'Burger Combo', price: 20),
];

class SelectedItems extends Items {
  int quantity;

  SelectedItems({required this.quantity, required super.itemImg, required super.itemName, required super.price});
}

List<SelectedItems> orders = [];
int orderPrice = 0;