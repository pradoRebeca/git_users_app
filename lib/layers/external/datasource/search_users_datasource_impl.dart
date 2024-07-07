import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart';
import 'package:git_users_app/layers/shared/http_client_adapter.dart';

class SearchUsersDatasourceImpl implements SearchUsersDatasource {
  SearchUsersDatasourceImpl(this._client);
  final HttpClientAdapter _client;

  @override
  Future<Map<String, dynamic>> call(String path) async {
    var response = await _client.get(path);

    return response.data;
  }
}
