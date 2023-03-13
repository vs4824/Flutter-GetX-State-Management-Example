import 'package:get/get.dart';
import '../../../data/model/character_model.dart';
import '../../../data/provider/character_provider.dart';

class CharactersController extends GetxController {
  var page = 0.obs;
  var isLoading = false.obs;

  final _characters = <Character>[].obs;
  List<Character> get characters => _characters.toList();

  final CharacterProvider characterProvider;

  CharactersController(this.characterProvider);

  @override
  void onInit() {
    ever(page, (_) => _getAllCharacters());
    page++;
    super.onInit();
  }

  Future<void> _getAllCharacters() async {
    isLoading.value = true;
    try {
      final response =
      await characterProvider.getCharacterPage(pageNumber: page.value);

      _characters.addAll(response.body as Iterable<Character>);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  void next() => page++;
}