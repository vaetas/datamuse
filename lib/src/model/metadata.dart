import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'metadata.g.dart';

/// Metadata flags: A list of codes requesting that extra lexical knowledge
/// be included with the results.
class MetadataFlag extends EnumClass {
  const MetadataFlag._(String name) : super(name);

  /// Produced in the `defs` field of the result object. The definitions are
  /// from WordNet. If the word is an inflected form (such as the plural of
  /// a noun or a conjugated form of a verb), then an additional `defHeadword`
  /// field will be added indicating the base form from which the definitions
  /// are drawn.
  static const MetadataFlag definitions = _$definitions;

  /// One or more part-of-speech codes will be added to the `tags` field of the
  /// result object. "n" means noun, "v" means verb, "adj" means adjective,
  /// "adv" means adverb, and "u" means that the part of speech is none of
  /// these or cannot be determined. Multiple entries will be added when the
  /// word's part of speech is ambiguous, with the most popular part of speech
  /// listed first. This field is derived from an analysis of Google Books Ngrams data.
  static const MetadataFlag parts = _$parts;

  /// Produced in the `numSyllables` field of the result object. In certain cases
  /// the number of syllables may be ambiguous, in which case the system's best
  /// guess is chosen based on the entire query.
  static const MetadataFlag syllableCount = _$syllableCount;

  /// Produced in the `tags` field of the result object, prefixed by "pron:".
  /// This is the system's best guess for the pronunciation of the word or
  /// phrase. The format of the pronunciation is a space-delimited list of
  /// Arpabet phoneme codes. If you add `&ipa=1` to your API query, the
  /// pronunciation string will instead use the International Phonetic Alphabet.
  /// Note that for terms that are very rare or outside of the vocabulary,
  /// the pronunciation will be guessed based on the spelling. In certain cases
  /// the pronunciation may be ambiguous, in which case the system's best guess
  /// is chosen based on the entire query.
  static const MetadataFlag pronunciation = _$pronunciation;

  /// Produced in the `tags` field of the result object, prefixed by "f:". The
  /// value is the number of times the word (or multi-word phrase) occurs per
  /// million words of English text according to Google Books Ngrams.
  static const MetadataFlag frequency = _$frequency;

  static BuiltSet<MetadataFlag> get values => _$values;

  static MetadataFlag valueOf(String name) => _$valueOf(name);

  @override
  String toString() => name;
}
