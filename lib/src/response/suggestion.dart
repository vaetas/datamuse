import 'package:json_annotation/json_annotation.dart';

part 'suggestion.g.dart';

@JsonSerializable()
class Suggestion {
  const Suggestion({
    required this.word,
    required this.score,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);

  final String word;
  final int score;

  Map<String, dynamic> toJson() => _$SuggestionToJson(this);

  @override
  String toString() => 'Suggestion{word: $word, score: $score}';
}
