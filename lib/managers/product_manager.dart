import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/basket_model.dart';
import '../models/product.dart';

class ProductManager with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> _productCollection =
      _firebaseFirestore.collection("products");
  final CollectionReference<Map<String, dynamic>> _ordersCollection =
      _firebaseFirestore.collection("orders");
  final CollectionReference<Map<String, dynamic>> _itemsCollection =
      _firebaseFirestore.collection("items");

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
  Future<bool> addProduct(ProductDTO product) async {
    bool result = false;
    setIsLoading(true);

    await _productCollection.doc().set({
      "name": product.name,
      "type": product.type,
      "price": product.price,
      "quantity": product.quantity,
      "unit": product.unit,
      "lowOnStock": product.lowOnStock,
      "createdAt": FieldValue.serverTimestamp()
    }).then((_) {
      result = true;
      setMessage('Product added successfully');
    }).catchError((onError) {
      setMessage('#####$onError');
      result = false;
      setIsLoading(false);
    }).timeout(const Duration(seconds: 10), onTimeout: () {
      setMessage('Timeout');
      setIsLoading(false);
    });
    return result;
  }

//CREATE ITEM
  Future<bool> addItem({required String name, required String type}) async {
    bool result = false;
    setIsLoading(true);

    await _itemsCollection.doc().set({"name": name, "type": type}).then((_) {
      result = true;
      setMessage('Item Created successfully');
    }).catchError((onError) {
      setMessage('#####$onError');
      result = false;
      setIsLoading(false);
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      setMessage('Timeout');
      setIsLoading(false);
    });
    return result;
  }

  //CREATE ORDER
  Future<bool> addOrder(Map<String, dynamic> basket, double? totalAmount,
      double? quantity) async {
    bool result = false;
    setIsLoading(true);

    await _ordersCollection.doc().set({
      "orderQuantity": quantity,
      "orderDetails": basket,
      "total": totalAmount,
      "createdAt": FieldValue.serverTimestamp()
    }).then((_) {
      result = true;
      setMessage('added successfully');
      setIsLoading(false);
    }).catchError((onError) {
      setMessage('#####$onError');
      result = false;
      setIsLoading(false);
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      setMessage('Timeout');
      setIsLoading(false);
    });
    return result;
  }

  //ORDER PRODUCT DETAILS
  Future<Map<String, dynamic>?> getProductInfo(String productId) async {
    Map<String, dynamic>? productData;
    await _productCollection
        .doc(productId)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> product) {
      if (product.exists) {
        productData = product.data();
      } else {
        productData = null;
      }
    });
    return productData;
  }

  //READ TRANSACTIONS
  Stream<QuerySnapshot<Map<String, dynamic>?>> getTransaction() {
    return _ordersCollection.orderBy('createdAt', descending: true).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSpecificTransactions(
      DateTime start, DateTime end) {
    return _ordersCollection
        .where('createdAt', isGreaterThanOrEqualTo: start)
        .where('createdAt', isLessThanOrEqualTo: end)
        .snapshots();
  }

  //READ ALL PRODUCTS
  Stream<QuerySnapshot<Map<String, dynamic>?>> getAllProducts() {
    return _productCollection.snapshots();
  }

  //READ ALL PRODUCTS
  Stream<QuerySnapshot<Map<String, dynamic>?>> getAllSalesProducts() {
    return _productCollection.where('quantity', isGreaterThan: 0).snapshots();
  }

  // Future<QuerySnapshot<Map<String, dynamic>>> getTotal() {

  //   return _productCollection.get().then((value) {
  //     return value;
  //   });
  // }

  //READ SINGLE PRODUCT
  Stream<DocumentSnapshot<Map<String, dynamic>>> getProduct(
      {required String docID}) {
    return _productCollection.doc(docID).snapshots();
  }

  //READ  LOW ON STOCK
  Stream<QuerySnapshot<Map<String, dynamic>>> getLowStock(
      {required int lowInStock}) {
    return _productCollection
        .where('quantity', isLessThanOrEqualTo: lowInStock)
        .snapshots();
  }

  //OUT OF STOCK
  Stream<QuerySnapshot<Map<String, dynamic>>> getOutOfStock() {
    return _productCollection.where('quantity', isEqualTo: 0).snapshots();
  }

//READ PRODUCTS BASED ON STOCK
  Stream<QuerySnapshot<Map<String, dynamic>?>> getStock(int? value) {
    return _productCollection
        .where("quantity", isLessThanOrEqualTo: value)
        .snapshots();
  }

  //READ PRODUCTS BASED ON STOCK
  Stream<QuerySnapshot<Map<String, dynamic>?>> getRecent() {
    return _productCollection
        .orderBy("createdAt", descending: true)
        .limit(3)
        .snapshots();
  }

//UPDATE PRODUCT
  Future<bool> updateProduct(
      {required String docID, double? price, double? quantity}) async {
    Map<String, dynamic> data = <String, dynamic>{
      "price": price,
      "quantity": quantity
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

  //DELETE ITEM
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
