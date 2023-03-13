import 'package:get/get.dart';
import '../../../repo/api.dart';
import '../model/episode_model.dart';

class EpisodeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Episode.fromJson(map);
    httpClient.baseUrl = API.BASE_URL;
  }

  Future<Response<List<Episode>>> getEpisodePage({
    int? pageNumber,
  }) async =>
      await get(
        'episode/',
        query: {
          'page': '$pageNumber',
        },
        decoder: (list) => list['results']
            .map<Episode>((e) => Episode.fromJson(e))
            .toList(),
      );

  Future<Response<Episode>> getEpisode(int id) async =>
      await get('episode/$id');
  Future<Response<Episode>> postEpisode(Episode episode) async =>
      await post('episode', episode);
  Future<Response> deleteEpisode(int id) async => await delete('episode/$id');
}