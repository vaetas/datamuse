import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'suggestion.g.dart';

@JsonSerializable()
class Suggestion {
  final String word;
  final int score;

  Suggestion({
    @required this.word,
    @required this.score,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionToJson(this);

  @override
  String toString() => 'Suggestion{word: $word, score: $score}';
}
