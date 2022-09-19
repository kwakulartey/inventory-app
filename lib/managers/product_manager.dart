import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/product.dart';

class PostManager with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

      final CollectionReference<Map<String, dynamic>> _productCollection =
      _firebaseFirestore.collection("products");
      final CollectionReference<Map<String, dynamic>> _transactionCollection =
      _firebaseFirestore.collection("transaction");

      String _message = '';
  bool _isLoading = false;
  String get message => _message;
  bool get isLoading => _isLoading;

  setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  setIsLoading(bool loading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  //CREATE PRODUCT
  Future<bool> addProduct(Product product) async {
    bool result = false;
    setIsLoading(true);

    await _productCollection.doc().set({
      "name": product.name,
      "type": product.type,
      "costPrice": product.price,
      "quantity": product.quantity,
      "productId": product.productId,
    }).then((_) {
      result = true;
      setMessage('Product added successfully');
    }).catchError((onError) {
      setMessage('#####' + onError.toString());
      result = false;
      setIsLoading(false);
    }).timeout(const Duration(seconds: 10), onTimeout: () {
      setMessage('Timeout');
      setIsLoading(false);
    });
    return result;
  }
}
