import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/image_profile_card.dart';
import 'package:git_users_app/layers/presentation/views/components/profile_card.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('ProfileCard correctly displays the user and profile image',
      (WidgetTester tester) async {
    final user = UserDto(
      login: 'testuser',
      avatarUrl: 'https://example.com/avatar.png',
    );

    await tester.pumpWidget(mockNetworkImagesFor(() => MaterialApp(
        home: Scaffold(
            body: ProfileCard(
                user: UserDto(
                    login: 'testuser',
                    avatarUrl: 'https://example.com/avatar.png'))))));

    expect(find.text(user.login), findsOneWidget);

    final imageFinder = find.byType(ImageProfileCard);
    expect(imageFinder, findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(Image), findsOneWidget);
  });
}
