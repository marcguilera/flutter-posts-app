import 'package:flutter/material.dart';
import 'ui/post/post_list.dart';
import 'package:dependencies_flutter/dependencies_flutter.dart';
import 'package:dependencies/dependencies.dart';
import 'services/module.dart';

void main() => runApp(PostApp());

class PostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InjectorWidget(
          injector: Injector.fromModule(module: ServiceModule()),
          child: MaterialApp(
            title: 'post app',
            theme: ThemeData.dark(),
            home: PostList(),
          )
      )
    );
  }
}
