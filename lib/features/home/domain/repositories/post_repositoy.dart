import '../entity/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getPost();
}
