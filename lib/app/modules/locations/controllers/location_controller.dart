import 'package:get/get.dart';
import '../../../data/model/location_model.dart';
import '../../../data/provider/location_provider.dart';

class LocationsController extends GetxController {
  var page = 0.obs;
  var isLoading = false.obs;

  final _locations = <Location>[].obs;
  List<Location> get locations => _locations.toList();

  final LocationProvider locationProvider;

  LocationsController(this.locationProvider);

  @override
  void onInit() {
    ever(page, (_) => _getAllLocations());
    page++;
    super.onInit();
  }

  Future<void> _getAllLocations() async {
    isLoading.value = true;
    try {
      final response =
      await locationProvider.getLocationPage(pageNumber: page.value);

      _locations.addAll(response.body as Iterable<Location>);
    } catch (e) {
      print(e);
      rethrow;
    }
    isLoading.value = false;
  }

  void next() => page++;
}