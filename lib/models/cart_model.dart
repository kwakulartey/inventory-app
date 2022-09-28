import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_1/models/product.dart';

class CartModel {
  CartModel(
      {this.id,
      this.name,
      this.type,
      this.price,
      this.quantity,
      this.isExit,
      this.time,
      this.product});

  int? id;
  String? name;
  String? type;
  int? quantity;
  double? price;
  bool? isExit;
  String? time;
  Product? product;

  factory CartModel.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      CartModel(
          id: doc.data()!['id'],
          name: doc.data()!['name'],
          type: doc.data()!['type'],
          price: doc.data()!['costPrice'],
          quantity: doc.data()!['quantity'],
          isExit: doc.data()!['isExit'],
          time: doc.data()!['time'],
          product: Product.fromDocumentSnapshot(doc.data()!['product']));

  Map<String, dynamic> toJson() => {
        'id':id,
        'name': name,
        'type': type,
        'price': price,
        'quantity': quantity,
        'isExit': isExit,
        'time': time,
        'product':product!.toJson()
      };
}
