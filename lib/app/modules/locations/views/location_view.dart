import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../../routes/app_pages.dart';
import '../controllers/location_controller.dart';

class LocationsView extends GetView<LocationsController> {
  @override
  Widget build(BuildContext context) => view;

  Widget get view => Scaffold(
    appBar: appBar,
    body: body,
  );

  AppBar get appBar => AppBar(
    title: Text('Locations List'),
  );

  Widget get body => Obx(
        () => LazyLoadScrollView(
      onEndOfPage: controller.next,
      isLoading: controller.isLoading.value,
      child: ListView.builder(
        itemCount: controller.locations.length,
        itemBuilder: (context, index) {
          final _location = controller.locations[index];

          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Get.toNamed(
              Routes.LOCATION_DETAILS,
              arguments: _location,
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 16, 24, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        _location.name.toString(),
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    height: 12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}