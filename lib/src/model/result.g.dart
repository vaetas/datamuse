// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    word: json['word'] as String,
    score: json['score'] as int,
    tags: json['tags'] as List,
    numSyllables: json['numSyllables'] as int,
    definitions: json['defs'] as List,
    definitionHeadword: json['defHeadword'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'word': instance.word,
      'score': instance.score,
      'tags': instance.tags,
      'numSyllables': instance.numSyllables,
      'defs': instance.definitions,
      'defHeadword': instance.definitionHeadword,
    };
