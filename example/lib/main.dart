// ignore_for_file: avoid_print

import 'package:datamuse/datamuse.dart';

Future<void> main() async {
  final client = Datamuse();

  final suggestResult = await client.suggest('duc');
  print('[main] $suggestResult');

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
