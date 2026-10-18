
import 'package:bullpen/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Kid Investor app launches successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    expect(find.byType(MyApp), findsOneWidget);

    // Allow the scheduled splash-screen timers to finish.
    await tester.pump(const Duration(seconds: 4));
    await tester.pump();

  });
}
