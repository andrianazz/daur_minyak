import 'package:freezed_annotation/freezed_annotation.dart';

part 'picker.freezed.dart';
part 'picker.g.dart';

@freezed
class Picker with _$Picker {
  const factory Picker({
    required String id,
    required String name,
    required String phone,
    String? imageUrl,
    required String license,
  }) = _Picker;

  factory Picker.fromJson(Map<String, dynamic> json) => _$PickerFromJson(json);
}
