import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:islami/features/radio/data/radio_repository.dart';

void main() {
  late RadioRepository repository;

  setUp(() {
    repository = RadioRepository(
      client: MockClient((request) async {
        return http.Response(
          '{"reciters":[{"id":"1","name":"Test Reciter","Server":"https://srv.com/audio","rewaya":"Hafs","count":"2","letter":"T","suras":"1,2"}]}',
          200,
        );
      }),
    );
  });

  test('fetchReciters returns parsed reciters on success', () async {
    final reciters = await repository.fetchReciters();

    expect(reciters, hasLength(1));
    expect(reciters.first.id, '1');
    expect(reciters.first.name, 'Test Reciter');
    expect(reciters.first.server, 'https://srv.com/audio');
    expect(reciters.first.rewaya, 'Hafs');
    expect(reciters.first.count, 2);
    expect(reciters.first.letter, 'T');
    expect(reciters.first.surahs, [1, 2]);
  });

  test('fetchReciters throws on non-200 response', () async {
    repository = RadioRepository(
      client: MockClient((request) async => http.Response('Not Found', 404)),
    );

    expect(() => repository.fetchReciters(), throwsException);
  });
}
