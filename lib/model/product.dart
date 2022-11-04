class Product {
  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.sellerId,
    required this.id,
  });

  String image;
  String title;
  String description;
  int? quantity;
  double price;
  String category;

  String sellerId;
  String id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        image: json["image"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        sellerId: json["sellerId"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "description": description,
        "price": price,
        "category": category,
        "sellerId": sellerId,
        "id": id,
      };
}
