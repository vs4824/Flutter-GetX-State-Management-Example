import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/character_model.dart';
import '../../../widgets/row.dart';

class CharacterDetailsView extends GetView {
  final Character character = Get.arguments;

  @override
  Widget build(BuildContext context) => view;

  Widget get view => Scaffold(
    appBar: appBar,
    body: body,
  );

  AppBar get appBar => AppBar(
    title: Text('Character Details'),
  );

  Widget get body => SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.network(
              character.image.toString(),
              width: 160,
              height: 160,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: Text(
              character.name.toString(),
              style: TextStyle(fontSize: 32),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TableRowDetails(
            title: 'Status',
            value: character.status.toString().replaceAll('Status.', ''),
          ),
          TableRowDetails(
            title: 'Species',
            value: character.species.toString().replaceAll('Species.', ''),
          ),
          TableRowDetails(
            title: 'Gender',
            value: character.gender.toString().replaceAll('Gender.', ''),
          ),
          TableRowDetails(
            title: 'Origin',
            value: character.origin?.name,
          ),
          TableRowDetails(
            title: 'Last Location',
            value: character.location?.name,
          )
        ],
      ),
    ),
  );
}