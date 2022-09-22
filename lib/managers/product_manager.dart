import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/product.dart';

class ProductManager with ChangeNotifier {
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
      "price": product.price,
      "quantity": product.quantity,
      "lowOnStock": product.lowOnStock,
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

  //READ ALL PRODUCTS
  Stream<QuerySnapshot<Map<String, dynamic>?>> getAllProducts()  {
    return _productCollection.snapshots();
  }

  

  //READ SINGLE PRODUCT
  Stream<DocumentSnapshot<Map<String, dynamic>>> getProduct(
      {required String docID}) {
    return _productCollection.doc(docID).snapshots();
  }

  //READ PRODUCT BASED ON IN-STOCK
  Stream<QuerySnapshot<Map<String, dynamic>>> getInStock(String stock) {
    return _productCollection
        .where(
          'lowOnStock', isEqualTo: stock
        )
        .snapshots();
  }

//UPDATE PRODUCT
  Future<bool> updateProduct({required String docID, Product? product}) async {
    Map<String, dynamic> data = <String, dynamic>{
      "price": product?.price,
      "quantity": product?.quantity
    };
    bool isUpdated = false;
    await _productCollection.doc(docID).update(data).then((value) {
      isUpdated = true;
      return value;
    }).catchError((onError) {
      setMessage(onError);
      setIsLoading(false);
      isUpdated = false;
    }).timeout(const Duration(seconds: 60), onTimeout: (() {
      setMessage("Check your internet connection");
      isUpdated = false;
    }));

    return isUpdated;
  }

  //DELETE ROOMS
  Future<bool> deletedProduct({required String docId}) async {
    bool isDeleted = false;
    await _productCollection.doc(docId).delete().then((value) {
      isDeleted = true;
      setMessage("Product deleted succefully");
    }).catchError((onError) {
      setMessage("Failed to delete product: $onError");
      setIsLoading(false);
      isDeleted = false;
    });
    return isDeleted;
  }
}
