import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class JsonGenerator extends GeneratorForAnnotation<Entity> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final className = annotation.read('className').literalValue as String;

    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();
    buffer.writeln('class $className {');

    visitor.fields.forEach((key, value) {
      buffer.writeln('final $value $key;');
    });

    // Constructor
    buffer.writeln();
    buffer.writeln('const $className({');
    visitor.fields.forEach((key, value) {
      buffer.writeln('required this.$key,');
    });
    buffer.writeln('});');

    // copyWith
    buffer.writeln();
    buffer.writeln('$className copyWith({');
    visitor.fields.forEach((key, value) {
      buffer.writeln('$value? $key,');
    });

    buffer.writeln('}) {');
    buffer.writeln('return $className(');
    visitor.fields.forEach((key, value) {
      buffer.writeln("$key: $key ?? this.$key,");
    });
    buffer.writeln(');');
    buffer.writeln('}');

    // TO MAP
    buffer.writeln();
    buffer.writeln('Map<String, dynamic> toMap() {');
    buffer.writeln('return {');
    visitor.fields.forEach((key, value) {
      buffer.writeln("'$key': $key,");
    });
    buffer.writeln('};');
    buffer.writeln('}');

    // FROM MAP
    buffer.writeln();
    buffer.writeln('factory $className.fromMap(Map<String, dynamic> map) {');
    buffer.writeln('return $className(');
    visitor.fields.forEach((key, value) {
      buffer.writeln("$key: map['$key'],");
    });
    buffer.writeln(');');
    buffer.writeln('}');
    buffer.writeln('}');

    return buffer.toString();
  }
}
