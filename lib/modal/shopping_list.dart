
class Shopping {
  String id;
  String name;
  int quantity;
  double price;

  Shopping({required this.id, required this.name, required this.quantity, required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }

  factory Shopping.fromMap(Map<String, dynamic> map) {
    return Shopping(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? 0,
      price: map['price'] ?? 0.0,
    );
  }
}
