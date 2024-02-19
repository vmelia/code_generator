// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_class.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

class TestClass {
  final String stringValue;
  final bool boolValue;
  final int intValue;
  final double doubleValue;
  final DateTime dateTimeValue;

  const TestClass({
    required this.stringValue,
    required this.boolValue,
    required this.intValue,
    required this.doubleValue,
    required this.dateTimeValue,
  });

  TestClass copyWith({
    String? stringValue,
    bool? boolValue,
    int? intValue,
    double? doubleValue,
    DateTime? dateTimeValue,
  }) {
    return TestClass(
      stringValue: stringValue ?? this.stringValue,
      boolValue: boolValue ?? this.boolValue,
      intValue: intValue ?? this.intValue,
      doubleValue: doubleValue ?? this.doubleValue,
      dateTimeValue: dateTimeValue ?? this.dateTimeValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stringValue': stringValue,
      'boolValue': boolValue,
      'intValue': intValue,
      'doubleValue': doubleValue,
      'dateTimeValue': dateTimeValue,
    };
  }

  factory TestClass.fromMap(Map<String, dynamic> map) {
    return TestClass(
      stringValue: map['stringValue'],
      boolValue: map['boolValue'],
      intValue: map['intValue'],
      doubleValue: map['doubleValue'],
      dateTimeValue: map['dateTimeValue'],
    );
  }
}
