import 'package:get/get.dart';
import '../../../data/provider/location_provider.dart';
import '../controllers/location_controller.dart';

class LocationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationProvider>(
          () => LocationProvider(),
    );

    Get.lazyPut<LocationsController>(
          () => LocationsController(
        Get.find(),
      ),
    );
  }
}