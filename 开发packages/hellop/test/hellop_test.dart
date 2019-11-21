import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hellop/hellop.dart';

void main() {
  const MethodChannel channel = MethodChannel('hellop');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Hellop.platformVersion, '42');
  });
}
