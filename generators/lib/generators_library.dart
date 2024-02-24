library generators_library;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'generators.dart';

Builder generateEntityClass(BuilderOptions options) => SharedPartBuilder([EntityGenerator()], 'entity_generator');
