// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      orderDetails: (json['orderDetails'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, BasketItem.fromJson(e as Map<String, dynamic>)),
      ),
      orderQuantity: (json['orderQuantity'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'orderDetails':
          instance.orderDetails.map((k, e) => MapEntry(k, e.toJson())),
      'orderQuantity': instance.orderQuantity,
      'total': instance.total,
    };
