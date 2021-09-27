/// Identifier for the vocabulary to use.
class Vocabulary {
  const Vocabulary._(this._name);

  final String _name;

  /// (Default) A 550,000-term vocabulary of English words and multiword
  /// expressions is used.
  static const Vocabulary basic = Vocabulary._('basic');

  /// Specifies a 500,000-term vocabulary of words from Spanish-language books
  static const Vocabulary es = Vocabulary._('es');

  /// Specifies an approximately million-term vocabulary of article titles from
  /// the English-language Wikipedia updated monthly.
  static const Vocabulary enwiki = Vocabulary._('enwiki');

  static List<Vocabulary> get values => [basic, es, enwiki];

  static Vocabulary valueOf(String name) {
    switch (name) {
      case 'basic':
        return basic;
      case 'es':
        return es;
      case 'enwiki':
        return enwiki;
      default:
        throw ArgumentError('Invalid Vocabulary: $name');
    }
  }

  @override
  String toString() => _name;
}
