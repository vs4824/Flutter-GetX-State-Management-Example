import 'package:get/get.dart';
import '../../../data/provider/episode_provider.dart';
import '../controllers/episode_controller.dart';

class EpisodesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EpisodeProvider>(
          () => EpisodeProvider(),
    );

    Get.lazyPut<EpisodesController>(
          () => EpisodesController(
        Get.find(),
      ),
    );
  }
}