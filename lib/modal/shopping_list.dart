class ShoppingModel {
  final int? id;
  final String itemName;
  final int quantity;
  final String category;
  final bool purchased;

  ShoppingModel({this.id, required this.itemName, required this.quantity, required this.category, required this.purchased});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': itemName,
      'quantity': quantity,
      'category': category,
      'purchased': purchased ? 1 : 0,
    };
  }

  factory ShoppingModel.fromMap(Map<String, dynamic> map) {
    return ShoppingModel(
      id: map['id'],
      itemName: map['itemName'],
      quantity: map['quantity'],
      category: map['category'],
      purchased: map['purchased'] == 1,
    );
  }
}
