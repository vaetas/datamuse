import 'package:datamuse/src/model/option/vocabulary.dart';
import 'package:dio/dio.dart';

import 'model/option/metadata.dart';
import 'model/option/relation.dart';
import 'model/response/result.dart';
import 'model/response/suggestion.dart';

const _kDatamuseBaseUrl = 'https://api.datamuse.com/';

class Datamuse {
  final _dio = Dio(BaseOptions(baseUrl: _kDatamuseBaseUrl));

  /// This endpoint returns a list of words (and multiword expressions) from
  /// a given vocabulary that match a given set of constraints.
  ///
  /// [meansLike] require that the results have a meaning related to this string
  /// value, which can be any word or sequence of words. (This is effectively
  /// the [reverse dictionary](https://onelook.com/reverse-dictionary.shtml)
  /// feature of OneLook.)
  ///
  /// [soundsLike] require that the results are pronounced similarly
  /// to this string of characters. (If the string of characters doesn't have
  /// a known pronunciation, the system will make its best guess using
  /// a text-to-phonemes algorithm.)
  ///
  /// [spelledLike] require that the results are spelled similarly to this
  /// string of characters, or that they match this wildcard pattern. A pattern
  /// can include any combination of alphanumeric characters, spaces, and
  /// two reserved characters that represent placeholders — * (which matches
  /// any number of characters) and ? (which matches exactly one character).
  ///
  /// [relations] require that the results, when paired with the word in this
  /// parameter, are in a predefined [LexicalRelation]. Any number of these
  /// parameters may be specified any number of times. An assortment of semantic,
  /// phonetic, and corpus-statistics-based relations are available. At this
  /// time, these relations are available for English-language vocabularies only.
  ///
  /// [vocabulary] identifier for the vocabulary to use. If none is provided,
  /// a 550,000-term vocabulary of English words and multiword expressions is
  /// used. (The value `es` specifies a 500,000-term vocabulary of words from
  /// Spanish-language books. The value `enwiki` specifies an approximately
  /// 6 million-term vocabulary of article titles from the English-language
  /// Wikipedia, updated monthly.)
  ///
  /// [topics] an optional hint to the system about the theme of the document
  /// being written. Results will be skewed toward these topics. At most
  /// 5 words can be specified. Nouns work best.
  ///
  /// [leftContext] an optional hint to the system about the word that appears
  /// immediately to the left of the target word in a sentence. (At this time,
  /// only a single word may be specified.)
  ///
  /// [rightContext] an optional hint to the system about the word that appears
  /// immediately to the right of the target word in a sentence. (At this time,
  /// only a single word may be specified.)
  ///
  /// [max] maximum number of results to return, not to exceed 1000. (default: 100)
  ///
  /// [metadata] a list of [MetadataFlag] requesting that extra lexical knowledge
  /// be included with the results.
  ///
  /// [queryEcho] the presence of this parameter asks the system to prepend
  /// a result to the output that describes the query string from some other
  /// parameter, specified as the argument value. This is useful for looking
  /// up metadata about specific words. For example, `/words?sp=flower&qe=sp&md=fr`
  /// can be used to get the pronunciation and word frequency for flower.
  ///
  /// [internationalPronunciation] The format of the pronunication is
  /// a space-delimited list of [Arpabet](https://en.wikipedia.org/wiki/ARPABET)
  /// phoneme codes. If you add [MetadataFlag.pronunciation] to your query, the pronunciation
  /// string will instead use the [International Phonetic Alphabet](https://en.wikipedia.org/wiki/International_Phonetic_Alphabet).
  Future<List<Result>> query({
    String meansLike,
    String soundsLike,
    String spelledLike,
    List<LexicalRelation> relations = const [],
    Vocabulary vocabulary = Vocabulary.basic,
    List<String> topics = const [],
    String leftContext,
    String rightContext,
    int max = 100,
    List<MetadataFlag> metadata = const [],
    String queryEcho,
    bool internationalPronunciation = false,
  }) async {
    final parameters = <String, String>{};

    if (meansLike != null) {
      parameters['ml'] = meansLike;
    }

    if (soundsLike != null) {
      parameters['sl'] = soundsLike;
    }

    if (spelledLike != null) {
      parameters['sp'] = spelledLike;
    }

    for (var r in relations) {
      parameters[r.typeQuery] = r.value;
    }

    if (vocabulary != Vocabulary.basic) {
      parameters['v'] = vocabulary.toString();
    }

    if (topics.isNotEmpty) {
      parameters['topics'] = topics.join(',');
    }

    if (leftContext != null) {
      parameters['lc'] = leftContext;
    }

    if (rightContext != null) {
      parameters['rc'] = rightContext;
    }

    if (max > 1000) {
      throw ArgumentError('Maximum number of results cannot exceed 1000.');
    } else {
      parameters['max'] = '$max';
    }

    if (metadata.isNotEmpty) {
      parameters['md'] = metadata.join('');
    }

    if (queryEcho != null) {
      parameters['qe'] = queryEcho;
    }

    if (internationalPronunciation) {
      parameters['ipa'] = '1';
    }

    final response = await _dio.get('words', queryParameters: parameters);
    final data = response.data as List<dynamic>;

    return data.map((e) => Result.fromJson(e)).toList();
  }

  /// This resource is useful as a backend for “autocomplete” widgets on
  /// websites and apps when the vocabulary of possible search terms is very
  /// large. It provides word suggestions given a partially-entered query
  /// using a combination of the operations described in the “/words” resource
  /// above. The suggestions perform live spelling correction and intelligently
  /// fall back to choices that are phonetically or semantically similar when
  /// an exact prefix match can't be found.
  ///
  /// [query] prefix hint string; typically, the characters that the user has
  /// entered so far into a search box. (Note: The results are sorted by
  /// a measure of popularity. The results may include spell-corrections of the
  /// prefix hint or semantically similar terms when exact matches cannot be
  /// found; that is to say, the prefix hint will not necessarily form
  /// a prefix of each result.)
  ///
  /// [max] maximum number of results to return, not to exceed 1000. (default: 10)
  ///
  /// [vocabulary] identifier for the vocabulary to use. Equivalent to
  /// the [vocabulary] parameter in /words.
  Future<List<Suggestion>> suggest(
    String query, {
    int max = 10,
    Vocabulary vocabulary = Vocabulary.basic,
  }) async {
    final parameters = <String, String>{};

    parameters['s'] = query;

    if (max > 1000 || max < 0) {
      throw ArgumentError('Maximum number must be between 0 and 1000.');
    } else {
      parameters['max'] = '$max';
    }

    if (vocabulary != Vocabulary.basic) {
      parameters['v'] = vocabulary.toString();
    }

    final response = await _dio.get('sug', queryParameters: parameters);
    final data = response.data as List<dynamic>;

    return data.map((e) => Suggestion.fromJson(e)).toList();
  }
}
