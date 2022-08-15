import 'package:flutter_project/core/config/general_config.dart';
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
    @JsonKey(fromJson: DateConfig.dateTimeFromJson, toJson: DateConfig.dateTimeToJson)
        required DateTime? dateOfBirth,
    @JsonKey(fromJson: DateConfig.dateTimeFromJson, toJson: DateConfig.dateTimeToJson)
        required DateTime? registerDate,
    String? gender,
    String? email,
    String? phone,
    Location? location,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
