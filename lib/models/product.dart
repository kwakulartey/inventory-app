
import 'package:cloud_firestore/cloud_firestore.dart';


class Product {
  String? id;
  String? name;
  String? type;
  double? price;
  double? quantity;
  String? unit;
  Timestamp? createdAt;
  int? productId;
  int? lowOnStock;

  Product(
      {this.id,
      this.name,
      this.type,
      this.price,
      this.quantity,
      this.unit,
      this.createdAt,
      this.productId,
      this.lowOnStock});

  Product.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "type": this.type,
      "price": this.price,
      "quantity": this.quantity,
      "unit": unit,
      "createdAt": this.createdAt,
      "productId": this.productId
    };
  }
}
