import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FightCard(),
              FightCard(),
              FightCard(),
              FightCard(),
              FightCard(),
              FightCard(),
              FightCard(),
              FightCard(),
              FightCard(),
            ],
          ),
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Card(
        color: Color(0xFFECF7FC),
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
              FightColumn(),
              FightColumn(),
            ],
          ),
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
      const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Oleksandr Usyk',
          style:
              TextStyle(color: Color(0xFF1C1A96), fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5.0),
        Text('vs'),
        SizedBox(width: 5.0),
        Text(
          'Anthony Joshua',
          style:
              TextStyle(color: Color(0xFF961A1A), fontWeight: FontWeight.bold),
        ),
      ]),
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
      SizedBox(height: 10.0),
      Divider(height: 10.0,thickness: 1.0, color: Color(0xFF7C7C7C)),
      SizedBox(height: 30.0,)
    ]);
  }
}
