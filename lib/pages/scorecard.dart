import 'package:flutter/material.dart';

class ScorecardScreen extends StatefulWidget {
  final String fightId; // Add any necessary parameters here

  const ScorecardScreen({Key? key, required this.fightId}) : super(key: key);

  @override
  State<ScorecardScreen> createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score Fight'),
      ),
      body: Center(
        child: Text('Fight ID: ${widget.fightId}'), // Display the fight ID or other relevant information
      ),
    );
  }
}
