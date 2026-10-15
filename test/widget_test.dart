import 'package:flutter_test/flutter_test.dart';
import 'package:graduation_project_app/main.dart';

void main() {
  testWidgets('shows the MindSpeak splash content', (tester) async {
    await tester.pumpWidget(const MindSpeakApp());

    expect(find.text('MindSpeak'), findsOneWidget);
    expect(find.text('Turning Brain Signals Into Words'), findsOneWidget);
    expect(find.text('Neural Interface Ready'), findsOneWidget);
  });
}
