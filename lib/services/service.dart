import "dart:async";
import 'package:dependencies/dependencies.dart';
import "package:http/http.dart" as http;
import "dart:convert";

abstract class Service<M> {
  Future<M> getOne(int id);
  Future<List<M>> getAll();
}

abstract class RestServiceBase<M> implements Service<M> {
  final Injector _injector;
  final String _endpoint;
  String get _root => "${_injector.get<String>(name: "api_root")}/$_endpoint";

  RestServiceBase(this._injector, this._endpoint);

  @override
  Future<M> getOne(int id) async {
    final url = "$_root/$id";
    final response = await _call(url) as Map;
    return toModel(response);
  }

  @override
  Future<List<M>> getAll() async {
    final url = _root;
    final response = await _call(url) as List;
    return response.map((r) => toModel(r)).toList();
  }

  _call(String uri) async {
    final response = await http.get(uri);
    return json.decode(response.body);
  }

  M toModel(Map map);

}