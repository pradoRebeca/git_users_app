import 'package:flutter_test/flutter_test.dart';
import 'package:git_users_app/layers/domain/models/entities/screen_entity.dart';
import 'package:git_users_app/layers/presentation/controller/home_controller.dart';

void main() {
  group(
    'HomeController Test',
    () {
      late HomeController controller;

      setUp(
        () {
          controller = HomeController();
        },
      );

      test('getSelectedIndex - initial value should be 0', () {
        final int initialValue = controller.getSelectedIndex;

        expect(initialValue, 0);
      });

      test(
          'setSelectedIndex - call and send index equal 1 and selectedIndex should be 1',
          () {
        controller.setSelectedIndex(1);

        final int initialValue = controller.getSelectedIndex;

        expect(initialValue, 1);
      });

      test(
          'setSelectedIndex - value recevied index more than quantity screens, selectedIndex should be 0',
          () {
        controller.setSelectedIndex(5);

        final int initialValue = controller.getSelectedIndex;

        expect(initialValue, 0);
      });

      test('currentScreenData - should be match index and screen', () {
        controller.setSelectedIndex(0);

        var currentScreenData = controller.currentScreenData;

        expect(currentScreenData.title, 'Pesquisar');
      });

      test('screens - should be a list', () {
        controller.setSelectedIndex(0);

        var currentScreenData = controller.listScreens;

        expect(currentScreenData, isA<List<ScreenEntity>>());
      });
    },
  );
}
