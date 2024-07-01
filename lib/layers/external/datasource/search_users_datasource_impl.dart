import 'package:dio/dio.dart';
import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart';

class SearchUsersDatasourceImpl implements SearchUsersDatasource {
  final httpClient = Dio();

  SearchUsersDatasourceImpl() {
    httpClient.options.baseUrl = 'https://api.github.com/search';
    httpClient.options.headers = {'Authorization': ''};
  }

  @override
  Future<Map<String, dynamic>> call(String path) async {
    var response = await httpClient.get(path);

    return response.data;
  }
}
