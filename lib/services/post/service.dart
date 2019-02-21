import 'package:dependencies/dependencies.dart';

import 'models.dart';
import '../service.dart';

abstract class PostService implements Service<Post> {}

class PostRestService extends RestServiceBase<Post> implements PostService {
  PostRestService(Injector injector) : super(injector, "posts");
  @override
  Post toModel(Map map) => Post.fromMap(map);
}