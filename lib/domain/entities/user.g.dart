// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      pin: json['pin'] as String?,
      imageUrl: json['imageUrl'] as String?,
      banks: (json['banks'] as List<dynamic>?)
              ?.map((e) => Bank.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as Map<String, dynamic>? ?? const {},
      verification: json['verification'] as bool? ?? false,
      balance: json['balance'] ?? 0,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'pin': instance.pin,
      'imageUrl': instance.imageUrl,
      'banks': instance.banks,
      'address': instance.address,
      'image': instance.image,
      'verification': instance.verification,
      'balance': instance.balance,
    };
