import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../../routes/app_pages.dart';
import '../controllers/episode_controller.dart';

class EpisodesView extends GetView<EpisodesController> {
  @override
  Widget build(BuildContext context) => view;

  Widget get view => Scaffold(
    appBar: appBar,
    body: body,
  );

  AppBar get appBar => AppBar(title: Text('Episodes List'));

  Widget get body => Obx(
        () => LazyLoadScrollView(
      onEndOfPage: controller.next,
      isLoading: controller.isLoading.value,
      child: ListView.builder(
        itemCount: controller.episodes.length,
        itemBuilder: (context, index) {
          final _episode = controller.episodes[index];

          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Get.toNamed(
              Routes.EPISODE_DETAILS,
              arguments: _episode,
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 16, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _episode.name.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        _episode.episode.toString(),
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