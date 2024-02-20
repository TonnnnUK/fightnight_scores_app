import 'package:flutter/material.dart';

class BoxersPage extends StatelessWidget {
  const BoxersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text('Boxers'),
        ),
        // for (var pair in appState.favorites)
        //   ListTile(
        //     leading: Icon(Icons.favorite),
        //     title: Text(pair.asLowerCase),
        //   ),
      ],
    );
  }
}
