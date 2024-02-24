import 'package:annotations/annotations.dart';

part 'test_class.g.dart';

@EntityDefinition('TestClass')
class TestClassDefinition {
  late String stringValue;
  late bool boolValue;
  late int intValue;
  late double doubleValue;
  late DateTime dateTimeValue;
}
