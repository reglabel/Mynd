import 'dart:math';
import 'package:flutter/material.dart' hide Title;
import 'expandable.dart';
import 'title.dart';
import 'choice_tab.dart';
import 'models.dart';
import 'player.dart';
import 'song_tile.dart';

const coverImage =
    "https://cdn-s-www.ledauphine.com/images/C4A2656A-FDD7-40A0-A8F3-414D00B3A519/NW_raw/ariana-grande-en-janvier-2020-photo-frazer-harrison-getty-images-for-the-recording-academy-afp-1621312560.jpg";

const expandedHeight = 240.0;

class MusicPage extends StatefulWidget {
  const MusicPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final _controller = ScrollController();
  double _offset = 0;
  late final double _maxSizeBottomNavigationBar =
      MediaQuery.of(context).padding.bottom + kBottomNavigationBarHeight;

  late double _percentageOpen = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(moveOffset);
  }

  moveOffset() {
    setState(() {
      _offset = min(max(0, _controller.offset / 6 - 16), 32);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(moveOffset);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121421),
      body: ExpandableBottomSheet(
        background: CustomScrollView(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            
            // Used to get the stretch effect to not be above the SliverAppBar
            const SliverToBoxAdapter(),
            SliverAppBar(
              backgroundColor: Color(0xff121421),
              toolbarHeight: _offset + kToolbarHeight,
              title: Column(
                children: [
                  SizedBox(height: _offset),
                  const ChoiceTab(),
                ],
              ),
              primary: false,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SongTile(index: index);
                },
                childCount: listArianaGrandeAlbums.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
              ),
            ),
          ],
        ),
        persistentContentHeight: 64,
        expandableContent: Player(percentageOpen: _percentageOpen),
        onOffsetChanged: (offset, minOffset, maxOffset) {
          if (maxOffset == null || offset == null || minOffset == null) {
            return;
          }
          final range = maxOffset - minOffset;
          final currentOffset = offset - minOffset;
          setState(() {
            _percentageOpen = max(0, 1 - (currentOffset / range));
          });
        },
        enableToggle: true,
        isDraggable: true,
      ),
    );
  }
}
