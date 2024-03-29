# Datamuse API

![Pub Version](https://img.shields.io/pub/v/datamuse)

Library for using [Datamuse API](https://www.datamuse.com/api/) to find words using specific queries.

## Query

You can find words using specific queries.

```dart
Future<List<Result>> query({
    String? meansLike,
    String? soundsLike,
    String? spelledLike,
    List<LexicalRelation> relations = const [],
    Vocabulary vocabulary = Vocabulary.basic,
    List<String> topics = const [],
    String? leftContext,
    String? rightContext,
    int max = 100,
    List<MetadataFlag> metadata = const [],
    String? queryEcho,
    bool internationalPronunciation = false,
});
```

## Suggestions

You can use `suggest` call to get a list of possible suggestions for your query. This is useful
for autocompletion.

```dart
Future<List<Suggestion>> suggest(
    String query, {
    int max = 10,
    Vocabulary vocabulary = Vocabulary.basic,
});
```