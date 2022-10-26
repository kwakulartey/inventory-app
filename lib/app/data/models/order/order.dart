import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_1/app/data/models/basket/basket_model.dart';
import 'package:inventory_1/app/utils/helpers.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  factory Order({
    // TODO: Created at tiemstamp

    required String id,
    required Map<String, BasketItem> orderDetails,
    required double orderQuantity,
    required double total,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
        Timestamp? createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
