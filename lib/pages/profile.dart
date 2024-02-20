import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text('Profile Page'),
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