import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../../routes/app_pages.dart';
import '../controllers/character_controller.dart';

class CharactersView extends GetView<CharactersController> {
  @override
  Widget build(BuildContext context) => view;

  Widget get view => Scaffold(
    appBar: appBar,
    body: body,
  );

  AppBar get appBar => AppBar(title: Text('Characters List'));

  Widget get body => Obx(
        () => LazyLoadScrollView(
      onEndOfPage: controller.next,
      isLoading: controller.isLoading.value,
      child: ListView.builder(
        itemCount: controller.characters.length,
        itemBuilder: (context, index) {
          final _character = controller.characters[index];

          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Get.toNamed(
              Routes.CHARACTER_DETAILS,
              arguments: _character,
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 16, 24, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Image.network(
                          _character.image.toString(),
                          width: 64,
                          height: 64,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          _character.name.toString(),
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
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