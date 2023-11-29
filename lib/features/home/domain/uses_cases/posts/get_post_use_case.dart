import '../../../../../core/usecase/usecase.dart';
import '../../entity/post_entity.dart';
import '../../repositories/post_repositoy.dart';

class GetPostUseCase implements UseCase<List<PostEntity>, void> {
  GetPostUseCase(this.postRepository);

  final PostRepository postRepository;
  @override
  Future<List<PostEntity>> call({void params}) {
    return postRepository.getPost();
  }
}
