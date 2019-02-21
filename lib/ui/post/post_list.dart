import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../services/post/models.dart';
import '../../services/post/service.dart';
import 'package:dependencies_flutter/dependencies_flutter.dart';

class PostList extends StatelessWidget with InjectorWidgetMixin {

  @override
  Widget buildWithInjector(BuildContext context, Injector injector) {
    final posts = injector.get<PostService>();
    return Scaffold(
      body: FutureBuilder<List<Post>>(
          future: posts.getAll(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return _ErrorMessage();
            }
            if (snapshot.hasData) {
              return _FullPostList(posts: snapshot.data);
            }
            if (snapshot.data.isEmpty) {
              return _EmptyMessage();
            }
            return _LoadingMessage();
          }
      ),
    );
  }
}

class _Centered extends StatelessWidget {
  final Widget top;
  final Widget bottom;

  const _Centered({Key key, this.top, this.bottom}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            top,
            Container(
                height: 30
            ),
            bottom
          ],
        )
    );
  }
}

class _LoadingMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Centered(
      top: CircularProgressIndicator(),
      bottom: Text('Loading...'),
    );
  }

}

class _EmptyMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Centered(
      top: Icon(Icons.info),
      bottom: Text("No posts to show.")
    );
  }

}

class _ErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Centered(
      top: Icon(Icons.error),
      bottom: Text('There was an error!')
    );
  }

}

class _FullPostList extends StatelessWidget {
  final List<Post> posts;
  const _FullPostList({Key key, this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: posts.map((post) => _Post(post: post)).toList()
    );
  }
}

class _Post extends StatelessWidget {
  final Post post;

  const _Post({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          )
        ],
      ),
    );
  }

}