class Product {
  String? id;
  late String name;
  late String descraption;
  late String imagePath;
  late String categoryId;
  late int quantity;
  late int price;
  Product(
      {required this.name,
      required this.descraption,
      required this.imagePath,
      required this.categoryId,
      required this.quantity,
      required this.price});

  Product.fromMap(Map<String, dynamic> json) {
    this.name = json['name'];
    this.descraption = json['description'];
    this.price = json['price'];
    this.quantity = json['quantity'];
    this.categoryId = json['categoryId'];
    this.imagePath = 'assets/products/p1.jpg';
  }
}
