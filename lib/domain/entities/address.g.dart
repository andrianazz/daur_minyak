// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: json['id'] as String,
      street: json['street'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      postcode: json['postcode'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'postcode': instance.postcode,
    };
