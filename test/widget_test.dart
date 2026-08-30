import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_batch16/main.dart';

void main() {
  testWidgets('task manager shows stats and supports adding tasks',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Task Manager'), findsOneWidget);
    expect(find.text('Total Tasks'), findsOneWidget);
    expect(find.text('Completed Tasks'), findsOneWidget);
    expect(find.text('Pending Tasks'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const ValueKey('taskTitleField')), 'Write report');
    await tester.enterText(find.byKey(const ValueKey('taskDescriptionField')),
        'Prepare the project summary');
    await tester.tap(find.text('Save Task'));
    await tester.pumpAndSettle();

    expect(find.text('Write report'), findsOneWidget);
    expect(find.text('1'), findsWidgets);
    expect(find.text('No tasks yet'), findsNothing);
  });
}
