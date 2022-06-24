import 'package:flutter_project/core/utils/formater.dart';
import 'package:flutter_project/src/entities/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(
    checked: true,
    anyMap: true,
    includeIfNull: false,
    explicitToJson: true,
  )
  factory User({
    required String id,
    required String title,
    required String firstName,
    required String lastName,
    required String picture,
    String? gender,
    String? email,
    String? phone,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
        required DateTime? dateOfBirth,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
        required DateTime? registerDate,
    Location? location,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
