import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'relation_type.g.dart';

///  Related word constraints: require that the results, when paired with the
///  word in this parameter, are in a predefined lexical relation indicated
///  by [code]. Any number of these parameters may be specified any number of
///  times. An assortment of semantic, phonetic, and corpus-statistics-based
///  relations are available. At this time, these relations are available for
///  English-language vocabularies only.
class LexicalRelationType extends EnumClass {
  const LexicalRelationType._(String name) : super(name);

  /// Popular nouns modified by the given adjective, per Google Books Ngrams
  /// example: gradual → increase
  static const LexicalRelationType jja = _$jja;

  /// Popular adjectives used to modify the given noun, per Google Books Ngrams
  /// example: beach → sandy
  static const LexicalRelationType jjb = _$jjb;

  /// Synonyms (words contained within the same WordNet synset)
  /// example: ocean → sea
  static const LexicalRelationType syn = _$syn;

  /// "Triggers" (words that are statistically associated with the query word in the same piece of text.)
  /// example: cow → milking
  static const LexicalRelationType trg = _$trg;

  /// Antonyms (per WordNet)
  /// example: late → early
  static const LexicalRelationType ant = _$ant;

  /// "Kind of" (direct hypernyms, per WordNet)
  /// example: gondola → boat
  static const LexicalRelationType spc = _$spc;

  /// "More general than" (direct hyponyms, per WordNet)
  /// example: boat → gondola
  static const LexicalRelationType gen = _$gen;

  /// "Comprises" (direct holonyms, per WordNet)
  /// example: car → accelerator
  static const LexicalRelationType com = _$com;

  /// "Part of" (direct meronyms, per WordNet)
  /// example: trunk → tree
  static const LexicalRelationType par = _$par;

  /// Frequent followers (w′ such that P(w′|w) ≥ 0.001, per Google Books Ngrams)
  /// example: wreak → havoc
  static const LexicalRelationType bga = _$bga;

  /// Frequent predecessors (w′ such that P(w|w′) ≥ 0.001, per Google Books Ngrams)
  /// example: havoc → wreak
  static const LexicalRelationType bgb = _$bgb;

  /// Rhymes ("perfect" rhymes, per RhymeZone)
  /// example: spade → aid
  static const LexicalRelationType rhy = _$rhy;

  /// Approximate rhymes (per RhymeZone)
  /// example: forest → chorus
  static const LexicalRelationType nry = _$nry;

  /// Homophones (sound-alike words)
  /// example: 	course → coarse
  static const LexicalRelationType hom = _$hom;

  /// Consonant match
  /// example: sample → simple
  static const LexicalRelationType cns = _$cns;

  static BuiltSet<LexicalRelationType> get values => _$values;

  static LexicalRelationType valueOf(String name) => _$valueOf(name);

  @override
  String toString() => name;
}
