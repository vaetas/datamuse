import 'package:datamuse/src/model/relation_type.dart';
import 'package:meta/meta.dart';

@immutable
class LexicalRelation {
  final LexicalRelationType type;
  final String parameter;

  LexicalRelation({this.type, this.parameter});

  String get typeQuery => 'rel_$type';

  @override
  String toString() => 'LexicalRelation{type: $type, parameter: $parameter}';
}
