
import '../../domain/entity/post_entity.dart';
import '../../domain/repositories/post_repositoy.dart';
import '../datasource/remote/post_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl(this.postDataSource);

  final PostDataSource postDataSource;

  @override
  Future<List<PostEntity>> getPost() {
    return postDataSource.getPost();
  }
}
