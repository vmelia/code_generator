
import '../generators.dart';

class CodeGenerator {
  CodeGenerator({
    required this.className,
    required this.visitor,
  });

  final String className;
  final ModelVisitor visitor;
  final buffer = StringBuffer();

  @override
  String toString() => buffer.toString();

  void generateClassHeader() {
    buffer.writeln('class $className {');
    visitor.fields.forEach((key, value) => buffer.writeln('final $value $key;'));
  }

  void generateConstructor() {
    buffer.writeln();
    buffer.writeln('const $className({');
    visitor.fields.forEach((key, value) {
      buffer.writeln('required this.$key,');
    });
    buffer.writeln('});');
  }

  void generateCopyWith() {
    buffer.writeln();
    buffer.writeln('$className copyWith({');
    visitor.fields.forEach((key, value) {
      buffer.writeln('$value? $key,');
    });
    buffer.writeln('}) =>');
    buffer.writeln('$className(');
    visitor.fields.forEach((key, value) {
      buffer.writeln("$key: $key ?? this.$key,");
    });
    buffer.writeln(');');
  }

  void generateToMap() {
    buffer.writeln();
    buffer.writeln('Map<String, dynamic> toMap() => {');
    visitor.fields.forEach((key, value) {
      buffer.writeln("'$key': $key,");
    });
    buffer.writeln('};');
  }

  void generateFromMap() {
    buffer.writeln();
    buffer.writeln('factory $className.fromMap(Map<String, dynamic> map) => $className(');
    visitor.fields.forEach((key, value) {
      buffer.writeln("$key: map['$key'],");
    });
    buffer.writeln(');');
  }

  void generateClassFooter() {
    buffer.writeln('}');
  }
}
