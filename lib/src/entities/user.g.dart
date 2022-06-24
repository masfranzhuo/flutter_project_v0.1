// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map json) => $checkedCreate(
      r'_$_User',
      json,
      ($checkedConvert) {
        final val = _$_User(
          id: $checkedConvert('id', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          firstName: $checkedConvert('firstName', (v) => v as String),
          lastName: $checkedConvert('lastName', (v) => v as String),
          picture: $checkedConvert('picture', (v) => v as String),
          gender: $checkedConvert('gender', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          dateOfBirth: $checkedConvert(
              'dateOfBirth', (v) => dateTimeFromJson(v as String?)),
          registerDate: $checkedConvert(
              'registerDate', (v) => dateTimeFromJson(v as String?)),
          location: $checkedConvert(
              'location',
              (v) => v == null
                  ? null
                  : Location.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'firstName': instance.firstName,
    'lastName': instance.lastName,
    'picture': instance.picture,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gender', instance.gender);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('dateOfBirth', dateTimeToJson(instance.dateOfBirth));
  writeNotNull('registerDate', dateTimeToJson(instance.registerDate));
  writeNotNull('location', instance.location?.toJson());
  return val;
}
