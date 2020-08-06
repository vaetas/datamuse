import 'package:datamuse/src/model/metadata.dart';
import 'package:datamuse/src/model/relation.dart';
import 'package:datamuse/src/model/result.dart';
import 'package:datamuse/src/model/suggestion.dart';
import 'package:dio/dio.dart';

export 'src/model/metadata.dart';
export 'src/model/relation.dart';
export 'src/model/relation_type.dart';
export 'src/model/suggestion.dart';
export 'src/model/result.dart';

const _kDatamuseBaseUrl = 'https://api.datamuse.com/';

class Datamuse {
  final _dio = Dio(BaseOptions(baseUrl: _kDatamuseBaseUrl));

  /// This endpoint returns a list of words (and multiword expressions) from
  /// a given vocabulary that match a given set of constraints.
  ///
  /// [meansLike] requires that the results have a meaning related to this string
  /// value, which can be any word or sequence of words. (This is effectively
  /// the [reverse dictionary](https://onelook.com/reverse-dictionary.shtml)
  /// feature of OneLook.)
  Future<dynamic> query({
    String meansLike,
    String soundsLike,
    String spelledLike,
    List<LexicalRelation> relations = const [],
    String vocabulary,
    List<String> topics = const [],
    String leftContext,
    String rightContext,
    List<MetadataFlag> metadata = const [],
    int max = 100,
    String queryEcho,
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
      parameters[r.typeQuery] = r.parameter;
    }

    if (vocabulary != null) {
      parameters[vocabulary] = vocabulary;
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
      throw ArgumentError('Maximum number of result cannot exceed 1000.');
    } else {
      parameters['max'] = '$max';
    }

    if (metadata.isNotEmpty) {
      parameters['md'] = metadata.join('');
    }

    if (queryEcho != null) {
      parameters['qe'] = queryEcho;
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
  Future<List<Suggestion>> suggest(
    String query, {
    int max = 10,
    String vocabulary,
  }) async {
    final parameters = <String, String>{};

    parameters['s'] = query;

    if (max > 1000 || max < 0) {
      throw ArgumentError('Maximum number must be between 0 and 1000.');
    } else {
      parameters['max'] = '$max';
    }

    if (vocabulary != null) {
      parameters['v'] = vocabulary;
    }

    final response = await _dio.get('sug', queryParameters: parameters);
    final data = response.data as List<dynamic>;

    return data.map((e) => Suggestion.fromJson(e)).toList();
  }
}
