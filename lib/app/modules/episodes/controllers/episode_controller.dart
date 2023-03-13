import 'package:get/get.dart';
import '../../../data/model/episode_model.dart';
import '../../../data/provider/episode_provider.dart';

class EpisodesController extends GetxController {
  var page = 0.obs;
  var isLoading = false.obs;

  final _episodes = <Episode>[].obs;
  List<Episode> get episodes => _episodes.toList();

  final EpisodeProvider episodeProvider;

  EpisodesController(this.episodeProvider);

  @override
  void onInit() {
    ever(page, (_) => _getAllEpisodes());
    page++;
    super.onInit();
  }

  Future<void> _getAllEpisodes() async {
    isLoading.value = true;
    try {
      final response =
      await episodeProvider.getEpisodePage(pageNumber: page.value);

      _episodes.addAll(response.body as Iterable<Episode>);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  void next() => page++;
}