import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text('Events List'),
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