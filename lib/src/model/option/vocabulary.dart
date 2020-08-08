import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'vocabulary.g.dart';

/// Identifier for the vocabulary to use.
class Vocabulary extends EnumClass {
  const Vocabulary._(String name) : super(name);

  /// (Default) A 550,000-term vocabulary of English words and multiword
  /// expressions is used.
  static const Vocabulary basic = _$basic;

  /// Specifies a 500,000-term vocabulary of words from Spanish-language books
  static const Vocabulary es = _$es;

  /// Specifies an approximately million-term vocabulary of article titles from
  /// the English-language Wikipedia updated monthly.
  static const Vocabulary enwiki = _$enwiki;

  static BuiltSet<Vocabulary> get values => _$values;

  static Vocabulary valueOf(String name) => _$valueOf(name);

  @override
  String toString() => name;
}
