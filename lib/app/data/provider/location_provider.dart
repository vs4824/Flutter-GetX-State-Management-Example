import 'package:get/get.dart';

import '../../../repo/api.dart';
import '../model/location_model.dart';


class LocationProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Location.fromJson(map);
    httpClient.baseUrl = API.BASE_URL;
  }

  Future<Response<List<Location>>> getLocationPage({
    int? pageNumber,
  }) async =>
      await get(
        'location/',
        query: {
          'page': '$pageNumber',
        },
        decoder: (list) =>
            list['results'].map<Location>((e) => Location.fromJson(e)).toList(),
      );

  Future<Response<Location>> getLocation(int id) async =>
      await get('location/$id');
  Future<Response<Location>> postLocation(Location location) async =>
      await post('location', location);
  Future<Response> deleteLocation(int id) async => await delete('location/$id');
}