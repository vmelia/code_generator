import 'package:example/test_class.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedClass = TestClass(
    stringValue: 'string-value',
    boolValue: false,
    intValue: 99,
    doubleValue: 99.99,
    dateTimeValue: DateTime(1999, 12, 31),
  );

  final newClass = TestClass(
    stringValue: 'string-value2',
    boolValue: true,
    intValue: 11,
    doubleValue: 11.11,
    dateTimeValue: DateTime(2001, 01, 01),
  );

  late TestClass testClass;

  setUp(() {
    testClass = TestClass(
      stringValue: expectedClass.stringValue,
      boolValue: expectedClass.boolValue,
      intValue: expectedClass.intValue,
      doubleValue: expectedClass.doubleValue,
      dateTimeValue: expectedClass.dateTimeValue,
    );
  });

  group('test class', () {
    test('constructor', () {
      expect(testClass.stringValue, expectedClass.stringValue);
      expect(testClass.boolValue, expectedClass.boolValue);
      expect(testClass.intValue, expectedClass.intValue);
      expect(testClass.doubleValue, expectedClass.doubleValue);
      expect(testClass.dateTimeValue, expectedClass.dateTimeValue);
    });

    group('copyWith', () {
      test('no values', () {
        final newTestClass = testClass.copyWith();

        expect(newTestClass.stringValue, expectedClass.stringValue);
        expect(newTestClass.boolValue, expectedClass.boolValue);
        expect(newTestClass.intValue, expectedClass.intValue);
        expect(newTestClass.doubleValue, expectedClass.doubleValue);
        expect(newTestClass.dateTimeValue, expectedClass.dateTimeValue);
      });

      test('new values', () {
        final newTestClass = testClass.copyWith(
          stringValue: newClass.stringValue,
          boolValue: newClass.boolValue,
          intValue: newClass.intValue,
          doubleValue: newClass.doubleValue,
          dateTimeValue: newClass.dateTimeValue,
        );

        expect(newTestClass.stringValue, newClass.stringValue);
        expect(newTestClass.boolValue, newClass.boolValue);
        expect(newTestClass.intValue, newClass.intValue);
        expect(newTestClass.doubleValue, newClass.doubleValue);
        expect(newTestClass.dateTimeValue, newClass.dateTimeValue);
      });
    });

    test('toMap', () {
      final map = expectedClass.toMap();

      expect(map['stringValue'], expectedClass.stringValue);
      expect(map['boolValue'], expectedClass.boolValue);
      expect(map['intValue'], expectedClass.intValue);
      expect(map['doubleValue'], expectedClass.doubleValue);
      expect(map['dateTimeValue'], expectedClass.dateTimeValue);
    });

    test('fromMap', () {
      final map = <String, dynamic>{};
      map['stringValue'] = expectedClass.stringValue;
      map['boolValue'] = expectedClass.boolValue;
      map['intValue'] = expectedClass.intValue;
      map['doubleValue'] = expectedClass.doubleValue;
      map['dateTimeValue'] = expectedClass.dateTimeValue;

      final newTestClass = TestClass.fromMap(map);

      expect(newTestClass.stringValue, expectedClass.stringValue);
      expect(newTestClass.boolValue, expectedClass.boolValue);
      expect(newTestClass.intValue, expectedClass.intValue);
      expect(newTestClass.doubleValue, expectedClass.doubleValue);
      expect(newTestClass.dateTimeValue, expectedClass.dateTimeValue);
    });
  });
}
