// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as String,
      orderDetails: (json['orderDetails'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, BasketItem.fromJson(e as Map<String, dynamic>)),
      ),
      orderQuantity: (json['orderQuantity'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      createdAt: timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'orderDetails':
          instance.orderDetails.map((k, e) => MapEntry(k, e.toJson())),
      'orderQuantity': instance.orderQuantity,
      'total': instance.total,
      'createdAt': timestampToJson(instance.createdAt),
    };
