// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:_4_media_in_flutter/main.dart';

void main() {
  testWidgets('Verify images and text in the app', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the network image is present.
    expect(find.byType(Image), findsNWidgets(2));
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is Image &&
            widget.image is NetworkImage &&
            (widget.image as NetworkImage).url ==
                'https://avatars.githubusercontent.com/u/117913120?v=4'),
        findsOneWidget);

    // Verify that the asset image is present.
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName == 'assets/img.jpeg'),
        findsOneWidget);

    // Verify that the text is present.
    expect(find.text('Abhiraj Chaudhuri Image Practical 4'), findsOneWidget);
  });
}
