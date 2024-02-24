import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:generators/annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../generators.dart';

class EntityGenerator extends GeneratorForAnnotation<EntityDefinition> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final className = annotation.read('className').literalValue as String;
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final codeGenerator = CodeGenerator(className: className, visitor: visitor);

    codeGenerator.generateClassHeader();
    codeGenerator.generateConstructor();

    codeGenerator.generateCopyWith();
    codeGenerator.generateToMap();
    codeGenerator.generateFromMap();

    codeGenerator.generateClassFooter();
  
    return codeGenerator.toString();
  }
}
