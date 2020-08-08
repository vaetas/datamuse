import 'package:datamuse/datamuse.dart';

Future<void> main() async {
  final client = Datamuse();

  // client.suggest('duc').then((value) {
  // print(value);
  // });

  final resultList = await client.query(
    meansLike: 'tape',
    metadata: [
      MetadataFlag.frequency,
      MetadataFlag.syllableCount,
      MetadataFlag.definitions,
    ],
    internationalPronunciation: true,
  );

  print(resultList.first);
}
