import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart';
import 'package:git_users_app/layers/data/repositories/search_users_repository_impl.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/domain/usecases/search_users_usecase_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../search_users_mock.dart';

@GenerateMocks([SearchUsersDatasource],
    customMocks: [MockSpec<Map<String, dynamic>>()])
import 'search_users_usecase_test.mocks.dart';

void main() {
  late final searchUsersDatasource = MockSearchUsersDatasource();
  final SearchUsersRepositoryImpl searchUsersRepositoryImpl =
      SearchUsersRepositoryImpl(searchUsersDatasource);
  final SearchUsersUsecaseImpl searchUsersUsecaseImpl =
      SearchUsersUsecaseImpl(searchUsersRepositoryImpl);

  final QuerySearchDto querySearchDto = QuerySearchDto(query: "Rebeca");

  test('Should response succsess', () async {
    when(searchUsersDatasource(any)).thenAnswer((_) async => mock);

    var response = await searchUsersUsecaseImpl(querySearchDto);

    expect(response.success, isTrue);
    expect(response.body, isA<List<UserDto>>());
  });

  test('Should response fail', () async {
    when(searchUsersDatasource(any)).thenThrow(Exception('ERROR'));

    var response = await searchUsersUsecaseImpl(querySearchDto);

    expect(response.success, isFalse);
    expect(response.body, null);
    expect(response.message, isA<String>());
  });
}
