import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text('Analysis'),
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
