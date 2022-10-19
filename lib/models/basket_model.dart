import 'package:inventory_1/models/product.dart';

class BasketItem {
  Product product;
  double quantity;

  BasketItem({required this.product, required this.quantity});

  Map<String, dynamic> toJson() {
    return {"id": product.id, "quantity": quantity};
  }
}
