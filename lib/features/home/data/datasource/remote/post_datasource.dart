import 'package:dio/dio.dart';

import '../../../../../core/typedefs.dart';
import '../../../domain/entity/post_entity.dart';

abstract class PostDataSource {
  Future<List<PostEntity>> getPost();
}

class PostDataSourceImpl extends PostDataSource {
  PostDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<PostEntity>> getPost() async {
    try {
      final res = await dio.get('/posts');
      return List<Json>.from(res.data)
          .map((e) => PostEntity.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
