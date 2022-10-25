import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:inventory_1/app/data/models/product/product.dart';

part 'basket_model.freezed.dart';
part 'basket_model.g.dart';

@unfreezed
class BasketItem with _$BasketItem {
  factory BasketItem({
    required Product product,
    required double quantity,
  }) = _BasketItem;

  factory BasketItem.fromJson(Map<String, dynamic> json) =>
      _$BasketItemFromJson(json);
}
