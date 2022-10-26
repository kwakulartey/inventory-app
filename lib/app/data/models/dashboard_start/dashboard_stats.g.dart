// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DashboardStats _$$_DashboardStatsFromJson(Map<String, dynamic> json) =>
    _$_DashboardStats(
      totalProductCount: json['totalProductCount'] as int,
      lowOnStockProductsCount: json['lowOnStockProductsCount'] as int,
      outOfStockProductsCount: json['outOfStockProductsCount'] as int,
      dailySales: (json['dailySales'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DashboardStatsToJson(_$_DashboardStats instance) =>
    <String, dynamic>{
      'totalProductCount': instance.totalProductCount,
      'lowOnStockProductsCount': instance.lowOnStockProductsCount,
      'outOfStockProductsCount': instance.outOfStockProductsCount,
      'dailySales': instance.dailySales,
    };
