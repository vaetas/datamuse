import 'package:datamuse/datamuse.dart';

void main() {
  final client = Datamuse();

  client.suggest('duc').then((value) {
    print(value);
  });
}
