import 'package:flutter/material.dart';

import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../common/sources.dart';

class StressTestScreen extends StatefulWidget {
  const StressTestScreen({Key? key}) : super(key: key);

  @override
  State<StressTestScreen> createState() => _StressTestScreenState();
}

class _StressTestScreenState extends State<StressTestScreen> {
  static const int count = 8;
  List<Player> players = [];
  List<VideoController> controllers = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        for (int i = 0; i < count; i++) {
          final player = Player();
          final controller = await VideoController.create(player);
          players.add(player);
          controllers.add(controller);
        }
        for (int i = 0; i < count; i++) {
          await players[i].open(
            Media(sources[i % sources.length]),
            play: true,
          );
          await players[i].setPlaylistMode(PlaylistMode.loop);
          await players[i].setVolume(0.0);
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    Future.microtask(() async {
      for (final e in controllers) {
        await e.dispose();
      }
      for (final e in players) {
        await e.dispose();
      }
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = controllers
        .map(
          (e) => Card(
            elevation: 4.0,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: Video(controller: e),
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('package:media_kit'),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 480.0,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 16.0 / 9.0,
        children: children,
      ),
    );
  }
}
