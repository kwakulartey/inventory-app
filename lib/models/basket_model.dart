import 'package:inventory_1/models/product.dart';

class BasketItem {
  Product product;
  int quantity;

  BasketItem({required this.product, required this.quantity});

  Map<String, dynamic> toJson() {
    return {"id": product.id, "quantity": quantity};
  }
}
