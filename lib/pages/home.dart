import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FightCard(),
          ],
        ),
      ),
    );
  }
}

class FightCard extends StatelessWidget {
  const FightCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Color(0xFFEAEAEA),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'EVENT',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text('MGM Grand'),
            Text(
              'Jan 20 2024',
              style: TextStyle(fontSize: 11.0),
            ),
            SizedBox(height: 10.0),
            FightColumn(),
          ],
        ),
      ),
    );
  }
}

class FightColumn extends StatelessWidget {
  const FightColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ListTile(
        leading: Icon(Icons.sports_mma_rounded),
        title: Text('Oleksandr Usyk vs Anthony Joshua'),
      ),
      const SizedBox(height: 10.0),
      ElevatedButton(
        onPressed: () {
          print('Score fight');
        },
        child: const Text('Score the Fight'),
      ),
      const SizedBox(height: 20.0),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: [Text('Analysis')],
          ),
          Column(
            children: [Text('Average')],
          ),
        ],
      ),
    ]);
  }
}
