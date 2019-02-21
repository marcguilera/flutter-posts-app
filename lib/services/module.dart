import "package:dependencies/dependencies.dart";
import "comment/service.dart";
import "post/service.dart";
import "user/service.dart";

class ServiceModule implements Module {
  @override
  void configure(Binder binder) {
    binder
      ..bindSingleton("https://jsonplaceholder.typicode.com", name: "api_root")
      ..bindLazySingleton<PostService>((i, p) => PostRestService(i))
      ..bindLazySingleton<UserService>((i, p) => UserRestService(i))
      ..bindLazySingleton<CommentService>((i, p) => CommentRestService(i));
  }
}