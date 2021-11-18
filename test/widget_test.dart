// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:get_form/main.dart';
import 'package:get_form/todos/providers/todo_provider.dart';
import 'package:get_form/todos/service/todo_service.dart';

void main() {
  final todoProvider = Get.put(TodoProvider());
  final service = Get.put(TodoService());

  setUp(() {
    todoProvider.httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';
    todoProvider.httpClient.maxAuthRetries = 2;
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
//Provider Get Posts
  test('Get All List Provider', () async {
    final listDatas = await todoProvider.get('todos');
    expect(listDatas, isNotNull);
  });

//Service Get Posts
  test('Get All List service', () async {
    final listDatas = await service.getTodos();
    expect(listDatas, isNotNull);
  });

// Service Post
  test('Post Service', () async {
    final res = await service.postTodo();
    expect(res.body, isNotNull);
  });

// Service Put
  test('Put Service', () async {
    final res = await service.putTodo();
    expect(res.body, isNotNull);
  });

// Service Delete
  test('Delete Service', () async {
    await service.deleteTodo();
  });
}
