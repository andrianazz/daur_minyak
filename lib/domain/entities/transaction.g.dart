// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String,
      uid: json['uid'] as String,
      title: json['title'] as String,
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      picker: json['picker'] == null
          ? null
          : Picker.fromJson(json['picker'] as Map<String, dynamic>),
      transactionType: json['transactionType'] as String?,
      methodType: json['methodType'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as int? ?? 0,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'title': instance.title,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'products': instance.products,
      'picker': instance.picker,
      'transactionType': instance.transactionType,
      'methodType': instance.methodType,
      'rating': instance.rating,
      'status': instance.status,
      'total': instance.total,
    };
