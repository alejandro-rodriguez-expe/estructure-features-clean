import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/typedefs.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

@freezed
class PostEntity with _$PostEntity {

  factory PostEntity({
    @Default('') id,
    @Default('') title,
    @Default('') body,
  }) = _PostEntity;

  factory PostEntity.fromJson(Json json) => _$PostEntityFromJson(json);
}