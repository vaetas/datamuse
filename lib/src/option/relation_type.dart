///  Related word constraints: require that the results, when paired with the
///  word in this parameter, are in a predefined lexical relation indicated
///  by code. Any number of these parameters may be specified any number of
///  times. An assortment of semantic, phonetic, and corpus-statistics-based
///  relations are available. At this time, these relations are available for
///  English-language vocabularies only.
class LexicalRelationType {
  const LexicalRelationType._(this._name);

  final String _name;

  /// Popular nouns modified by the given adjective, per Google Books Ngrams
  /// example: gradual → increase
  static const LexicalRelationType jja = LexicalRelationType._('jja');

  /// Popular adjectives used to modify the given noun, per Google Books Ngrams
  /// example: beach → sandy
  static const LexicalRelationType jjb = LexicalRelationType._('jjb');

  /// Synonyms (words contained within the same WordNet synset)
  /// example: ocean → sea
  static const LexicalRelationType syn = LexicalRelationType._('syn');

  /// "Triggers" (words that are statistically associated with the query word in
  /// the same piece of text.)
  /// example: cow → milking
  static const LexicalRelationType trg = LexicalRelationType._('trg');

  /// Antonyms (per WordNet)
  /// example: late → early
  static const LexicalRelationType ant = LexicalRelationType._('ant');

  /// "Kind of" (direct hypernyms, per WordNet)
  /// example: gondola → boat
  static const LexicalRelationType spc = LexicalRelationType._('spc');

  /// "More general than" (direct hyponyms, per WordNet)
  /// example: boat → gondola
  static const LexicalRelationType gen = LexicalRelationType._('gen');

  /// "Comprises" (direct holonyms, per WordNet)
  /// example: car → accelerator
  static const LexicalRelationType com = LexicalRelationType._('com');

  /// "Part of" (direct meronyms, per WordNet)
  /// example: trunk → tree
  static const LexicalRelationType par = LexicalRelationType._('par');

  /// Frequent followers (w′ such that P(w′|w) ≥ 0.001, per Google Books Ngrams)
  /// example: wreak → havoc
  static const LexicalRelationType bga = LexicalRelationType._('bga');

  /// Frequent predecessors
  /// (w′ such that P(w|w′) ≥ 0.001, per Google Books Ngrams)
  /// example: havoc → wreak
  static const LexicalRelationType bgb = LexicalRelationType._('bgb');

  /// Rhymes ("perfect" rhymes, per RhymeZone)
  /// example: spade → aid
  static const LexicalRelationType rhy = LexicalRelationType._('rhy');

  /// Approximate rhymes (per RhymeZone)
  /// example: forest → chorus
  static const LexicalRelationType nry = LexicalRelationType._('nry');

  /// Homophones (sound-alike words)
  /// example: 	course → coarse
  static const LexicalRelationType hom = LexicalRelationType._('hom');

  /// Consonant match
  /// example: sample → simple
  static const LexicalRelationType cns = LexicalRelationType._('cns');

  @override
  String toString() => _name;
}
