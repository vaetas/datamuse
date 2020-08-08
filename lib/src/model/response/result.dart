import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  final String word;

  final int score;

  @JsonKey(nullable: true)
  final List<dynamic> tags;

  @JsonKey(nullable: true)
  final int numSyllables;

  @JsonKey(name: 'defs', nullable: true)
  final List<dynamic> definitions;

  @JsonKey(name: 'defHeadword', nullable: true)
  final String definitionHeadword;

  Result({
    @required this.word,
    @required this.score,
    this.tags,
    this.numSyllables,
    this.definitions,
    this.definitionHeadword,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  String toString() {
    return 'Result{word: $word, score: $score, tags: $tags, numSyllables: $numSyllables, definitions: $definitions, definitionHeadword: $definitionHeadword}';
  }
}
