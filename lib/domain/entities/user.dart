import 'package:freezed_annotation/freezed_annotation.dart';
import 'bank.dart';
import 'address.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String uid,
    required String name,
    required String email,
    required String phone,
    String? pin,
    String? imageUrl,
    @Default([]) List<Bank>? banks,
    List<Address>? address,
    @Default({}) Map<String, dynamic> image,
    @Default(false) bool verification,
    @Default(0) balance,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
