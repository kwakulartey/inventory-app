import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String id,
    required String name,
    String? type,
    required double price,
    double? quantity,
    String? unit,
    // @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    //      Timestamp? createdAt,
    required double lowOnStock,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

Timestamp timestampFromJson(dynamic val) => Timestamp.fromDate(val);
FieldValue timestampToJson(dynamic val) => FieldValue.serverTimestamp();

@freezed
class ProductDTO with _$ProductDTO {
  factory ProductDTO({
    required String name,
    String? type,
    required double price,
    double? quantity,
    String? unit,
    required double lowOnStock,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);
}
