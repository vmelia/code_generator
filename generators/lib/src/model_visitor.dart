import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:generators/src/dynamic_extensions.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, dynamic> fields = {};

  @override
  void visitConstructorElement(ConstructorElement element) {
    className = element.returnType.removeAsterisks();
  }

  @override
  void visitFieldElement(FieldElement element) {
    fields[element.name] = element.type.removeAsterisks();
  }
}
