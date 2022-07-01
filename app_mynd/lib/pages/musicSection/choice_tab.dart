import 'package:flutter/material.dart';

class ChoiceTab extends StatelessWidget {
  const ChoiceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.white,
        tabs: [
          Tab(text: 'Relaxamento'),
          Tab(text: 'Bem-estar'),
          Tab(text: 'Animação'),
          Tab(text: 'Foco'),
        ],
      ),
    );
  }
}