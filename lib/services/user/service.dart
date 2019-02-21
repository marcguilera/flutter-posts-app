import "package:dependencies/dependencies.dart";
import 'models.dart';
import '../service.dart';

abstract class UserService implements Service <User> {}

class UserRestService extends RestServiceBase<User> implements UserService {
  UserRestService(Injector injector) : super(injector, "users");
  @override
  User toModel(Map map) => User.fromMap(map);
}