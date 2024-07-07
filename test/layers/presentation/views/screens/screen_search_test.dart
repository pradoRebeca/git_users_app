void main() {}

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart';
// import 'package:git_users_app/layers/data/repositories/search_users_repository_impl.dart';
// import 'package:git_users_app/layers/domain/usecases/search_users/search_users_usecase_impl.dart';
// import 'package:git_users_app/layers/presentation/controller/search_controller.dart';
// import 'package:git_users_app/layers/presentation/views/components/filter_bottom_sheet.dart';
// import 'package:git_users_app/layers/presentation/views/screens/search_user_screen.dart';
// import 'package:mockito/annotations.dart';
// import 'screen_search_test.mocks.dart';

// @GenerateMocks([SearchUsersDatasource],
//     customMocks: [MockSpec<Map<String, dynamic>>()])
// void main() {
//   final SearchUsersDatasource searchUsersDatasource =
//       MockSearchUsersDatasource();
//   final SearchUsersRepositoryImpl searchUsersRepositoryImpl =
//       SearchUsersRepositoryImpl(searchUsersDatasource);
//   final SearchUsersUsecaseImpl searchUsersUsecaseImpl =
//       SearchUsersUsecaseImpl(searchUsersRepositoryImpl);

//   setUp(() {
//     Get.put(SearchUserController(searchUsersUsecaseImpl));
//   });

//   tearDown(() {
//     Get.delete<SearchUserController>();
//   });

//   Future pumpHomeScreen(WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(home: SearchScreen()));
//   }

//   testWidgets('SearchScreen - build right', (WidgetTester tester) async {
//     await pumpHomeScreen(tester);

//     expect(find.byType(SearchScreen), findsOneWidget);
//     expect(find.byType(AppBar), findsOneWidget);
//     expect(find.byType(Scaffold), findsOneWidget);
//   });

//   testWidgets('SearchScreen - should build FilterBottomSheet if click icon',
//       (WidgetTester tester) async {
//     await pumpHomeScreen(tester);

//     await tester.tap(find.byIcon(Icons.tune));
//     await tester.pumpAndSettle();

//     expect(find.byType(FilterBottomSheet), findsOneWidget);
//   });
// }