import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_1/models/basket_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  factory OrderModel({
    // TODO: Created at tiemstamp
    required Map<String, BasketItem> orderDetails,
    required double orderQuantity,
    required double total,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
