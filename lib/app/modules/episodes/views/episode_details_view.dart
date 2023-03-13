import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/episode_model.dart';
import '../../../widgets/row.dart';

class EpisodeDetailsView extends GetView {
  final Episode episode = Get.arguments;

  @override
  Widget build(BuildContext context) => view;

  Widget get view => Scaffold(
    appBar: appBar,
    body: body,
  );

  AppBar get appBar => AppBar(
    title: Text('Episode Details'),
  );

  Widget get body => Container(
    margin: EdgeInsets.all(24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 24,
        ),
        Center(
          child: Text(
            episode.name.toString(),
            style: TextStyle(fontSize: 32),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TableRowDetails(
          title: 'Episode',
          value: episode.episode,
        ),
        TableRowDetails(
          title: 'Air Date',
          value: episode.airDate,
        ),
      ],
    ),
  );
}