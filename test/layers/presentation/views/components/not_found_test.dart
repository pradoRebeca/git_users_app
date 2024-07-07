import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  testWidgets('SvgPicture show picture', (WidgetTester tester) async {
    const String svgPath = 'assets/images/not_found.svg';

    await tester.pumpWidget(SvgPicture.asset(svgPath));

    expect(find.svgAssetWithPath(svgPath), findsOneWidget);
  });
}
