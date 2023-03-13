import 'package:get/get.dart';

import '../../../repo/api.dart';
import '../model/character_model.dart';

class CharacterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Character.fromJson(map);
    httpClient.baseUrl = API.BASE_URL;
  }

  Future<Response<List<Character>>> getCharacterPage({
    int? pageNumber,
  }) async =>
      await get(
        'character/',
        query: {
          'page': '$pageNumber',
        },
        decoder: (list) => list['results']
            .map<Character>((e) => Character.fromJson(e))
            .toList(),
      );

  Future<Response<Character>> getCharacter(int id) async =>
      await get('character/$id');
  Future<Response<Character>> postCharacter(Character character) async =>
      await post('character', character);
  Future<Response> deleteCharacter(int id) async =>
      await delete('character/$id');
}