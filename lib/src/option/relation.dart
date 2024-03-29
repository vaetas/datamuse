import 'package:datamuse/src/option/relation_type.dart';

/// Define lexical relation for words in result.
class LexicalRelation {
  const LexicalRelation({
    required this.type,
    required this.value,
  });

  final LexicalRelationType type;
  final String value;

  String get typeQuery => 'rel_$type';

  @override
  String toString() => 'LexicalRelation{type: $type, value: $value}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LexicalRelation &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          value == other.value;

  @override
  int get hashCode => type.hashCode ^ value.hashCode;
}
