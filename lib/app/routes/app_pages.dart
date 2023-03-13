import 'package:get/get.dart';
import '../modules/character/bindings/character_binding.dart';
import '../modules/character/views/character_details_view.dart';
import '../modules/character/views/character_view.dart';
import '../modules/episodes/bindings/episode_binding.dart';
import '../modules/episodes/views/episode_details_view.dart';
import '../modules/episodes/views/episodes_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/locations/bindings/location_binding.dart';
import '../modules/locations/views/location_details_view.dart';
import '../modules/locations/views/location_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHARACTERS,
      page: () => CharactersView(),
      binding: CharactersBinding(),
    ),
    GetPage(
      name: _Paths.CHARACTERS_DETAILS,
      page: () => CharacterDetailsView(),
    ),
    GetPage(
      name: _Paths.LOCATIONS,
      page: () => LocationsView(),
      binding: LocationsBinding(),
    ),
    GetPage(
      name: _Paths.LOCATIONS_DETAILS,
      page: () => LocationDetailsView(),
    ),
    GetPage(
      name: _Paths.EPISODES,
      page: () => EpisodesView(),
      binding: EpisodesBinding(),
    ),
    GetPage(
      name: _Paths.EPISODES_DETAILS,
      page: () => EpisodeDetailsView(),
    ),
  ];
}