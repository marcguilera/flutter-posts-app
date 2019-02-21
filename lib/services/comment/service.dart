import 'package:dependencies/dependencies.dart';

import 'models.dart';
import '../service.dart';

abstract class CommentService implements Service <Comment> {}

class CommentRestService extends RestServiceBase<Comment> implements CommentService {
  CommentRestService(Injector injector) : super(injector, "comments");
  @override
  Comment toModel(Map map) => Comment.fromMap(map);
}