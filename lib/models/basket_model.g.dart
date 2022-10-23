// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasketItem _$$_BasketItemFromJson(Map<String, dynamic> json) =>
    _$_BasketItem(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BasketItemToJson(_$_BasketItem instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
