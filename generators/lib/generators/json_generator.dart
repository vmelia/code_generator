import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../model_visitor.dart';

class JsonGenerator extends GeneratorForAnnotation<EntityDefinition> {
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

    // Class
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
    buffer.writeln('}) =>');
    buffer.writeln('$className(');
    visitor.fields.forEach((key, value) {
      buffer.writeln("$key: $key ?? this.$key,");
    });
    buffer.writeln(');');

    // TO MAP
    buffer.writeln();
    buffer.writeln('Map<String, dynamic> toMap() => {');
    visitor.fields.forEach((key, value) {
      buffer.writeln("'$key': $key,");
    });
    buffer.writeln('};');

    // FROM MAP
    buffer.writeln();
    buffer.writeln('factory $className.fromMap(Map<String, dynamic> map) => $className(');
    visitor.fields.forEach((key, value) {
      buffer.writeln("$key: map['$key'],");
    });
    buffer.writeln(');');

    buffer.writeln('}');
    return buffer.toString();
  }
}
