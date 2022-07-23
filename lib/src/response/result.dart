import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  const Result({
    required this.word,
    required this.score,
    this.tags,
    this.numSyllables,
    this.definitions,
    this.definitionHeadword,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  final String word;

  final int? score;

  @JsonKey()
  final List<dynamic>? tags;

  @JsonKey()
  final int? numSyllables;

  @JsonKey(name: 'defs')
  final List<dynamic>? definitions;

  @JsonKey(name: 'defHeadword')
  final String? definitionHeadword;

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  String toString() {
    return 'Result{word: $word, score: $score, tags: $tags, '
        'numSyllables: $numSyllables, definitions: $definitions, '
        'definitionHeadword: $definitionHeadword}';
  }
}
