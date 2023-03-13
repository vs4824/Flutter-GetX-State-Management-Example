import 'package:get/get.dart';
import '../../../data/provider/character_provider.dart';
import '../controllers/character_controller.dart';

class CharactersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterProvider>(
          () => CharacterProvider(),
    );

    Get.lazyPut<CharactersController>(
          () => CharactersController(
        Get.find(),
      ),
    );
  }
}