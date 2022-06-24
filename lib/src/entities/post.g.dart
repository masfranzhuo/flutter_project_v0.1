// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map json) => $checkedCreate(
      r'_$_Post',
      json,
      ($checkedConvert) {
        final val = _$_Post(
          id: $checkedConvert('id', (v) => v as String),
          text: $checkedConvert('text', (v) => v as String),
          image: $checkedConvert('image', (v) => v as String),
          likes: $checkedConvert('likes', (v) => v as int? ?? 0),
          tags: $checkedConvert('tags',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          publishDate: $checkedConvert(
              'publishDate', (v) => dateTimeFromJson(v as String?)),
          owner: $checkedConvert(
              'owner',
              (v) => v == null
                  ? null
                  : User.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'text': instance.text,
    'image': instance.image,
    'likes': instance.likes,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags);
  writeNotNull('publishDate', dateTimeToJson(instance.publishDate));
  writeNotNull('owner', instance.owner?.toJson());
  return val;
}
