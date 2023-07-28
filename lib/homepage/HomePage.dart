import 'package:flutter/material.dart';

import '../util/BackgroundWaveClipper.dart';
import '../util/SliverSearchAppBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           const SliverPersistentHeader(
            delegate: SliverSearchAppBar(),
            pinned: true,
          ),
          SliverList(
              delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Cruelty-free brand',
                      style: TextStyle(fontSize: 20),
                    ));
              },
                  childCount: 20)
          )
        ],
      ),
    );
  }
}
